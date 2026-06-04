#!/bin/bash

process_vitals() {
    grep "CRITICAL" active_logs/*Heart* active_logs/*Temperature* |
    awk '{print $1, $2, $3}' > reports/critical_alerts.txt
}

process_vitals
