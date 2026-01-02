#!/bin/bash
set -e

# Cores para logs
GREEN='\033[0;32m'
NC='\033[0m' 

USER_NAME=$(whoami)
PROJECT_DIR=$(pwd)
VENV_DIR="$PROJECT_DIR/venv"
SERVICE_FILE="/etc/systemd/system/gps-tracker.service"

echo -e "${GREEN}🚀 Iniciando instalacao do Luke Tracker...${NC}"

# 1. Instalar dependencias do sistema
echo -e "${GREEN}📦 Atualizando sistema e instalando dependencias...${NC}"
sudo apt update
sudo apt install -y python3-venv python3-pip ufw

# 2. Configurar Firewall
echo -e "${GREEN}🛡️ Configurando Firewall (Porta 9080)...${NC}"
sudo ufw allow 9080/tcp
sudo ufw allow ssh
sudo ufw --force enable

# 3. Criar Ambiente Virtual Python
echo -e "${GREEN}🐍 Configurando ambiente Python...${NC}"
if [ ! -d "$VENV_DIR" ]; then
    python3 -m venv "$VENV_DIR"
fi

source "$VENV_DIR/bin/activate"
pip install --upgrade pip

if [ -f "$PROJECT_DIR/backend/requirements.txt" ]; then
    pip install -r "$PROJECT_DIR/backend/requirements.txt"
else
    echo "Erro: requirements.txt nao encontrado em backend/"
    exit 1
fi

# 4. Configurar .env e Token Seguro
echo -e "${GREEN}🔐 Verificando configuracao de seguranca...${NC}"
if [ ! -f "$PROJECT_DIR/.env" ]; then
    echo "Criando arquivo .env a partir do exemplo..."
    if [ -f "$PROJECT_DIR/.env.example" ]; then
        cp "$PROJECT_DIR/.env.example" "$PROJECT_DIR/.env"
        
        # Gerar Token aleatorio
        NEW_TOKEN=$(openssl rand -hex 32)
        sed -i "s/YOUR_GENERATED_HEX_TOKEN/$NEW_TOKEN/" "$PROJECT_DIR/.env"
        
        echo "✅ Token de seguranca gerado: $NEW_TOKEN"
        echo "⚠️  IMPORTANTE: Edite o arquivo .env para colocar seus dados do Telegram!"
    else
        echo "Aviso: .env.example nao encontrado."
    fi
else
    echo "Arquivo .env ja existe. Mantendo configuracao atual."
fi

# 5. Configurar Systemd (Servico)
echo -e "${GREEN}⚙️ Criando servico Systemd...${NC}"

# Cria o arquivo de servico dinamicamente com os caminhos corretos
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

# 6. Ativar e Iniciar
echo -e "${GREEN}🚀 Iniciando o servico...${NC}"
sudo systemctl daemon-reload
sudo systemctl enable gps-tracker
sudo systemctl restart gps-tracker

# 7. Permissoes Finais
sudo chown -R $USER_NAME:$USER_NAME $PROJECT_DIR

echo -e "${GREEN}✅ Instalacao concluida com sucesso!${NC}"
echo -e "Status do servico:"
sudo systemctl status gps-tracker --no-pager
