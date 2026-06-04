#!/bin/bash

# Member 4 (The Archivist): hospital_archive.sh
# Rotates logs from active_logs/ to archived_logs/ with a timestamp,
# then recreates empty log files so the engine can keep recording.

rotate_logs() {
    TIMESTAMP=$(date +%Y%m%d_%H%M)

    echo "============================================"
    echo "  [M4] Starting Log Rotation                "
    echo "  Timestamp: $TIMESTAMP                     "
    echo "============================================"

    for log_file in active_logs/*.log; do
        if [ -f "$log_file" ]; then
            base=$(basename "$log_file" .log)
            dest="archived_logs/${base}_${TIMESTAMP}.log"
            mv "$log_file" "$dest"
            echo "  [>>] Moved: $log_file  -->  $dest"
        fi
    done
}
