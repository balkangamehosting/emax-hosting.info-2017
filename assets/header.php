<?php
$load = microtime(true);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

    <title>e-Max Hosting - <?php if(!empty($naslov)) echo $naslov; else echo 'Klijent'; ?></title>

    <meta name="description" content="Zakupite svoj game server po veoma niskoj ceni sa veoma visokim kvalitetom!">
    <meta name="keywords" content="emax, hosting, prodaja, host, cs 1.6, samp, Counter-Strike 1.6, San Andreas Multiplayer, najjeftiniji hosting, game hosting, game serveri, gamepanel" />
    <meta name="allow-search" content="yes" />
    <meta name="robots" content="all" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <link rel="stylesheet" href="./assets/blue/min/min.css" type="text/css" />
    <!---   <link rel="stylesheet" href="./assets/<?php echo $_SESSION['style']; ?>/min/?g=css" type="text/css" /> --->
    <meta name="google-site-verification" content="OEkNTuSoT8kjjb3lYMrbQuooIrYdKLfzpc7pb9Y9LjQ" />
</head>

<?php if(klijentUlogovan() == TRUE) { ?>
<style>
ul.infodt {
    list-style-type: none;
    overflow: hidden;
    margin-top: -35px;
}
</style>
<?php } ?>
<body onload="slajder()">

 <div id="navDIV_1" class="pattern" style="height: 45px;">
	
        <div id="traka"<?php if(klijentUlogovan() == TRUE) { echo ' style="z-index: 1031;"'; } ?>>
            <div id="trakawr">
                <div id="tlevo2">
