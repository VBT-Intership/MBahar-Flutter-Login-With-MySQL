<?php

$connect = new mysqli("server_name","username","password","db_name");

if($connect){
	 
}else{
	echo "Connection Failed";
	exit();
}