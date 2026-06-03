#!/bin/bash
initialize_system(){
	FILES=("active_logs" "archived_logs" "reports")
	for F in "${FILES[@]}"; do
		if [ -e "$F" ]; then
			echo "$F already exists"
		else
			mkdir "$F"
			echo "Creating $F directory"
		fi
	done
}
