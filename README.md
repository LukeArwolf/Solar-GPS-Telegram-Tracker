# Luke Tracker - Solar GPS System

![License](https://img.shields.io/badge/license-MIT-blue)
![Python](https://img.shields.io/badge/python-3.9+-yellow)
![Platform](https://img.shields.io/badge/platform-ESP32%20%7C%20Linux-green)

**Professional GPS Tracking System with VPS Backend, Telegram Integration, and Smart Wi-Fi Management.**

---

### Language / Idioma / Langue / 言語

- [English](#english-instructions)
- [Portugues](#instrucoes-em-portugues)
- [Francais](#instructions-en-francais)
- [Japanese](#日本語の説明)

---

## English Instructions

### Overview
A robust tracking system designed for VPS Linux (Backend) and ESP32 (Hardware).
- **Smart Wi-Fi:** Prioritizes Home/Work networks. Uses 4G hotspot only as backup.
- **Telegram Bot:** Alerts when network changes or device stays stationary for >30min.
- **Web Interface:** Real-time map and logs.

### Installation (Backend)

1. **Clone the repository:**
   ```bash
   git clone [https://github.com/YOUR_USER/Luke-GPS-Tracker.git](https://github.com/YOUR_USER/Luke-GPS-Tracker.git)
   cd Luke-GPS-Tracker/backend
