#!/bin/bash

process_vitals() {

    mkdir -p reports

    > reports/critical_alerts.txt

    echo "===== HEART RATE CRITICAL ALERTS =====" >> reports/critical_alerts.txt

    grep "CRITICAL" active_logs/heart_rate_log.log | \
    awk -F' \\| ' '{print $1 " | " $2 " | " $3}' \
    >> reports/critical_alerts.txt

    echo "" >> reports/critical_alerts.txt

    echo "===== TEMPERATURE CRITICAL ALERTS =====" >> reports/critical_alerts.txt

    grep "CRITICAL" active_logs/temperature_log.log | \
    awk -F' \\| ' '{print $1 " | " $2 " | " $3}' \
    >> reports/critical_alerts.txt

    echo "Report generated: reports/critical_alerts.txt"
}

process_vitals
