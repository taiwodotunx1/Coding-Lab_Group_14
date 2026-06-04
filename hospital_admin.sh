#!/bin/bash

#Declaring the function
initialize_system(){

#Files of interest
FILES=("active_logs" "archived_logs" "reports")

#A for loop that goes through our files of interest with an if nested to check if it exists or not and create it
for F in "${FILES[@]}"; do
if [ -e "$F" ]; then
echo "$F already exists"
else
mkdir "$F"
echo "Creating $F directory"
fi
done

}

# Member 2 — The Security Lead: secure_data()
secure_data() {
    echo "============================================"
    echo "  [M2] Applying Security Permissions        "
    echo "============================================"

    echo "  [>>] Setting active_logs/ to 700 (owner only)..."
    chmod 700 active_logs/

    echo "  [>>] Setting log files to 600 (owner read+write only)..."
    for log_file in active_logs/*.log; do
        if [ -f "$log_file" ]; then
            chmod 600 "$log_file"
            echo "       Secured: $log_file"
        fi
    done

    echo ""
    echo "  [M2] Current permissions on active_logs/:"
    ls -la active_logs/
    echo ""
    echo "  [M2] Security permissions applied successfully. active_logs is now owner-access only."
    echo ""
}

#Calling the functions to actually execute the code
initialize_system
secure_data
