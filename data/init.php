<?php
	header("Content-Type:application/json,charset=utf-8");
	$conn=mysqli_connect('127.0.0.1','root','','kaifanla_new');
	$sql="SET NAMES UTF8";
	$result=mysqli_query($conn,$sql);
?>