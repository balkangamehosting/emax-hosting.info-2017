<?php
require './libs/PHPMailer-master/class.phpmailer.php';

$mail = new PHPMailer;

$mail->IsSMTP();                                      // Set mailer to use SMTP
$mail->Host = 'emax-hosting.info';  				// Specify main and backup server
$mail->SMTPAuth = true;                               // Enable SMTP authentication
$mail->Username = 'info@emax-hosting.info';                    	        // SMTP username
$mail->Password = 'info';                           // SMTP password
$mail->SMTPSecure = 'tls';                            // Enable encryption, 'ssl' also accepted

$mail->From = 'info@emax-hosting.info';
$mail->FromName = 'Emax Hosting';


$mail->WordWrap = 50;                                 // Set word wrap to 50 characters
$mail->IsHTML(true);                                  // Set email format to HTML

?>