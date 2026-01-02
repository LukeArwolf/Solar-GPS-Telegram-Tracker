from sqlalchemy import Column, Integer, String, Float, DateTime, ForeignKey, Boolean
from sqlalchemy.sql import func
from database import Base

class Address(Base):
    __tablename__ = "addresses"
    id = Column(Integer, primary_key=True, index=True)
    lat = Column(Float, index=True)
    lon = Column(Float, index=True)
    formatted_address = Column(String)
    created_at = Column(DateTime(timezone=True), server_default=func.now())

class Location(Base):
    __tablename__ = "locations"
    id = Column(Integer, primary_key=True, index=True)
    device_id = Column(String, index=True)
    lat = Column(Float)
    lon = Column(Float)
    battery = Column(Integer, nullable=True)
    network_ssid = Column(String, nullable=True)
    address_id = Column(Integer, ForeignKey("addresses.id"), nullable=True)
    timestamp = Column(DateTime(timezone=True), server_default=func.now())

class Stay(Base):
    __tablename__ = "stays"
    id = Column(Integer, primary_key=True, index=True)
    device_id = Column(String)
    address_id = Column(Integer, ForeignKey("addresses.id"))
    start_time = Column(DateTime(timezone=True))
    end_time = Column(DateTime(timezone=True))
    duration_sec = Column(Integer, default=0)
    alert_sent = Column(Boolean, default=False)
