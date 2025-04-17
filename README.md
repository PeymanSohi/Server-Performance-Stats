## 🖥️ Server Stats Monitor

A **Bash-based live system monitor** that displays real-time server performance stats

This script provides continuous updates on system health, resource usage, and process activity, directly in your terminal.

---

### 📸 Preview

```bash
========================= 🖥️ Server Stats Monitor =========================
⏰ Time: 2025-04-17 16:25:10      🏷️ Host: prod-server-01
============================================================================
🖥️  OS Version        : Ubuntu 22.04.4 LTS
⏱️  Uptime            : up 3 days, 2 hours, 17 minutes
📊 Load Average       : 0.08, 0.15, 0.12
👥 Logged-in Users    : 2
🚫 Failed SSH Logins  : 5 (in last 24h)
🧠 CPU Usage          : Used: 14.7% | Idle: 85.3%
💾 Memory Usage       : Used: 1592 MB / 3920 MB (40.6%)
🗄️  Disk Usage         : Used: 9.8G / 40G (25%)
🌐 Network Interfaces :
   - eth0       : 192.168.1.50/24
----------------------------------------------------------------------------

🔥 Top 5 Processes by CPU Usage:
   PID: 1234   User: root       CPU: 18.2% CMD: node
   PID: 987    User: mysql      CPU: 12.0% CMD: mysqld

💡 Top 5 Processes by Memory Usage:
   PID: 987    User: mysql      MEM: 25.3% CMD: mysqld
   PID: 4567   User: www-data   MEM: 12.7% CMD: php-fpm
============================================================================
🔁 Refreshing every 5 seconds... (Ctrl+C to exit)
```

---

### 🚀 Features

- 🧠 **Live CPU usage**
- 💾 **Memory usage with percentage**
- 🗄️ **Disk usage of root filesystem**
- 🌐 **Network interfaces & IPs**
- 🔥 **Top 5 processes by CPU**
- 💡 **Top 5 processes by memory**
- 📊 **Load average over 1, 5, 15 minutes**
- ⏱️ **System uptime**
- 👥 **Logged-in users**
- 🚫 **Failed SSH login attempts (last 24h)**

---

### 🛠 Requirements

- Bash
- Standard Linux CLI tools:
  - `top`, `ps`, `free`, `df`, `uptime`, `who`, `ip`
  - `journalctl` (for failed login stats, optional)

---

### 📦 Installation

```bash
git clone https://github.com/peymansohi/Server-Performance-Stats.git
cd Server-Performance-Stats
chmod +x server-stats.sh
```

---

### ▶️ Usage

```bash
./server-stats.sh
```

The script will:
- Refresh every 2 seconds
- Continuously print updated stats
- Auto-clear the terminal for a live-monitor look

---

### ⚠️ Notes

- The script is read-only and non-intrusive.
- Best viewed on a full-width terminal.
- SSH login failure tracking requires `systemd` + `journalctl`.

---

### 🧱 Customization Ideas

- Add colors using ANSI escape sequences
- Show GPU stats with `nvidia-smi` (if applicable)
- Track specific services or Docker containers

---

### 🙌 Contribute

Pull requests and improvements are welcome!  
If you have ideas (like adding alerts, exporting stats, or HTML output), feel free to open an issue.

---
https://roadmap.sh/projects/server-stats
