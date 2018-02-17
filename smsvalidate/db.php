<?php
$dbhost = 'localhost';
$dbuser = 'zadmin_emax';
$dbpass = 'yzupu7a6u';
$conn = mysql_connect($dbhost, $dbuser, $dbpass);
if(! $conn )
{
die('Could not connect: ' . mysql_error());
}
mysql_select_db( 'zadmin_emax' );




?>