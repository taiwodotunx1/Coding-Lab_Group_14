#!/bin/bash

#Declaing the function
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

#Calling the function to actually execute the code
initialize_system
