#!/bin/bash
echo "Environment: production or development?"
read env

if  [ "$env" == "production" ]; then
	echo "Server host?"
	read host

	echo "DB user?"
	read db_user

	echo "DB password?"
	read db_pass

	if [ "$db_user" == '' || "$db_pass" == '' ]; then
		echo "Cannot continue without required values."
		exit 1
	fi

	echo "School Name?"
	read school_name

	config="vars/production.yml"

	echo "Creating the production vars file for Ansible templates..."

	echo "---" > "$config"
	echo "environment: $env" >> "$config"
	echo "administrator_email: $administrator_email" >> "$config"
	echo "application_directory: $application_directory" >> "$config"
	echo "eportfolio_directory: $eportfolio_directory" >> "$config"
	echo "templates_directory: $templates_directory" >> "$config"
	echo "classis_directory: $classis_directory" >> "$config"
	echo "database_backup_directory: $db_dumps_dir" >> "$config"
	echo "logs_directory: $logs_directory" >> "$config"
	echo "utils_directory: $utils_directory" >> "$config"
	echo "http_port: $http_port" >> "$config"
	echo "https_port: $https_port" >> "$config"
	echo "apache_site: $apache_site" >> "$config"
	echo "apache_error_log_path: $apache_error_log_path" >> "$config"
	echo "apache_access_log_path: $apache_access_log_path" >> "$config"
	echo "certificate_file_path: $certificate_file_path" >> "$config"
	echo "certificate_key_file_path: $certificate_key_file_path" >> "$config"
	echo "slave_server_ip: $slave_server_ip" >> "$config"
	echo "master_server_ip: $master_server_ip" >> "$config"
	echo "host: $host" >> "$config"
	echo "user: $user" >> "$config"
	echo "db_name: $db_name" >> "$config"
	echo "db_user: $db_user" >> "$config"
	echo "db_pass: $db_pass" >> "$config"
	echo "school_name: $school_name" >> "$config"
	echo "password_short_keyword: $pass_short_keyword" >> "$config"
	echo "application_url: $application_url" >> "$config"

	echo "Initiating Classis installation with ansible provision."
	ansible-playbook production.yml -f 10
elif  [ "$env" == "development" ]; then
	echo "Installing VirtualBox, Vagrant and Capistrano for development."

	#sudo apt-get install -y virtualbox vagrant capistrano

	echo "Initiating the vagrant box with ansible provision."
	vagrant up

	application_directory="."
else
	echo "Cannot continue without selecting an environment."
	exit 1
fi

echo "Configure Classis school.php file:"
nano $application_directory/school.php
