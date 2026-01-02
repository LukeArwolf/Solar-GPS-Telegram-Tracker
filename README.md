# Luke Tracker - Solar GPS System

![License](https://img.shields.io/badge/license-MIT-blue)
![Python](https://img.shields.io/badge/python-3.9+-yellow)
![Platform](https://img.shields.io/badge/platform-ESP32%20%7C%20Linux-green)

**Professional GPS Tracking System with VPS Backend, Telegram Integration, and Smart Wi-Fi Management.**

---

### Languages

- [English](#english-instructions)
- [Portuguese](#portuguese-instructions)
- [French](#french-instructions)
- [Japanese](#japanese-instructions)

---

## English Instructions

### Overview
A robust tracking system designed for VPS Linux (Backend) and ESP32 (Hardware), focusing on connectivity resilience and data integrity.

### Advanced Features

**Smart Wi-Fi Engine**
- Prioritizes trusted networks (Home/Work) over mobile hotspots.
- Automatic 4G fallback when primary networks are unavailable.
- Intelligent reconnection strategy to maintain uptime.

**Security & Reliability**
- Device authentication via secure cryptographic token.
- Optional HTTPS support for encrypted data transmission.
- Rate-limit ready design concept.

**Real-Time Tracking**
- Live map updates via Web Interface.
- Persistent logging and historical tracking.
- Reverse Geocoding (Coordinates to Address).

**Automation & Stability**
- Resilient retry mechanism for failed transmissions.
- Watchdog and fault recovery mindset.
- Offline buffering strategy design.

**Notifications (Telegram)**
- Alerts upon network change (e.g., switching from Home to 4G).
- Alerts when device remains stationary for more than 30 minutes.

**Backend Ready for Production**
- FastAPI backend architecture.
- Database persistence using SQLite (PostgreSQL ready).
- Structured daily logs.

### Future Enhancements (Roadmap)
- Geofencing capability.
- Heatmap visualization.
- Anti-theft aggressive alert mode.
- Dockerized deployment.
- Automated installer script.

### Installation (Backend)

1. **Clone the repository:**
   git clone [https://github.com/LukeArwolf/Solar-GPS-Telegram-Tracker.git](https://github.com/LukeArwolf/Solar-GPS-Telegram-Tracker.git)
   cd Solar-GPS-Telegram-Tracker
Automated Install: Run the included script to setup Python, Permissions, and Systemd Service.

chmod +x install.sh
./install.sh
Manual Configuration: If not using the script, copy .env.example to .env, install requirements via pip, and configure systemd manually.

Firmware (ESP32)
Navigate to firmware/Luke_Tracker/.

Rename Luke_Tracker.ino.example to Luke_Tracker.ino.

Open it in Arduino IDE and install TinyGPS++ library.

Update DEVICE_TOKEN, SERVER_HOST, and Wi-Fi credentials.

Upload to ESP32.

Portuguese Instructions
Visao Geral
Sistema de rastreamento robusto projetado para VPS Linux (Backend) e ESP32 (Hardware), focado em resiliencia de conectividade e integridade de dados.

Funcionalidades Avancadas
Motor Wi-Fi Inteligente

Prioriza redes confiaveis (Casa/Trabalho) sobre roteamento movel.

Fallback automatico para 4G quando redes primarias estao indisponiveis.

Estrategia inteligente de reconexao.

Seguranca e Confiabilidade

Autenticacao do dispositivo via token criptografico seguro.

Suporte opcional a HTTPS para transmissao criptografada.

Design preparado para rate-limit.

Rastreamento em Tempo Real

Atualizacoes de mapa ao vivo via Interface Web.

Logs persistentes e rastreamento historico.

Geocodificacao Reversa (Coordenadas para Endereco).

Automacao e Estabilidade

Mecanismo de tentativas resiliente para falhas de transmissao.

Watchdog e recuperacao de falhas.

Design de estrategia de buffer offline.

Notificacoes (Telegram)

Alertas na troca de rede (ex: mudanca de Casa para 4G).

Alertas quando o dispositivo permanece parado por mais de 30 minutos.

Backend Pronto para Producao

Arquitetura backend FastAPI.

Persistencia de banco de dados usando SQLite (Pronto para PostgreSQL).

Logs diarios estruturados.

Melhorias Futuras (Roadmap)
Capacidade de Geofencing (Cerca Virtual).

Visualizacao de Mapa de Calor (Heatmap).

Modo de alerta agressivo anti-furto.

Deploy via Docker.

Script de instalacao automatizado.

Instalacao (Backend)
Clone o repositorio:

git clone [https://github.com/LukeArwolf/Solar-GPS-Telegram-Tracker.git](https://github.com/LukeArwolf/Solar-GPS-Telegram-Tracker.git)
cd Solar-GPS-Telegram-Tracker
Instalacao Automatizada: Execute o script incluido para configurar Python, Permissoes e Servico Systemd.

chmod +x install.sh
./install.sh
Configuracao Manual: Se nao usar o script, copie .env.example para .env, instale os requirements via pip e configure o systemd manualmente.

Firmware (ESP32)
Navegue ate firmware/Luke_Tracker/.

Renomeie Luke_Tracker.ino.example para Luke_Tracker.ino.

Abra na Arduino IDE e instale a biblioteca TinyGPS++.

Atualize DEVICE_TOKEN, SERVER_HOST, e as credenciais Wi-Fi no codigo.

Faca o upload para o ESP32.

French Instructions
Apercu
Systeme de suivi robuste concu pour VPS Linux (Backend) et ESP32 (Materiel), axé sur la resilience de la connectivite et l'integrite des donnees.

Fonctionnalites Avancees
Moteur Wi-Fi Intelligent

Priorite aux reseaux de confiance (Domicile/Travail).

Basculement automatique 4G lorsque les reseaux principaux sont indisponibles.

Strategie de reconnexion intelligente.

Securite et Fiabilite

Authentification du peripherique via token cryptographique.

Support HTTPS optionnel pour la transmission chiffree.

Conception prete pour la limitation de debit (rate-limit).

Suivi en Temps Reel

Mises a jour de la carte en direct via Interface Web.

Journaux persistants et suivi historique.

Geocodage Inverse (Coordonnees vers Adresse).

Automatisation et Stabilite

Mecanisme de reessai resilient pour les transmissions echouees.

Watchdog et recuperation de pannes.

Strategie de memoire tampon hors ligne.

Notifications (Telegram)

Alertes lors du changement de reseau.

Alertes lorsque le peripherique reste immobile plus de 30 minutes.

Backend Pret pour la Production

Architecture backend FastAPI.

Persistance de base de donnees SQLite.

Journaux quotidiens structures.

Ameliorations Futures (Roadmap)
Geofencing (Geolocalisation virtuelle).

Visualisation Heatmap (Carte thermique).

Mode d'alerte antivol agressif.

Deploiement Docker.

Script d'installation automatise.

Installation (Backend)
Cloner le depot:

git clone [https://github.com/LukeArwolf/Solar-GPS-Telegram-Tracker.git](https://github.com/LukeArwolf/Solar-GPS-Telegram-Tracker.git)
cd Solar-GPS-Telegram-Tracker
Installation Automatisee: Lancez le script inclus pour configurer Python, les permissions et le service Systemd.

chmod +x install.sh
./install.sh
Configuration Manuelle: Si vous n'utilisez pas le script, copiez .env.example vers .env, installez les dependances via pip et configurez systemd manuellement.

Firmware (ESP32)
Allez dans firmware/Luke_Tracker/.

Renommez Luke_Tracker.ino.example en Luke_Tracker.ino.

Ouvrez dans l'IDE Arduino et installez la bibliotheque TinyGPS++.

Mettez a jour DEVICE_TOKEN, SERVER_HOST, et les identifiants Wi-Fi.

Televersez sur l'ESP32.

Japanese Instructions
概要
VPS Linux (バックエンド) と ESP32 (ハードウェア) 向けに設計された堅牢な追跡システム。接続の回復力とデータの整合性に重点を置いています。

高度な機能
スマートWi-Fiエンジン

信頼できるネットワーク（自宅/職場）を優先します。

プライマリネットワークが利用できない場合の自動4Gフォールバック。

インテリジェントな再接続戦略。

セキュリティと信頼性

暗号化トークンによるデバイス認証。

暗号化データ送信のためのオプションのHTTPSサポート。

レート制限対応の設計コンセプト。

リアルタイム追跡

Webインターフェースによるライブマップ更新。

永続的なログ記録と履歴追跡。

逆ジオコーディング（座標から住所へ）。

自動化と安定性

送信失敗に対する回復力のある再試行メカニズム。

ウォッチドッグと障害回復。

オフラインバッファリング戦略の設計。

通知 (Telegram)

ネットワーク変更時のアラート。

デバイスが30分以上静止した場合のアラート。

本番環境対応バックエンド

FastAPIバックエンドアーキテクチャ。

SQLiteを使用したデータベース永続性。

構造化された日次ログ。

将来の拡張 (ロードマップ)
ジオフェンシング機能。

ヒートマップの視覚化。

盗難防止アグレッシブアラートモード。

Dockerによるデプロイ。

自動インストールスクリプト。

インストール (バックエンド)
リポジトリのクローン:

git clone [https://github.com/LukeArwolf/Solar-GPS-Telegram-Tracker.git](https://github.com/LukeArwolf/Solar-GPS-Telegram-Tracker.git)
cd Solar-GPS-Telegram-Tracker
自動インストール: 含まれているスクリプトを実行して、Python、権限、およびSystemdサービスを設定します。

chmod +x install.sh
./install.sh
手動設定: スクリプトを使用しない場合は、.env.example を .env にコピーし、pip経由で要件をインストールし、systemdを手動で設定してください。

ファームウェア (ESP32)
firmware/Luke_Tracker/ に移動します。

Luke_Tracker.ino.example を Luke_Tracker.ino にリネームします。

Arduino IDEで開き、TinyGPS++ ライブラリをインストールします。

コード内の DEVICE_TOKEN、SERVER_HOST、およびWi-Fi情報を更新します。

ESP32に書き込みます。
