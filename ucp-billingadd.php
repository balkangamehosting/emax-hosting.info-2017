<?php
session_start();
include("includes.php");
$naslov = $jezik['text563'];
$fajl = "ucp";
$return = "ucp.php";
$ucp = "ucp-billing";


include("./assets/header.php");

if(!isset($_SESSION['klijentid'])){
    header("Location: process.php?task=logout");
}

$klijent = query_fetch_assoc("SELECT * FROM `klijenti` WHERE `klijentid` = '".$_SESSION['klijentid']."'");

// Ovo za info, ti uradi
$ppinfo = query_fetch_assoc("SELECT * FROM `paypal_ipn` WHERE `clientid` = '{$_SESSION[klijentid]}' ORDER BY `id` DESC LIMIT 1");



?>
<div id="sep" style="margin-bottom: 5px;"></div> <!-- #sep end -->

<table id="serverinfo">
    <tr>
        <th width="73%"></th>
        <th width="27%"></th>
    </tr>
    <tr>
        <td>
            <div id="infox">
                <i style="font-size: 3em;" class="icon-sitemap"></i>
                <p id="h5"><?php echo $jezik['text14']; ?></p><br />
                <p><?php echo $jezik['text553']; ?></th></p><br />
            </div>
        </td>
        <td>
            <div id="infox">
                <i style="font-size: 3em;" class="icon-user"></i>
                <p id="h5"><?php echo $jezik['text467']; ?></p><br />
                <p><?php echo $jezik['text468']; ?></p><br />
            </div>
        </td>
    </tr>
    <tr style="vertical-align: top;">
        <td id="td" style="overflow: inherit;">
