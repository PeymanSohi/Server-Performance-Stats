#!/bin/bash

while true; do
  clear
  echo "========================= 🖥️ Server Stats Monitor ========================="
  echo "⏰ Time: $(date '+%Y-%m-%d %H:%M:%S')      🏷️ Host: $(hostname)"
  echo "============================================================================"

  # OS Version
  os=$(grep PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '"')
  echo "🖥️  OS Version        : $os"

  # Uptime and Load
  echo "⏱️  Uptime            : $(uptime -p)"
  echo "📊 Load Average       : $(uptime | awk -F'load average:' '{print $2}' | sed 's/^ //')"

  # Logged-in users
  echo "👥 Logged-in Users    : $(who | wc -l)"

  # Failed SSH login attempts (last 24h)
  if command -v journalctl &> /dev/null; then
    failed=$(journalctl -u ssh --since "1 day ago" 2>/dev/null | grep "Failed password" | wc -l)
    echo "🚫 Failed SSH Logins  : $failed (in last 24h)"
  else
    echo "🚫 Failed SSH Logins  : journalctl not available"
  fi

  # CPU Usage
  cpu=$(top -bn1 | grep "Cpu(s)")
  cpu_used=$(echo "$cpu" | awk '{printf "%.1f", $2 + $4}')
  cpu_idle=$(echo "$cpu" | awk '{printf "%.1f", $8}')
  echo "🧠 CPU Usage          : Used: ${cpu_used}% | Idle: ${cpu_idle}%"

  # Memory Usage
  read total used <<< $(free -m | awk 'NR==2 {print $2, $3}')
  mem_percent=$(awk "BEGIN {printf \"%.1f\", ($used/$total)*100}")
  echo "💾 Memory Usage       : Used: ${used} MB / ${total} MB (${mem_percent}%)"

  # Disk Usage
  disk=$(df -h / | awk 'NR==2')
  disk_used=$(echo $disk | awk '{print $3}')
  disk_total=$(echo $disk | awk '{print $2}')
  disk_perc=$(echo $disk | awk '{print $5}')
  echo "🗄️  Disk Usage         : Used: ${disk_used} / ${disk_total} (${disk_perc})"

  # Network Interfaces
  echo "🌐 Network Interfaces :"
  ip -brief address | grep -v lo | awk '{printf "   - %-10s : %s\n", $1, $3}'

  echo "----------------------------------------------------------------------------"

  # Top 5 CPU-hogging processes
  echo "🔥 Top 5 Processes by CPU Usage:"
  ps -eo pid,user,comm,%cpu --sort=-%cpu | head -n 6 | awk '{printf "   PID: %-6s User: %-10s CPU: %-5s%% CMD: %s\n", $1, $2, $4, $3}'

  echo ""

  # Top 5 MEM-hogging processes
  echo "💡 Top 5 Processes by Memory Usage:"
  ps -eo pid,user,comm,%mem --sort=-%mem | head -n 6 | awk '{printf "   PID: %-6s User: %-10s MEM: %-5s%% CMD: %s\n", $1, $2, $4, $3}'

  echo "============================================================================"
  echo "🔁 Refreshing every 2 seconds... (Ctrl+C to exit)"
  sleep 2
done
