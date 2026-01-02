#!/bin/bash
set -e
GREEN='\033[0;32m'
NC='\033[0m' 
USER_NAME=$(whoami)
PROJECT_DIR=$(pwd)
VENV_DIR="$PROJECT_DIR/venv"
SERVICE_FILE="/etc/systemd/system/gps-tracker.service"

echo -e "${GREEN}🚀 Instalando Luke Tracker...${NC}"

sudo apt update
sudo apt install -y python3-venv python3-pip ufw

sudo ufw allow 9080/tcp
sudo ufw allow ssh
sudo ufw --force enable

if [ ! -d "$VENV_DIR" ]; then
    python3 -m venv "$VENV_DIR"
fi

source "$VENV_DIR/bin/activate"
pip install --upgrade pip
pip install -r "$PROJECT_DIR/backend/requirements.txt"

if [ ! -f "$PROJECT_DIR/.env" ]; then
    if [ -f "$PROJECT_DIR/.env.example" ]; then
        cp "$PROJECT_DIR/.env.example" "$PROJECT_DIR/.env"
        NEW_TOKEN=$(openssl rand -hex 32)
        sed -i "s/YOUR_GENERATED_HEX_TOKEN/$NEW_TOKEN/" "$PROJECT_DIR/.env"
        echo "✅ Token gerado no .env"
    fi
fi

echo -e "${GREEN}⚙️ Configurando Systemd...${NC}"
cat <<EOF | sudo tee $SERVICE_FILE
[Unit]
Description=Luke Tracker Backend
After=network.target

[Service]
User=$USER_NAME
Group=$USER_NAME
WorkingDirectory=$PROJECT_DIR/backend
Environment="PATH=$VENV_DIR/bin:/usr/local/bin:/usr/bin:/bin"
ExecStart=$VENV_DIR/bin/uvicorn main:app --host 0.0.0.0 --port 9080
Restart=always

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable gps-tracker
sudo systemctl restart gps-tracker
sudo chown -R $USER_NAME:$USER_NAME $PROJECT_DIR
echo -e "${GREEN}✅ Sucesso!${NC}"