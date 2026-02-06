#!/bin/bash

REPORT_FILE="server_report.txt"

echo "SERVER HEALTH REPORT - $(date)" > $REPORT_FILE
echo "---------------------------------------------------" >> $REPORT_FILE

DISK_USAGE=$(df -h / | grep '/' | awk '{print $5}' | sed 's/%//')

if [ "$DISK_USAGE" -gt 80 ]; then
    echo "Warning!: Disk usage is high at ${DISK_USAGE}%" >> $REPORT_FILE
else
    echo "Disk usage is safe ${DISK_USAGE}%" >> $REPORT_FILE
fi

FREE_RAM=$(free -h | grep Mem | awk '{print $4}')
echo "Free RAM Avaible: $FREE_RAM" >> $REPORT_FILE

if [ -f /var/log/auth.log ]; then
    FAILED_LOGINS=$(grep "Failed paswword" /var/log/auth.log | wc -l)
    echo "Failed SSH Login Attempts: $FAILED_LOGINS" >> $REPORT_FILE
else
    echo "Could not read auth logs (permission denied or file missing)" >> $REPORT_FILE
fi

echo "------------------------------------------------" >> $REPORT_FILE
echo "Report generated sucessfully"
