#!/bin/bash

echo ""
echo "Installing Ansible..."
echo ""
sudo apt-get install ansible

echo ""
echo "***********************************************"
echo "Make sure you have a machine with Ubuntu 12.04 or Ubuntu 14.04, you have the host/ip of the server, the user for the server is a sudoer and you have the password. Recommended to add your public ssh key to /home/user/.ssh/authorized_keys"
echo "If you choose to activate SSL on the server, option which we recommend, please make sure you upload the certificates to the server. You can also upload a logo to the server."
echo "Please complete the next questionnaire to install a Classis instance on your server."
echo "Press Enter to skip and leave the default value in the configuration. Otherwise type the answer and press Enter."
echo "***********************************************"
echo ""

echo "Environment: production or development?"
read env

if  [ "$env" == "production" ]; then
	default_host="127.0.0.1"
	echo "Server host? Default: $default_host"
	read host
	host=${host:-$default_host}

	default_port="22"
	echo "Server SSH port? Default: $default_port"
	read port
	port=${port:-$default_port}

	default_user="$USER"
	echo "Server username? Default: $default_user"
	read user
	user=${user:-$default_user}

	echo "Administrator email? *Will receive email from Classis/monitoring failures/etc."
	read administrator_email

	default_db_name="classis"
	echo "DB name? Default: $default_db_name"
	read db_name
	db_name=${db_name:-$default_db_name}

	db_host="localhost"
	db_port=3306

	echo "DB user? *Required"
	read db_user

	echo "DB password? *Required"
	read db_pass

	if [ "$db_user" == '' ] || [ "$db_pass" == '' ]; then
		echo "Cannot continue without required values."
		exit 1
	fi

	default_ssl="off"
	echo "Turn on SSL? Default: $default_ssl, type 'on' to turn on SSL."
	read ssl
	ssl=${ssl:-$default_ssl}

	apache_site="000-default.conf"
	if [ "$ssl" == 'on' ]; then
		apache_site="default-ssl.conf"
		default_http_port=443

		default_cert_file_path="/etc/ssl/certs/ssl-cert-snakeoil.pem"
		echo "Please type the full path to the SSL certificate (Example: /home/$user/mycertificate.crt) | Default: $default_cert_file_path :"
		read certificate_file_path
		certificate_file_path=${certificate_file_path:-$default_cert_file_path}

		default_cert_key_file_path="/etc/ssl/private/ssl-cert-snakeoil.key"

		echo "Please type the full path to the SSL key: (Example: /home/$user/mycertificate.key) | Default: $default_cert_key_file_path"
		read certificate_key_file_path
		certificate_key_file_path=${certificate_key_file_path:-$default_cert_key_file_path}

		http="https"
	else
		default_http_port=80
		http="http"
	fi
	echo "HTTP Port? Default: $default_http_port"
	read http_port
	http_port=${http_port:-$default_http_port}

	apache_error_log_path="\${APACHE_LOG_DIR}"
	apache_access_log_path="\${APACHE_LOG_DIR}"

	application_url="$host"
	if [ "$http_port" != "$default_http_port" ]; then
		application_url="$host:$http_port"
	fi

	echo "School Name?"
	read school_name

	echo "Please type the full path to the School logo: (Example: /home/$user/myschoollogo.png)"
	read school_logo_path

	echo "Classis administrator password? *Password to login with administrator user into Classis"
	read admin_password

	echo "Classis short keyword string for password? *Password is created with this string and then added 4 digits as PIN"
	read password_short_keyword

	default_base_directory="/home/htdocs"
	echo "Directory where Classis will be installed? Default: $default_base_directory"
	read base_directory
	base_directory=${base_directory:-$default_base_directory}

	application_directory="classis"
	full_application_directory="$base_directory/$application_directory"
	classis_directory="class"

	default_eportfolio_directory="/home/eportfolio"
	echo "Directory where data for Classis will be saved (profile pictures, reports, etc.)? Default: $default_eportfolio_directory"
	read eportfolio_directory
	eportfolio_directory=${eportfolio_directory:-$default_eportfolio_directory}

	default_dumps_directory="/home/classis_backup"
	echo "Directory where backups for Classis will be saved? Default: $default_dumps_directory"
	read dumps_directory
	dumps_directory=${dumps_directory:-$default_dumps_directory}

	utils_directory="$full_application_directory/utils"

	config="./vars/production.yml"

	echo "Creating the production vars file for Ansible templates..."

	echo "---" > "$config"
	echo "environ: $env" >> "$config"
	echo "administrator_email: $administrator_email" >> "$config"

	echo "host: $host" >> "$config"
	echo "port: $port" >> "$config"
	echo "user: $user" >> "$config"
	echo "db_host: $db_host" >> "$config"
	echo "db_port: $db_port" >> "$config"
	echo "db_name: $db_name" >> "$config"
	echo "db_user: $db_user" >> "$config"
	echo "db_pass: $db_pass" >> "$config"
	echo "ssl: $ssl" >> "$config"
	echo "http_port: $http_port" >> "$config"
	echo "apache_site: $apache_site" >> "$config"
	echo "apache_error_log_path: $apache_error_log_path" >> "$config"
	echo "apache_access_log_path: $apache_access_log_path" >> "$config"
	echo "certificate_file_path: $certificate_file_path" >> "$config"
	echo "certificate_key_file_path: $certificate_key_file_path" >> "$config"

	echo "base_directory: $base_directory" >> "$config"
	echo "application_directory: $full_application_directory" >> "$config"
	echo "toplevel_directory: $application_directory" >> "$config"
	echo "classis_directory: $classis_directory" >> "$config"
	echo "application_url: $application_url" >> "$config"
	echo "database_backup_directory: $dumps_directory" >> "$config"
	echo "eportfolio_directory: $eportfolio_directory" >> "$config"
	echo "logs_directory: $eportfolio_directory" >> "$config"
	echo "templates_directory: $full_application_directory/templates" >> "$config"
	echo "utils_directory: $utils_directory" >> "$config"
	echo "school_name: $school_name" >> "$config"
	echo "school_logo_path: $school_logo_path" >> "$config"
	echo "password_short_keyword: $password_short_keyword" >> "$config"
	echo "classis_administrator_password: $admin_password" >> "$config"
	echo "repository: ssh://git@github.com/LearningData/classis.git" >> "$config"


	hosts="./hosts"
	echo "[school]" > "$hosts"
	echo "$host ansible_port=$port ansible_user=$user" >> "$hosts"

	echo "Initiating Classis installation with ansible provision."
	ansible-playbook -i hosts production.yml -f 10 --ask-pass

	echo ""
	echo "********************************************************"
	echo ""
	echo "     You can access Classis at $http://$application_url/$application_directory      "
	echo ""
	echo "********************************************************"
elif  [ "$env" == "development" ]; then
	echo ""
	echo "********************************************************"
	echo "Installing VirtualBox, Vagrant and Capistrano for development."
	echo "********************************************************"
	echo ""

	sudo apt-get install virtualbox vagrant capistrano git

	echo ""
	echo "********************************************************"
	echo "Initiating the vagrant box with ansible provision."
	echo "********************************************************"
	echo ""
	vagrant up --provision
else
	echo ""
	echo "Cannot continue without selecting an environment."
	echo ""
	exit 1
fi
