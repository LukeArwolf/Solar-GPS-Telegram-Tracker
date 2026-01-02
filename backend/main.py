from fastapi import FastAPI, Depends, HTTPException, Request
from fastapi.responses import HTMLResponse
from fastapi.templating import Jinja2Templates
from fastapi.staticfiles import StaticFiles
from sqlalchemy.orm import Session
from datetime import datetime
from typing import Optional
from pydantic import BaseModel
import os
import models, database, utils

models.Base.metadata.create_all(bind=database.engine)

app = FastAPI()
app.mount("/static", StaticFiles(directory="static"), name="static")
templates = Jinja2Templates(directory="templates")

class TrackData(BaseModel):
    device_id: str
    lat: float
    lon: float
    battery: Optional[int] = None
    ssid: str
    token: str

@app.post("/api/track")
def receive_track(data: TrackData, db: Session = Depends(database.get_db)):
    if data.token != os.getenv("API_SECRET_TOKEN"):
        raise HTTPException(status_code=401, detail="Invalid Token")

    last_location = db.query(models.Location).filter(
        models.Location.device_id == data.device_id
    ).order_by(models.Location.timestamp.desc()).first()

    if last_location and last_location.network_ssid != data.ssid:
        msg = f"📡 *TROCA DE REDE DETECTADA*\n\n🔄 De: {last_location.network_ssid}\n✅ Para: {data.ssid}\n🔋 Bateria: {data.battery}%"
        utils.send_telegram_alert(msg)

    existing_address = None
    all_addresses = db.query(models.Address).all()
    for addr in all_addresses:
        dist = utils.calculate_distance(data.lat, data.lon, addr.lat, addr.lon)
        if dist <= 50:
            existing_address = addr
            break
    
    if not existing_address:
        fmt_address = utils.get_address_from_coords(data.lat, data.lon)
        new_addr = models.Address(lat=data.lat, lon=data.lon, formatted_address=fmt_address)
        db.add(new_addr)
        db.commit()
        db.refresh(new_addr)
        existing_address = new_addr

    new_location = models.Location(
        device_id=data.device_id,
        lat=data.lat,
        lon=data.lon,
        battery=data.battery,
        network_ssid=data.ssid,
        address_id=existing_address.id
    )
    db.add(new_location)
    db.commit()
    
    utils.get_logger().info(f"{data.device_id} | {data.ssid} | {data.lat},{data.lon}")

    last_stay = db.query(models.Stay).filter(
        models.Stay.device_id == data.device_id
    ).order_by(models.Stay.start_time.desc()).first()
    
    current_time = datetime.now()
    
    if last_stay and not last_stay.end_time:
        stay_addr = db.query(models.Address).filter(models.Address.id == last_stay.address_id).first()
        dist_from_stay = utils.calculate_distance(data.lat, data.lon, stay_addr.lat, stay_addr.lon)
        
        if dist_from_stay <= 50:
            duration = (current_time - last_stay.start_time).total_seconds()
            last_stay.duration_sec = duration
            if duration > 1800 and not last_stay.alert_sent:
                utils.send_telegram_alert(f"🚨 *PARADO HÁ 30 MIN*\n📍 {stay_addr.formatted_address}")
                last_stay.alert_sent = True
            db.commit()
        else:
            last_stay.end_time = current_time
            db.commit()
            new_stay = models.Stay(device_id=data.device_id, address_id=existing_address.id, start_time=current_time)
            db.add(new_stay)
            db.commit()
    else:
        new_stay = models.Stay(device_id=data.device_id, address_id=existing_address.id, start_time=current_time)
        db.add(new_stay)
        db.commit()

    return {"status": "ok"}

@app.get("/map", response_class=HTMLResponse)
def page_map(request: Request, db: Session = Depends(database.get_db)):
    points = db.query(models.Location).order_by(models.Location.timestamp.desc()).limit(500).all()
    return templates.TemplateResponse("map.html", {"request": request, "points": points})

@app.get("/logs", response_class=HTMLResponse)
def page_logs(request: Request, db: Session = Depends(database.get_db)):
    logs_db = db.query(models.Location).order_by(models.Location.timestamp.desc()).limit(100).all()
    data = []
    for loc in logs_db:
        addr = db.query(models.Address).filter(models.Address.id == loc.address_id).first()
        data.append({
            "time": loc.timestamp,
            "lat": loc.lat,
            "lon": loc.lon,
            "ssid": loc.network_ssid,
            "address": addr.formatted_address if addr else "N/A"
        })
    return templates.TemplateResponse("logs.html", {"request": request, "logs": data})