<?php	if(!isset($_GET['tip'])){	?>
            <div id="infox">
                <i class="icon-" style="font-size: 35px;">1</i>
                <p id="h5"><?php echo $jezik['text564']; ?></p><br />
                <p><?php echo $jezik['text565']; ?></p><br />
            </div>
            <form action="ucp-billingadd.php" method="GET">
                <select name="tip" rel="mod" style="max-width: 252px;">
                    <option value="banka"><?php echo $jezik['text566']; ?></option> /* Banka */
                    <option value="paypal"><?php echo $jezik['text567']; ?></option> /* PayPal */
                    <option value="psc">Paysafecard (Hrvatska)</option>
                    </select><br />
                <button class="btn btn-small btn-warning" type="submit"><i class="icon-arrow-right"></i> Dalje</button>
            </form>
<?php } else if($_GET['tip']=="psc") {	?>

                    <div id="infox">
                                <i class="icon-" style="font-size: 35px;">2</i>
                                <p id="h5"><?php echo $jezik['text476']; ?></p><br />
                                <p><?php echo $jezik['text568']; ?></p><br />
                    </div>


        <form action="process.php" method="POST" id="billingaddp" style="margin-top: 5px;">
                <table width="100%">
                                        <tr>
                                                <th width="50%"></th>
                                                <th width="50%"></th>
                                        </tr>
                                        <tr>

                                                <td>
                                                        <input name="novac" type="text" class="input" id="ki" placeholder="Primjer: 50.00 kn: " /><br />
                                                        <label id="titlex">
                                                        *<?php echo $jezik['text570']; ?>
                                                        </label>
                                                </td>

                                                <td>
                                                        <input name="psc" type="text" class="input" id="ki" placeholder="PSC broj: xxxxxxxxxxxxxxxx" /><br />
                                                        <label id="titlex">
                                                        *<?php echo $jezik['text571']; ?>
                                                        </label>
                                                </td>
                                        </tr>


                                        <tr>
                                                <td>
                                                        <input type="hidden" name="task" value="dodaj_uplatu_psc" />
                                                        <input type="hidden" name="klijentid" value="<?php echo $_SESSION['klijentid']; ?>" />
                                                        <button class="btn btn-small btn-warning" type="submit"><i class="icon-arrow-right"></i> <?php echo $jezik['text562']; ?></button>
                                                </td>
                                        </tr>
                                </table>

        </form>
<?php	} else if($_GET['tip']=="banka") {	?>
            <div id="infox">
                <i class="icon-" style="font-size: 35px;">2</i>
                <p id="h5"><?php echo $jezik['text476']; ?></p><br />
                <p><?php echo $jezik['text568']; ?></p><br />
            </div>
            <form action="process.php" method="POST" id="billingaddp" style="margin-top: 5px;">
                <table width="100%">
                    <tr>
                        <th width="50%"></th>
                        <th width="50%"></th>
                    </tr>
                    <tr>
                        <td>
                            <input name="ime" type="text" class="input" id="ki" placeholder="<?php echo $jezik['text576']; ?>: <?php echo $klijent['ime'].' '.$klijent['prezime']; ?>" /><br />
                            <label id="titlex">
                            *<?php echo $jezik['text569']; ?>
                            </label>
                        </td>
                        <td>
                            <input name="novac" type="text" class="input" id="ki" placeholder="<?php echo $jezik['text576']; ?>: <?php echo str_replace(" din", "", novac("250", $klijent['zemlja'])); ?>" /><br />
                            <label id="titlex">
                            *<?php echo $jezik['text570']; ?>
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input name="brracuna" type="text" class="input" id="ki" placeholder="<?php echo $jezik['text576']; ?>: xxxxxxxxxxxxxx" /><br />
                            <label id="titlex">
                            *<?php echo $jezik['text571']; ?>
                            </label>
                        </td>
                        <td>
                            <input name="datum" type="text" class="input" id="ki" placeholder="<?php echo $jezik['text576']; ?>: <?php echo date("d.m.Y, H:i", time()); ?>" /><br />
                            <label id="titlex">
                            *<?php echo $jezik['text572']; ?>
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td><br />
                            <select id="meseci" name="drzava" rel="mesecx">
                                <option value="srb">Srbija</option>
                                <option value="cg">Crna gora</option>
                                <option value="bih">Bosna i Hercegovina</option>
                                <option value="hr">Hrvatska</option>
                            </select>
                            <label id="titlex">
                            *<?php echo $jezik['text573']; ?>
                            </label>
                        </td>
                        <td>
                            <input name="uplatnice" type="text" class="input" id="ki" placeholder="http://slika.png | http://slika2.png ..." /><br />
                            <label id="titlex">
                            <?php echo $jezik['text574']; ?>
                            </label>
                                <br /><br /><br />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="hidden" name="task" value="dodaj_uplatu" />
                            <input type="hidden" name="klijentid" value="<?php echo $_SESSION['klijentid']; ?>" />
                            <button class="btn btn-small btn-warning" type="submit"><i class="icon-arrow-right"></i> <?php echo $jezik['text562']; ?></button>
                            <a rel="modal" href="#modal-uplata" style="color: #FFF;" class="btn btn-small btn-danger" type="submit"><i class="icon-edit"></i> <?php echo $jezik['text575']; ?></button>
                        </td>
                    </tr>
                </table>
            </form>

    <?php	} else if($_GET['tip']=="paypal") {	?>
        <div id="infox">
            <i class="icon-" style="font-size: 35px;">2</i>
            <p id="h5"><?php echo _GP_BILLINGADD_PAYPAL_TITLE ?></p><br />
            <p><?php echo _GP_BILLINGADD_PAYPAL_INFO ?></p><br />
        </div>

            <script type="text/javascript">
                //<!--

                function paymentProcess() {
                    var mForm = document.paypal_form;
                    var pmtAmt = 0;
                    pmtAmt = mForm.amount.value;

                    var check_re = /^[^\d]*([0-9,]*\.?\d*).*$/;

                        if ((trim(pmtAmt) != "") && pmtAmt.match(check_re)) {
                            var amount = parseFloat(pmtAmt.replace(check_re, "$1").replace(",", ""));
                            amount = amount.toFixed(2);

                            if (!isNaN(amount))
                            {
                                if (amount < 1) {
                                    alert("<?php echo _GP_BILLINGADD_PAYPAL_AMOUNT_MIN ?>");
                                } else if (amount > 10000) {
                                    alert("<?php echo _GP_BILLINGADD_PAYPAL_AMOUNT_MAX ?>");
                                } else {

                                    mForm.amount.value = amount;
                                    mForm.submit();
                                }
                            } else {
                                alert("<?php echo _GP_BILLINGADD_PAYPAL_AMOUNT_ER1 ?>");
                            }
                        } else {
                            alert("<?php echo _GP_BILLINGADD_PAYPAL_AMOUNT_ER1 ?>");
                        }
                }


                //-->
            </script>

            <?php


                if($_SESSION['klijentid'] == 652) //botko
                echo '<form name="paypal_form" action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">';
                else
                echo '<form name="paypal_form" action="https://www.paypal.com/cgi-bin/webscr" method="post">';


            ?>

            <table width="100%">
                <tr>
                    <th width="50%"></th>
                    <th width="50%"></th>
                </tr>
                <tr>
                    <td>

                        <input type="hidden" name="cmd" value="_xclick">
                        <input type="hidden" name="business" value="<?php echo $config['paypal']['email']?>">
                        <input type="hidden" name="item_name" value="e-max.xyz Payment Add Funds">

                        <?php

                            $random_hash2 = random_str( $length = 6, $chars = "1234567890" );
                            $random_hash3 = random_str( $length = 2, $chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" );

                            $tid = ''.$_SESSION['klijentid']."-".$random_hash3."".$random_hash2.'';

                        ?>

                        <input type="hidden" name="invoice" value="<?php echo $tid;?>" />
                        <input type="hidden" name="currency_code" value="EUR">
                        <?php


                            if($_SESSION['klijentid'] == 651) //botko
                            echo '<input type="hidden" name="notify_url" value="http://e-max.xyz/paypal/paypal_payment.php" />';
                            else
                            echo '<input type="hidden" name="notify_url" value="http://e-max.xyz/paypal/paypal_payment.php" />';


                        ?>
                        <input type="hidden" name="cancel_return" value="http://e-max.xyz/ucp-billingadd.php?tip=paypalcancel" />
                        <input type="hidden" name="return" value="http://e-max.xyz/ucp-billingadd.php?tip=paypalsuccessfunds" />

                        <input type="hidden" name="cbt" value="Back to e-Max Hosting" />
                        <input type="hidden" name="no_note" value="1" />
                        <input type="hidden" name="no_shipping" value="1" />
                        <input type="hidden" name="cs" value="1" />
                        <input type="hidden" name="cpp_header_image" value="http://e-max.xyz/assets/blue/img/logo2.png" />
                        <input type="hidden" name="page_style" value="gameservers"/>


                        <label id="titlex">
                            *<?php echo _GP_BILLINGADD_PAYPAL_AMOUNT ?>
                        </label>

                        <input type="text" name="amount" class="input" id="ki" placeholder="<?php echo $jezik['text576']; ?>: 10‚Ç¨"/> <br />

                        <br />

                        <input type="hidden" name="klijentid" value="<?php echo $_SESSION['klijentid']; ?>" />

                        <!--<input type="image" src="https://www.paypalobjects.com/en_US/AT/i/btn/btn_paynowCC_LG.gif" border="0" name="submit" alt="Make payments with PayPal - it's fast, free and secure!" style="border:0;width:100px;">-->

                        <a href="javascript:paymentProcess();" style="color: #FFF;" class="btn btn-small btn-danger"><i class="icon-arrow-right"></i> <?php echo $jezik['text562']; ?></a>
                    </td>
                </tr>



        </table>
    </form>

        <?php	} else if($_GET['tip']=="paypalsuccessfunds") {

        $payment_status = $_POST['payment_status'];
        $datum = $_POST['payment_date'];
        $txn_id = $_POST['txn_id'];

        ?>

        <div id="infox">
            <i class="icon-" style="font-size: 35px;">2</i>

            <p id="h5">Payment is confirmed</p><br />
            <p><font color="#00FF00">Information:</font> Your payment has been validated and the amount has been added to your account.</p><br />
        </div>

        <table id="webftp">
            <tr>
                <td>Transaction ID: </td>
                <td><z>#<?php echo $txn_id ?></z></td>
            </tr>
            <tr>
                <td>Status:</td>
                <td><z><?php echo $payment_status ?></z></td>
            </tr>
            <tr>
                <td>Date transaction:</td>
                <td><z><?php echo $datum ?></z></td>
            </tr>
            <tr>
                <td colspan="5" style="background: none;">
                    <a class="btn btn-small btn-warning" href="naruci.php" style="color: #FFF; float: right;" type="button"><i class="icon-credit-card"></i> Order server</a>
                </td>
            </tr>
        </table>
    <?php	}
            else if($_GET['tip'] == "sms") {
    ?>

<tr>
		<td id="td" style="overflow: inherit;">
		<div id="infox">
			<i class="icon-" style="font-size: 35px;">1</i>

			<p id="h5">SMS plaÊanje</p><br>
			<p>PlaÊanje putem SMS-a je duplo skuplje!<br> Vodite raËuna pri slanju SMS-a, mi nismo odgovorni ako pogreöno ukucate poruku ili broj.</p><br>
			
		</div>
		
		<center><br><br>
                <a id="fmp-button" href="#" rel="54fa2ff8b7db0b8f65cfd30bd121e9fc/<?php echo $_SESSION['klijentusername']; ?>" class="fmpboxElement"><img src="https://assets.fortumo.com/fmp/fortumopay_150x50_red.png" width="150" height="50" alt="Mobile Payments by Fortumo" border="0"></a>				</center><center><br>
				<p>Vaö unikatni link za donacije, preko ovog linka vaöi igraci npr. mogu kupovat rankove na serverima i sl.</p>
                <a href="http://www.e-max.xyz/sms/54fa2ff8b7db0b8f65cfd30bd121e9fc" target="_blank"> http://www.e-max.xyz/sms/54fa2ff8b7db0b8f65cfd30bd121e9fc</a>				</center><table width="100%">
			<tbody><tr>
				<th width="50%"></th>
				<th width="50%"></th>
			</tr>			
			<tr>
				<script id="facebook-jssdk" src="//connect.facebook.net/en_US/sdk.js#xfbml=1&amp;version=v2.0"></script><script async="" src="//www.google-analytics.com/analytics.js"></script><script type="text/javascript" async=""></script><script src="https://assets.fortumo.com/fmp/fortumopay.js" type="text/javascript"></script><script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script><script src="https://assets.fortumo.com/fmp/fmp_loader.js" type="text/javascript"></script>
				
	            
			</tr>
			
				
				
     <?php
            if(!empty($_GET['igra'])) {
?>
                <form action="" method="get">
                    <input type="hidden" name="tip" value="sms" />
                    <input type="hidden" name="igra" value="<?php echo $_GET['igra']; ?>" />
                    <td>
                        <select name="slotovi" rel="csx" onchange="this.form.submit()">
                            <option value="0" selected="selected" disabled><?php echo $jezik['text479']; ?></option>
                            <?php
                            if($_GET['igra'] == "1") {
                            ?>
                            <option value="20" <?php if($_GET['slotovi'] == "20") echo'disabled selected="selected"'; ?>>20 <?php echo $jezik['text480']; ?></option>
                            <?php
                            }
                            else
                            if($_GET['igra'] == "2") {
                            ?>
                            <option value="60" <?php if($_GET['slotovi'] == "60") echo'disabled selected="selected"'; ?>>60 <?php echo $jezik['text480']; ?></option>
                            <option value="100" <?php if($_GET['slotovi'] == "100") echo'disabled selected="selected"'; ?>>100 <?php echo $jezik['text480']; ?></option>
                            <?php
                            }
                            ?>
                        </select>
                        <label id="titlex">
                        *<?php echo $jezik['text481']; ?>
                        </label><br />
                    </td>
                </form>
<?php
            }
?>
            </tr>
<?php
            if(!empty($_GET['igra']) AND !empty($_GET['slotovi'])) {
?>
            <tr>
                <td colspan="2"><br />
                    <table id="webftp">
                        <tr>
                            <td>Informacija: </td>
                            <td><z>Ukoliko je cijena servera npr 6km/3‚Ç¨ plaƒáate 3x ≈°aljete sms,cijena jedne sms je 1‚Ç¨!<br /> Vodite raƒçuna pri slanju SMS-a, mi nismo odgovorni ako pogre≈°no ukucate poruku ili broj.</z></td>
                        </tr>
                        <tr>
                            <td colspan="5" style="background: none;">
                                <script src='https://assets.fortumo.com/fmp/fortumopay.js' type='text/javascript'></script>
<a id="fmp-button" href="#" rel="54fa2ff8b7db0b8f65cfd30bd121e9fc"><img src="https://assets.fortumo.com/fmp/fortumopay_150x50_red.png" width="150" height="50" alt="Mobile Payments by Fortumo" border="0" /></a>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
<?php
            }
?>
        </table>
    <?php
            }
    ?>
        </td>

         <?php include "gp-accountinfo.php"; ?>

    </tr>
</table> <!-- #tabbilling end -->

<?php
include("./assets/footer.php");

if(isset($_GET['tip'])) {
if($_GET['tip'] == "banka") {
?>
    <script>
    $(document).ready(function() {
        $.colorbox({inline:true, href:"#modal-uplata"});
    });
    </script>
<?php
}
}
?>