# Luke Tracker - Solar GPS System

<div align="center">

![License](https://img.shields.io/badge/license-MIT-blue)
![Python](https://img.shields.io/badge/python-3.9+-yellow)
![Platform](https://img.shields.io/badge/platform-ESP32%20%7C%20Linux-green)

**Professional GPS Tracking System with VPS Backend, Telegram Integration, and Smart Wi-Fi Management.**



---

### 🌍 Select Language

[English](#english-instructions) • [Português](#portuguese-instructions) • [Français](#french-instructions) • [日本語](#japanese-instructions)

---

</div>

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
- [ ] Geofencing capability.
- [ ] Heatmap visualization.
- [ ] Anti-theft aggressive alert mode.
- [ ] Dockerized deployment.
- [ ] Automated installer script.

### Installation (Backend)

1. **Clone the repository:**
    ```bash
    git clone [https://github.com/LukeArwolf/Solar-GPS-Telegram-Tracker.git](https://github.com/LukeArwolf/Solar-GPS-Telegram-Tracker.git)
    cd Solar-GPS-Telegram-Tracker
    ```

2. **Automated Install:**
   Run the included script to setup Python, Permissions, and Systemd Service.
    ```bash
    chmod +x install.sh
    ./install.sh
    ```

3. **Manual Configuration:**
   If not using the script, copy `.env.example` to `.env`, install requirements via pip, and configure systemd manually.

### Firmware (ESP32)

1. Navigate to `firmware/Luke_Tracker/`.
2. Rename `Luke_Tracker.ino.example` to `Luke_Tracker.ino`.
3. Open it in **Arduino IDE** and install the **TinyGPS++** library.
4. Update `DEVICE_TOKEN`, `SERVER_HOST`, and `Wi-Fi credentials` inside the code.
5. Upload to ESP32.

---

## Portuguese Instructions

### Visão Geral
Sistema de rastreamento robusto projetado para VPS Linux (Backend) e ESP32 (Hardware), focado em resiliência de conectividade e integridade de dados.

### Funcionalidades Avançadas

**Motor Wi-Fi Inteligente**
- Prioriza redes confiáveis (Casa/Trabalho) sobre roteamento móvel.
- Fallback automático para 4G quando redes primárias estão indisponíveis.
- Estratégia inteligente de reconexão para manter o uptime.

**Segurança e Confiabilidade**
- Autenticação do dispositivo via token criptográfico seguro.
- Suporte opcional a HTTPS para transmissão criptografada.
- Design preparado para rate-limit.

**Rastreamento em Tempo Real**
- Atualizações de mapa ao vivo via Interface Web.
- Logs persistentes e rastreamento histórico.
- Geocodificação Reversa (Coordenadas para Endereço).

**Automação e Estabilidade**
- Mecanismo de tentativas resiliente para falhas de transmissão.
- Watchdog e recuperação de falhas.
- Design de estratégia de buffer offline.

**Notificações (Telegram)**
- Alertas na troca de rede (ex: mudança de Casa para 4G).
- Alertas quando o dispositivo permanece parado por mais de 30 minutos.

**Backend Pronto para Produção**
- Arquitetura backend FastAPI.
- Persistência de banco de dados usando SQLite (Pronto para PostgreSQL).
- Logs diários estruturados.

### Melhorias Futuras (Roadmap)
- [ ] Capacidade de Geofencing (Cerca Virtual).
- [ ] Visualização de Mapa de Calor (Heatmap).
- [ ] Modo de alerta agressivo anti-furto.
- [ ] Deploy via Docker.
- [ ] Script de instalação automatizado.

### Instalação (Backend)

1. **Clone o repositório:**
    ```bash
    git clone [https://github.com/LukeArwolf/Solar-GPS-Telegram-Tracker.git](https://github.com/LukeArwolf/Solar-GPS-Telegram-Tracker.git)
    cd Solar-GPS-Telegram-Tracker
    ```

2. **Instalação Automatizada:**
   Execute o script incluído para configurar Python, Permissões e Serviço Systemd.
    ```bash
    chmod +x install.sh
    ./install.sh
    ```

3. **Configuração Manual:**
   Se não usar o script, copie `.env.example` para `.env`, instale os requirements via pip e configure o systemd manualmente.

### Firmware (ESP32)

1. Navegue até `firmware/Luke_Tracker/`.
2. Renomeie `Luke_Tracker.ino.example` para `Luke_Tracker.ino`.
3. Abra na **Arduino IDE** e instale a biblioteca **TinyGPS++**.
4. Atualize `DEVICE_TOKEN`, `SERVER_HOST`, e as credenciais Wi-Fi no código.
5. Faça o upload para o ESP32.

---

## French Instructions

### Aperçu
Système de suivi robuste conçu pour VPS Linux (Backend) et ESP32 (Matériel), axé sur la résilience de la connectivité et l'intégrité des données.

### Fonctionnalités Avancées

**Moteur Wi-Fi Intelligent**
- Priorité aux réseaux de confiance (Domicile/Travail).
- Basculement automatique 4G lorsque les réseaux principaux sont indisponibles.
- Stratégie de reconnexion intelligente.

**Sécurité et Fiabilité**
- Authentification du périphérique via token cryptographique.
- Support HTTPS optionnel pour la transmission chiffrée.
- Conception prête pour la limitation de débit (rate-limit).

**Suivi en Temps Réel**
- Mises à jour de la carte en direct via Interface Web.
- Journaux persistants et suivi historique.
- Géocodage Inverse (Coordonnées vers Adresse).

**Automatisation et Stabilité**
- Mécanisme de réessai résilient pour les transmissions échouées.
- Watchdog et récupération de pannes.
- Stratégie de mémoire tampon hors ligne.

**Notifications (Telegram)**
- Alertes lors du changement de réseau.
- Alertes lorsque le périphérique reste immobile plus de 30 minutes.

**Backend Prêt pour la Production**
- Architecture backend FastAPI.
- Persistance de base de données SQLite.
- Journaux quotidiens structurés.

### Améliorations Futures (Roadmap)
- [ ] Geofencing (Géolocalisation virtuelle).
- [ ] Visualisation Heatmap (Carte thermique).
- [ ] Mode d'alerte antivol agressif.
- [ ] Déploiement Docker.
- [ ] Script d'installation automatisé.

### Installation (Backend)

1. **Cloner le dépôt:**
    ```bash
    git clone [https://github.com/LukeArwolf/Solar-GPS-Telegram-Tracker.git](https://github.com/LukeArwolf/Solar-GPS-Telegram-Tracker.git)
    cd Solar-GPS-Telegram-Tracker
    ```

2. **Installation Automatisée:**
   Lancez le script inclus pour configurer Python, les permissions et le service Systemd.
    ```bash
    chmod +x install.sh
    ./install.sh
    ```

3. **Configuration Manuelle:**
   Si vous n'utilisez pas le script, copiez `.env.example` vers `.env`, installez les dépendances via pip et configurez systemd manuellement.

### Firmware (ESP32)

1. Allez dans `firmware/Luke_Tracker/`.
2. Renommez `Luke_Tracker.ino.example` en `Luke_Tracker.ino`.
3. Ouvrez dans l'**IDE Arduino** et installez la bibliothèque **TinyGPS++**.
4. Mettez à jour `DEVICE_TOKEN`, `SERVER_HOST`, et les identifiants Wi-Fi.
5. Téléversez sur l'ESP32.

---

## Japanese Instructions

### 概要
VPS Linux (バックエンド) と ESP32 (ハードウェア) 向けに設計された堅牢な追跡システム。接続の回復力とデータの整合性に重点を置いています。

### 高度な機能

**スマートWi-Fiエンジン**
- 信頼できるネットワーク（自宅/職場）を優先します。
- プライマリネットワークが利用できない場合の自動4Gフォールバック。
- インテリジェントな再接続戦略。

**セキュリティと信頼性**
- 暗号化トークンによるデバイス認証。
- 暗号化データ送信のためのオプションのHTTPSサポート。
- レート制限対応の設計コンセプト。

**リアルタイム追跡**
- Webインターフェースによるライブマップ更新。
- 永続的なログ記録と履歴追跡。
- 逆ジオコーディング（座標から住所へ）。

**自動化と安定性**
- 送信失敗に対する回復力のある再試行メカニズム。
- ウォッチドッグと障害回復。
- オフラインバッファリング戦略の設計。

**通知 (Telegram)**
- ネットワーク変更時のアラート。
- デバイスが30分以上静止した場合のアラート。

**本番環境対応バックエンド**
- FastAPIバックエンドアーキテクチャ。
- SQLiteを使用したデータベース永続性。
- 構造化された日次ログ。

### 将来の拡張 (ロードマップ)
- [ ] ジオフェンシング機能。
- [ ] ヒートマップの視覚化。
- [ ] 盗難防止アグレッシブアラートモード。
- [ ] Dockerによるデプロイ。
- [ ] 自動インストールスクリプト。

### インストール (バックエンド)

1. **リポジトリのクローン:**
    ```bash
    git clone [https://github.com/LukeArwolf/Solar-GPS-Telegram-Tracker.git](https://github.com/LukeArwolf/Solar-GPS-Telegram-Tracker.git)
    cd Solar-GPS-Telegram-Tracker
    ```

2. **自動インストール:**
   含まれているスクリプトを実行して、Python、権限、およびSystemdサービスを設定します。
    ```bash
    chmod +x install.sh
    ./install.sh
    ```

3. **手動設定:**
   スクリプトを使用しない場合は、`.env.example` を `.env` にコピーし、pip経由で要件をインストールし、systemdを手動で設定してください。

### ファームウェア (ESP32)

1. `firmware/Luke_Tracker/` に移動します。
2. `Luke_Tracker.ino.example` を `Luke_Tracker.ino` にリネームします。
3. **Arduino IDE**で開き、**TinyGPS++** ライブラリをインストールします。
4. コード内の `DEVICE_TOKEN`、`SERVER_HOST`、およびWi-Fi情報を更新します。
5. ESP32に書き込みます。

---

### 🔧 Maintenance & Updates

**Commit changes to Git:**

```bash
git add README.md
git commit -m "Fix README formatting and update features"
git push -u origin main
