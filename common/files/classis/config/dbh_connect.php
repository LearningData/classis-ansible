<?php
function &db_connect($con=true,$db_name='{{ db_name }}'){
	require_once 'DB.php';
	PEAR::setErrorHandling(PEAR_ERROR_DIE);
	$db_user = '{{ db_user }}';
	$db_pass = '{{ db_pass }}';
	$db_host = 'localhost';
	$dsn = "mysql://$db_user:$db_pass@unix+$db_host/$db_name";
	if($con){
		$db = DB::connect($dsn);
		$db->setFetchMode(DB_FETCHMODE_OBJECT);
		return $db;
		}
	else{
		return $dsn;
		}
	}
?>
