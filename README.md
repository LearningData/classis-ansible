# classis-ansible

Executing ./install.sh and answering the questionnaire will install a working version of Classis on a machine.

Ansible file are distributed in three directories, these being common, production and development.

Common contains most of the files needed for the installation as Classis structures and config files, any utils needed for Classis, ePortfolio directory structure, phpmyadmin config and all the tasks using these.

Development contains all the default data to be used with Vagrant like configuration for MySQL without a password, default apache config.

Production contains all config files and task specific to a primary-secondary production server like apache ssl config, mysql master/slave config, php.ini config, cron jobs and database dumps setup.

## Development

Installs VirtualBox, Vagrant and Capistrano. Clones the master from Github on local. Default db user is root with no password and port for Apache is 8080. It can be accessed at localhost:8080/devclass/class.
