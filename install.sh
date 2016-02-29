#!/bin/bash
echo "Environment: production or development?"
read env

if  [ "$env" == "production" ]; then
	echo "DB user?"
	read db_user

	if [ "$db_user" == '' ]; then
		exit 1
	fi

	echo "DB password?"
	read db_pass

	if [ "$db_pass" == '' ]; then
		exit 1
	fi

	echo "School Name?"
	read school_name
elif  [ "$env" == "development" ]; then
	#sudo apt-get install -y virtualbox vagrant capistrano

	ip="127.0.0.1"
	user="vagrant"
	db_user="root"
	db_pass=""
else
	echo "Cannot continue without selecting an environment."
	exit 1
fi

echo "---" > "$config"
echo "- environment: $env" >> "$config"
echo "- host: host" >> "$config"
echo "- user: user" >> "$config"
echo "- db_name: classis" >> "$config"
echo "- db_user: $db_user" >> "$config"
echo "- db_pass: $db_pass" >> "$config"
echo "- school_name: $school_name" >> "$config"

nano /tmp/school.php
