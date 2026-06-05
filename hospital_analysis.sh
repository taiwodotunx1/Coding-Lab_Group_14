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

# Member 6 - Facility Auditor

    water_audit() {
    echo "Analyzing water usage for ICU_WATER_RESERVE..."

    awk -F',' '/ICU_WATER_RESERVE/ {
        sum += $3
        count++
    }

    END {
        if (count > 0)
            printf "Average Water Usage: %.2f\n", sum/count
        else
            print "No water usage data found"
    }' active_logs/water_usage.log
}

water_audit
