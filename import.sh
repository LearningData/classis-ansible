#!/bin/bash

echo ""
echo "Importing production data..."
echo "Please make sure your Classis configuration matches the deployed server."
echo ""
echo "!!! This will overwrite you current data on the production server. [Ctrl+C to cancel now]"
echo ""

default_path_to_tarball="./classis_data.tar.gz"
echo "Path to the Classis data tarball (Example: /home/Downloads/classis_data.tar.gz)? Default: $default_path_to_tarball  (current directory)"
read path_to_tarball
path_to_tarball=${path_to_tarball:-$default_path_to_tarball}

if [ "$path_to_tarball" == '' ] && [ "$path_to_tarball" != '.' ]; then
	echo "Cannot continue without a path."
	exit 1
fi

ansible-playbook -i hosts import.yml -f 10 --ask-pass --extra-vars "path_to_classis_tarball=$path_to_tarball"

echo "Data has been imported"