<?php
                if (klijentUlogovan() == TRUE)
                {
                    $freq = mysql_query("SELECT f.*, k.ime, k.prezime
                            FROM friends_request f, klijenti k
                            WHERE f.user_two = {$client['klijentid']} AND k.klijentid = f.user_one");

                    $freq_num = query_numrows("SELECT f.*, k.ime, k.prezime
                            FROM friends_request f, klijenti k
                            WHERE f.user_two = {$client['klijentid']} AND k.klijentid = f.user_one AND f.status = 1");
?>
                <?php
                }
?>

</div>

<?php
                if (klijentUlogovan() == TRUE) {
?>
                <div id="tlevo" style="display: none;">
                    <form id="pretragac" action="process.php" method="POST" style="margin-left: 5%;">
                        <input type="hidden" name="task" value="pretraga">
                        <input type="text" class="search-query" autocomplete="off" id="qsearch" name="email" onkeyup="klijentPretraga()" placeholder="Pretraga..." />
                        <ul id="searchResults"></ul>
                    </form>
                </div>
<?php
                }
?>

                <div id="tdesno">
<?php
                if (klijentUlogovan() == TRUE) {
?>
                    <ul class="infodt">
                        <a href="profil.php?id=<?php echo $client['klijentid']; ?>">
                            <li style="padding-left: 45px; border-right: 1px solid rgba(255, 255, 255, 0.1);">
                                <?php echo avatar($_SESSION['klijentid'], '25', '25'); ?>
                                <?php echo $client['ime'].' '.$client['prezime']; ?>
                            </li>
                        </a>
                        <a href="/">
                            <li>
                                <i class="icon-home"></i> Home 
                            </li>
                        </a>
                    </ul>
<?php
                }
                else
                {
?>
                    <ul class="infodt">
                        <a href="#modal-register" rel="modal">
                            <li style="border-right: 1px solid rgba(255, 255, 255, 0.1);">
                                <i class="icon-signin"></i> <?php echo $jezik['text0']; ?></b>
                            </li>
                        </a>
                    </ul>
<?php
                }
?>
                    <div id="selectjezik">
    <?php
                    $tempxx = pathinfo($_SERVER['PHP_SELF']);
                    $fajlxx = $tempxx['basename'];
                    if($_SESSION['jezik'] == "sr") {
    ?>
                        <a href="http://e-max.xyz/<?php echo "{$fajlxx}?{$_SERVER['QUERY_STRING']}"; ?>&jezik=en">
                            <img src="/assets/img/flags/GB.png" width="18" height="14" />
                            English
                        </a>

    <?php
                        }
                        else if($_SESSION['jezik'] == "en") { ?>

                        <a href="http://e-max.xyz/<?php echo "{$fajlxx}?{$_SERVER['QUERY_STRING']}"; ?>&jezik=sr">
                            <img src="/assets/img/flags/RS.png" width="18" height="14" />
                            Serbian
                        </a>
    <?php
                    }
    ?>
                    </div>
                </div>
            </div>
        </div> <!-- #traka end -->
</div>
<?php
        if (klijentUlogovan() == TRUE) echo '<div style="height: 70px; width: 1px;"></div>';
?>

        <div id="header">
            <div id="logo">
                <a href="index.php"><div id="logoimg"></div></a>
                            </div>

<?php
if (isset($_SESSION['msg']))
{
?>
<div id="notif">
    <p id="h6"><?php echo $_SESSION['msg']; ?></p>
</div>
<?php
    unset($_SESSION['msg']);
}

if (klijentUlogovan() == TRUE)
{
    klijent_activity($_SESSION['klijentid']);
?>
            <div class="loginbox">
                <div id="texti"></div>
                <div id="infobox">
                    <div id="avtinfo">
                        <a href="#modal-avatar" rel="modal"><?php echo avatar($_SESSION['klijentid'], '90', '90');	?></a>
                    </div>
                    <div id="info">
                        <i class="icon-user"></i> <?php echo $_SESSION['klijentusername']; ?><br />
                        <i class="icon-mail-forward"></i> <?php echo $client['lastip']; ?><br />
                        <i class="icon-calendar"></i> <?php echo date("d.m.Y, H:i"); ?><br />
                        <i class="icon-money"></i> <?php echo getMoney($client['klijentid'], true); ?><br />
                        <i class="icon-cogs"></i> <a href="process.php?task=logout"><?php echo $jezik['text2']; ?></a> | <?php	if($_SESSION['sigkod'] == "0") { ?><a rel="modal" href="#modal-sigkod2">Edit</a><?php } else { ?><a href="ucp-podesavanja.php">Edit</a><?php } ?>
                    </div>

                </div>
            </div>
<?php
} else {
?>
            <div class="loginbox" style="background-color: rgba(0,0,0,.2);border: none;border-radius: 5px;position: relative;margin-bottom: 24px;box-shadow: 0 5px 5px 0 rgba(0,0,0,.25);">
                <div id="textt"></div>
                <div id="loginbox">
                        		<form id="ulogujse" action="login_process.php" method="post">
                        <input type="hidden" name="task" id="task" value="login" />
                        <input type="hidden" name="return" value="<?php
                                    if (isset($_GET['return']))
                                    {
                                        echo htmlspecialchars($_GET['return'], ENT_QUOTES);
                                    }
                        ?>" />
                        			<input type="text" name="username" id="loginINPUT_1" placeholder="Username" class="tipl" title="<?php echo $jezik['text3']; ?>" style="margin-top: -4px;" /><br />
                        <input type="password" id="loginINPUT_1" name="sifra" placeholder="Password" class="tipl" title="<?php echo $jezik['text4']; ?>" style="margin-top: -2px;" />
                            <input id="loginBUTTON_1" type="submit" name="login" value="Login" />
                        <br />
                    </form>
                </div>
<div id="demores">
                    <form action="login_process.php" method="post">
                        <input type="hidden" name="task" value="demo" />
                        <button type="submit" style="color: #FFF; border: 0; background: 0; float: right; margin-top: -18px; margin-right: 102px;">Demo</button>
                    </form>

</div>

            </div>
<?php
}
?>
        

 <!-- #header end -->
<?php if(!klijentUlogovan() == TRUE) { ?>
                    <div id="forgotpassword">
                        <a href="#modal-resetpw" rel="modal"><?php echo $jezik['text6']; ?>?</a>
                    </div>
<?php } ?>
</div>
        <div id="wraper">
            <div id="navigacija">
                <ul>
<?php
                if($_SESSION['style'] == 'orange')
                {
?>
                    <a href="index.php">
                        <li style="margin: 0;" <?php if($fajl=="index") echo'class="active"'; ?>>
                            <i class="icon-home"></i> <?php echo $jezik['text7']; ?>
                        </li>
                    </a>
                    <div id="sep"></div>
                    <a href="ucp.php">
                        <li style="margin: 0;" <?php if($fajl=="ucp") echo'class="active"'; ?>>
                            <i class="icon-user"></i> <?php echo $jezik['text8']; ?>
                        </li>
                    </a>
                    <div id="sep"></div>
                    <a href="naruci.php">
                        <li <?php if($fajl=="naruci") echo'class="active"'; ?>>
                            <i class="icon-gamepad"></i> <?php echo $jezik['text9']; ?>
                        </li>
                    </a>

                    <div id="sep"></div>
                    <a href="gp.php">
                        <li <?php if($fajl=="gp") echo'class="active"'; ?>>
                            <i class="icon-windows"></i> <?php echo $jezik['text10']; ?>
                        </li>
                    </a>
                    <div id="sep"></div>
                    <a href="./forum">
                        <li>
                            <i class="icon-comment"></i> <?php echo $jezik['text11']; ?>
                        </li>
                    </a>
                    <div id="sep"></div>
                    <a href="#modal-contact" rel="modal">
                        <li>
                            <i class="icon-envelope-alt"></i> <?php echo $jezik['text12']; ?>
                        </li>
                    </a>
                    <div id="sep"></div>
                                                                                <a href="./klijent">
                        <li>
                            <i class="icon-comment"></i> <?php echo $jezik['text11']; ?>
                        </li>
                    </a>
                    <div id="sep"></div>
<?php
                }
                else if($_SESSION['style'] == 'blue')
                {
?>
                    <li style="border-left: 0;">
                        <a href="index.php" <?php if($fajl=="index") echo'class="active"'; ?>>
                            <i class="icon-home"></i> <?php echo $jezik['text7']; ?>
                        </a>
                    </li>
                    <li>
                        <a href="ucp.php" <?php if($fajl=="ucp") echo'class="active"'; ?>>
                            <i class="icon-user"></i> <?php echo $jezik['text8']; ?>
                        </a>
                    </li>
                    <li>
                        <a href="naruci.php" <?php if($fajl=="naruci") echo'class="active"'; ?>>
                            <i class="icon-gamepad"></i> <?php echo $jezik['text9']; ?>
                        </a>
                    </li>
                    <li>
                        <a href="gp.php" <?php if($fajl=="gp") echo'class="active"'; ?>>
                            <i class="icon-windows"></i> <?php echo $jezik['text10']; ?>
                        </a>
                    </li>
                    <li>
                        <a href="#modal-contact" rel="modal">
                            <i class="icon-envelope-alt"></i> <?php echo $jezik['text12']; ?>
                        </a>
                    </li>
                    <li>
					    <a href="http://klijent.e-max.xyz">
                        <i class="icon-comment"></i> WHMCS
                        </a>
                    </li>

<?php
                }
?>
                </ul>
            </div> <!-- #navigacija end  -->

<?php
            if(isset($return)) {
                if($return=="ucp.php"){
?>
            <div id="mininav">
                <ul>
                    <a href="ucp.php">
                        <li <?php if($ucp == "ucp") echo 'class="active"'; ?>><i class="icon-user"></i> <?php echo $jezik['text13']; ?></li>
                    </a>
                    <div id="sep"></div>
                    <a href="ucp-billing.php">
                        <li <?php if($ucp == "ucp-billing") echo 'class="active"'; ?>><i class="icon-usd"></i> <?php echo $jezik['text14']; ?></li>
                    </a>
                    <div id="sep"></div>
            <?php	if($_SESSION['sigkod'] == "0") { ?>
                    <a rel="modal" href="#modal-sigkod2">
                        <li <?php if($ucp == "ucp-podesavanja") echo 'class="active"'; ?>><i class="icon-cog"></i> <?php echo $jezik['text15']; ?></li>
                    </a>
            <?php	} else {	?>
                    <a href="ucp-podesavanja.php">
                        <li <?php if($ucp == "ucp-podesavanja") echo 'class="active"'; ?>><i class="icon-cog"></i> <?php echo $jezik['text15']; ?></li>
                    </a>
            <?php	}	?>
                    <div id="sep"></div>
                    <a href="ucp-logovi.php">
                        <li <?php if($ucp == "ucp-logovi") echo 'class="active"'; ?>><i class="icon-th-large"></i> <?php echo $jezik['text16']; ?></li>
                    </a>
					<a href="ucp-smsadd.php">
                        <li <?php if($ucp == "ucp-smsadd") echo 'class="active"'; ?>><i class="icon-usd"></i> <?php echo $jezik['text16sa']; ?></li>
                    </a>
					<a href="ucp-smslogovi.php">
                        <li <?php if($ucp == "ucp-smslogovi") echo 'class="active"'; ?>><i class="icon-th-large"></i> <?php echo $jezik['text16s']; ?></li>
                    </a>
                </ul>
            </div> <!-- #mininav end -->
<?php     	$replies = query_numrows("SELECT `id` FROM `tiketi` WHERE `user_id` = '{$_SESSION[klijentid]}' AND `status` = '2'");
            if($replies > 0)
            {
                if($replies > 1) $textet = "odgovorena tiketa";
                else $textet = "odgovoren tiket";
?>
            <div id="brzakcija" style="display: block;">
                <p id="h4">Informacija</p>
                <p id="h2">Imate <z><?php echo $replies."</z> ".$textet; ?>. <a href="gp-podrska.php">Klik</a>.
                </p>
            </div> <!-- #brzaakcija end -->
<?php } ?>
<?php
                }
                if($return=="gp.php"){
?>
            <div id="mininav">
                <ul>
                    <a href="gp.php">
                        <li <?php if($ucp == "gp") echo 'class="active"'; ?>><i class="icon-user"></i> <?php echo $jezik['text17']; ?></li>
                    </a>
                    <div id="sep"></div>
                    <a href="gp-serveri.php">
                        <li <?php if($ucp == "gp-serveri") echo 'class="active"'; ?>><i class="icon-usd"></i> <?php echo $jezik['text18']; ?></li>
                    </a>
                    <div id="sep"></div>
                    <a href="topserveri.php">
                        <li <?php if($ucp == "mh-topserveri") echo 'class="active"'; ?>><i class="icon-th-large"></i> <?php echo $jezik['text605']; ?></li>
                    </a>
                    <div id="sep"></div>
                    <a href="gp-podrska.php">
                        <li <?php if($ucp == "gp-podrska") echo 'class="active"'; ?>><i class="icon-th-large"></i> <?php echo $jezik['text19']; ?></li>
                    </a>
                </ul>
            </div> <!-- #mininav end -->
<?php     	$replies = query_numrows("SELECT `id` FROM `tiketi` WHERE `user_id` = '{$_SESSION[klijentid]}' AND `status` = '2'");
            if($replies > 0)
            {
                if($replies > 1) $textet = "odgovorena tiketa";
                else $textet = "odgovoren tiket";
?>
            <div id="brzakcija" style="display: block;">
                <p id="h4">Informacija</p>
                <p id="h2">Imate <z><?php echo $replies."</z> ".$textet; ?>. <a href="gp-podrska.php">Klik</a>.
                </p>
            </div> <!-- #brzaakcija end -->
<?php
            }
                }
            if(isset($gpr)) {
                if($gpr=="1"){
                    $server = query_fetch_assoc("SELECT s.*, k.ime, k.prezime, k.klijentid FROM serveri s, klijenti k WHERE s.id = {$serverid} AND k.klijentid = s.user_id");
?>
            <div id="sep" style="margin-bottom: 5px;"></div> <!-- #sep end -->
            <div id="serverinfo">
<?php       if($gps != "server") { ?>
            <div id="loading2"><p></p></div>
            <p id="h4" style="padding-top: 5px;"><?php echo htmlspecialchars($server['name']); ?></p>
                <div id="nav">
                    <ul>
                        <a href="gp-server.php?id=<?php echo $serverid; ?>">
                            <li <?php if($gps == "gp-server") echo 'class="active"'; ?>>
                                <i class="icon-flag"></i> <?php echo $jezik['text20']; ?>
                            </li>
                        </a>
                        <a href="gp-webftp.php?id=<?php echo $serverid; ?>">
                            <li <?php if($gps == "gp-webftp") echo 'class="active"'; ?>>
                                <i class="icon-folder-open"></i> <?php echo $jezik['text21']; ?>
                            </li>
                        </a>
<?php
                        if($server['igra'] == "1") {
?>
                        <a href="gp-admini.php?id=<?php echo $serverid; ?>">
                            <li <?php if($gps == "gp-admini") echo 'class="active"'; ?>>
                                <i class="icon-group"></i> <?php echo $jezik['text22']; ?>
                            </li>
                        </a>
                        <a href="gp-plugins.php?id=<?php echo $serverid; ?>">
                            <li <?php if($gps == "gp-plugins") echo 'class="active"'; ?>>
                                <i class="icon-gear"></i> <?php echo $jezik['text23']; ?>
                            </li>
                        </a>
<?php
                        }
?>
                        <a href="gp-modovi.php?id=<?php echo $serverid; ?>">
                            <li <?php if($gps == "gp-modovi") echo 'class="active"'; ?>>
                                <i class="icon-gear"></i> <?php echo $jezik['text24']; ?>
                            </li>
                        </a>
                        <a href="gp-konzola.php?id=<?php echo $serverid; ?>">
                            <li <?php if($gps == "gp-konzola") echo 'class="active"'; ?>>
                                <i class="icon-th-list"></i> Console
                            </li>
                        </a>
                        <!--<a href="gp-backup2.php?id=<?php echo $serverid; ?>">
                            <li <?php if($gps == "gp-backup2") echo 'class="active"'; ?>>
                                <i class="icon-download"></i> Backup
                            </li>
                        </a>-->
                        <a href="#modal-<?php if($_SESSION['sigkod'] == "0") echo 'sigkod'; else echo 'reinstall'; ?>" rel="modal">
                            <li <?php if($gps == "gp-reinstall") echo 'class="active"'; ?>>
                                <i class="icon-refresh"></i> <?php echo $jezik['text25']; ?>
                            </li>
                        </a>
                        <a href="#modal-<?php if($_SESSION['sigkod'] == "0") echo 'sigkod'; else echo 'transfer'; ?>" rel="modal">
                            <li <?php if($gps == "gp-transfer") echo 'class="active"'; ?>>
                                <i class="icon-gear"></i> <?php echo "Transfer"; ?>
                            </li>
                        </a>



<?php
                        if($server['igra'] == "1") {
?>
                        <a href="gp-boost.php?id=<?php echo $serverid; ?>">
                            <li <?php if($gps == "gp-boost") echo 'class="active"'; ?>>
                                <i class="icon-random"></i> <?php echo $jezik['text26']; ?>
                            </li>
                        </a>

<?php
                        }
?>
                                                <a href="gp-autorestart.php?id=<?php echo $serverid; ?>">
                            <li <?php if($gps == "gp-autorestart") echo 'class="active"'; ?>><i class="icon-refresh"></i> AutoRR</li>
                        </a>


<?php
                        if($server['startovan'] == "0") {
?>
                        <form method="POST" action="serverprocess.php" id="server-start">
                            <input type="hidden" name="task" value="server-start" />
                            <input type="hidden" name="serverid" value="<?php echo $serverid; ?>" />
                            <button onclick="loading('Startovanje servera')" type="submit" style="cursor: pointer;background: rgba(0,0,0,0);margin-top: -1px;margin-right: -5px;border: 0; float: right;">
                                <li style="color: #4ED000;">
                                    <i class="icon-power-off"></i> <?php echo $jezik['text28']; ?>
                                </li>
                            </a>
                        </form>
<?php
                        } else {
?>
                        <form method="POST" action="serverprocess.php" id="server-stop">
                            <input type="hidden" name="task" value="server-stop" />
                            <input type="hidden" name="serverid" value="<?php echo $serverid; ?>" />
                            <button onclick="loading('Stopiranje servera')" type="submit" style="cursor: pointer;background: rgba(0,0,0,0);margin-top: -1px;margin-right: -5px;border: 0; float: right;">
                                <li style="color: #FF0000;">
                                    <i class="icon-off"></i> <?php echo $jezik['text29']; ?>
                                </li>
                            </a>
                        </form>

                        <form method="POST" action="serverprocess.php" id="server-restart">
                            <input type="hidden" name="task" value="server-restart" />
                            <input type="hidden" name="serverid" value="<?php echo $serverid; ?>" />
                            <button onclick="loading('Restartovanje servera')" type="submit" style="cursor: pointer;background: rgba(0,0,0,0); margin-top: -1px;margin-right: -15px;border: 0; float: right;">
                                <li style="color: yellow;">
                                    <i class="icon-refresh"></i> <?php echo $jezik['text30']; ?>
                                </li>
                            </a>
                        </form>
<?php
                        }

?>

                    </ul>
                </div>
<?php
                }
                }
            }
            }
?>
<script type="text/javascript">
var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
(function(){
var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
s1.async=true;
s1.src='https://embed.tawk.to/59f4f8b14854b82732ff880f/default';
s1.charset='UTF-8';
s1.setAttribute('crossorigin','*');
s0.parentNode.insertBefore(s1,s0);
})();
</script>
<!--End of Tawk.to Script-->