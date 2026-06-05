#!/bin/bash
# Author: Member 2 - Security Lead (shyaka-alex)
# Purpose: Set up and secure the KNH hospital log environment
# Purpose: Set up and secure the KNH hospital log environment
# Member 1 (Architect): initialize_system()
initialize_system() {

    # Files of interest
    FILES=("active_logs" "archived_logs" "reports")

    # A for loop that checks if directories exist and creates them if not
    for F in "${FILES[@]}"; do
        if [ -e "$F" ]; then
            echo "$F already exists"
        else
            mkdir "$F"
            echo "Creating $F directory..."
        fi
    done

}

# Member 2 (Security Lead): secure_data()
secure_data() {
    echo "============================================"
    echo "  [M2] Applying Security Permissions        "
    echo "============================================"

    # Safety check - warn if active_logs does not exist
    if [ ! -d "active_logs" ]; then
        echo "  [ERROR] active_logs/ not found. Run initialize_system first."
        return 1
    fi

    # chmod 700 means only the owner can read, write, execute the directory
    echo "  [>>] Setting active_logs/ to 700 (owner only)..."
    chmod 700 active_logs/
    echo "  [OK] active_logs/ locked to owner only."

    # chmod 600 ensures each log file is not readable by group or others
    echo "  [>>] Setting log files to 600 (owner read+write only)..."
    for log_file in active_logs/*.log; do
        if [ -f "$log_file" ]; then
            chmod 600 "$log_file"
            echo "       Secured: $log_file"
        fi
    done

    # Display the resulting permissions so the user can verify
    echo "  [M2] Security permissions applied successfully. active_logs is now owner-access only."
    echo ""
    echo "  [M2] Current permissions on active_logs/:"
    ls -la active_logs/
    echo "  [M2] Security permissions applied successfully. active_logs is now owner-access only."
    echo ""
}

# Member 3 - The Orchestrator
main() {
    echo "Starting system setup..."
    initialize_system
    secure_data
    echo "System Environment Secured - $(date)"
}
main
