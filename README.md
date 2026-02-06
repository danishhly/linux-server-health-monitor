# Linux Server Health Monitor 

##  Project Overview
This Bash script automates the daily health checks of a Linux server. It monitors critical system resources (Disk, RAM) and audits security logs for unauthorized access attempts. Designed for use with `cron` for daily reporting.

##  Features
* **Disk Monitoring:** Alerts if Root usage exceeds 80%.
* **Memory Audit:** Logs available free RAM.
* **Security Audit:** Parses `/var/log/auth.log` to count failed SSH login attempts (Brute Force detection).
* **Reporting:** Generates a timestamped report at `/var/log/server_report.txt`.

##  How to Use
1. **Download the script:**
   ```bash
   wget [https://github.com/](https://github.com/)danishhly/linux-server-health-monitor/raw/main/monitor.sh

2. **Make it executable:**
```bash
   chmod +x monitor.sh
```
3. **Run manually:**
```bash
   sudo ./monitor.sh
```
## Automation (Cron Job)
To run this script automatically every day at 8:00 AM:
-Open crontab: crontab -e
-Add the following line:
```bash
   0 8 * * * /path/to/monitor.sh
```
## Sample Output
SERVER HEALTH REPORT - Fri Feb  6 06:29:23 PM IST 2026
---------------------------------------------------
-Disk usage is safe 10%
-Free RAM Available: 10Gi
-Failed SSH Login Attempts: 0

<img width="737" height="425" alt="image" src="https://github.com/user-attachments/assets/b9b57c45-277a-4f42-9157-7d8e9d8ecd75" />
