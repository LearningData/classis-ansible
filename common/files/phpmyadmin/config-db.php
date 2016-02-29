<?php
##
## database access settings in php format
## automatically generated from /etc/dbconfig-common/phpmyadmin.conf
## by /usr/sbin/dbconfig-generate-include
## Thu, 29 Oct 2015 15:58:54 +0000
##
## by default this file is managed via ucf, so you shouldn't have to
## worry about manual changes being silently discarded.  *however*,
## you'll probably also want to edit the configuration file mentioned
## above too.
##
$dbuser='{{ db_user }}';
$dbpass='{{ db_pass }}';
$basepath='';
$dbname='phpmyadmin';
$dbserver='{{ db_host }}';
$dbport='{{ db_port }}';
$dbtype='mysql';