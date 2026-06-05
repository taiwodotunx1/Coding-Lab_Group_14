#!/bin/bash

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

# Member 3 - The Orchestrator
main() {
    echo "Starting system setup..."
    initialize_system
    echo "System Environment Secured - $(date)"
}
main
