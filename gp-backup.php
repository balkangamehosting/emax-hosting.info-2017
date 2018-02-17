<?php
session_start();
include("includes.php");
$naslov = $jezik['text320'];
$fajl = "gp";
$return = "gp.php";
$ucp = "gp-serveri";
$gpr = "1";
$gps = "gp-backup";

$basename = basename($_SERVER['REQUEST_URI']);




if(klijentServeri($_SESSION['klijentid']) == 0)
{
	$_SESSION['msg'] = $jezik['text300'];
	header("Location: index.php");
}



/*if($_SESSION['klijentid'] != 652)
{
	$_SESSION['msg'] = "Soon.";
	header("Location: index.php");
}*/

$serverid = mysql_real_escape_string($_GET['id']);

if(!isset($_SESSION['klijentid'])){
	header("Location: process.php?task=logout");
}

if(!isset($_GET['id']) or !is_numeric($_GET['id']))
{
	$_SESSION['msg'] = $jezik['text311'];
	header("Location: gp-serveri.php");
	die();
}

if(query_numrows("SELECT `id` FROM `serveri` WHERE `user_id` = '".$_SESSION['klijentid']."' AND `id` = '".$serverid."'") == 0)
{
	$_SESSION['msg'] = $jezik['text312'];
	header("Location: gp-serveri.php");
	die();
}

$server = query_fetch_assoc("SELECT * FROM `serveri` WHERE `id` = '{$serverid}'");
$boxip = query_fetch_assoc("SELECT * FROM `boxip` WHERE `ipid` = '{$server['ip_id']}'");


include("./assets/header.php");

$cg2 = new CSRFGuard();
?>
	<div id="bsve">
		<i id="ib" class="icon-cog icon-spin icon-4x"></i>
		<p id="h5">Backup</p><br />
		<p>Backup mozete uraditi kad god hocete.</p><br />
		<p style="margin-top: -3px;">Maksimalno mozete uraditi jedan backup, svi ostali ce zamenjivati prvi.</p>	
		
		<form action="serverprocess.php" method="post">
		    <?php echo $cg2->generateHiddenField( "server-backup2", "bfe7507954135d") . "\n"; ?>
			<input type="hidden" name="task" value="server-backup2" />
			<input type="hidden" name="serverid" value="<?php echo $serverid; ?>" />
			<button type="submit" class="btn btn-warning btn-large btn-block" style="width: 35%; float: right; margin-top: -30px;"><i class="icon-upload"></i> Napravi backup</button>
		</form><br /><br />
		
		<table id="webftp">
			<tr>
				<th>ID</th>
				<th>Date</th>
				<th>Size</th>
				<th>Status</th>
				<th>Action</th>
			</tr>
<?php	
		
		$query = "SELECT * FROM `server_backup` WHERE `srvid` = '" . $serverid . "'";
		if (!($result = mysql_query($query))) {
			//exit("Failed!! " . mysql_error());
			$error = "Failed!!";
		}
		if (mysql_num_rows($result) <= 0)
		{
			echo '<tr><td colspan="5" align="center">Niste napravili nijednom backup.</td></tr>';
		}
        else{
			
			while ($line = mysql_fetch_assoc($result)) {
			    
				
				
				$id += 1;
				
				$date = date('d.m.Y - H:i:s', $line['time']);
				$size = $line['size'];
				$status = $line['status'];
				$idb = $line['id'];
				
				/*$c = new Cipher();
				$encrypted = $c->encrypt($name);
				$name = $encrypted;*/
				
				if($status == "copying") 
					$status2 = "<td><font color=\"#E08010\">Copying files...</font></td>";
				else if($status == "ok") 
					$status2 = "<td><font color=\"#00FF00\">Available</font></td>";
				else if($status == "restore") 
					$status2 = "<td><font color=\"#00FF00\">Restoring...</font></td>";
				else if($status == "error1" || $status == "error2" || $status == "error3") 
					$status2 = "<td><font color=\"#FE0300\">Error!</font></td>";
				
			    echo "<tr>";
			    echo "<td>#$id</td>";
				echo "<td>$date</td>";
				echo "<td>$size</td>";
				
				echo "$status2";
				
				if($status == "ok"){
					
				echo "<td>
				
				
					
					<form action= \"serverprocess.php\" method=\"post\">";echo $cg2->generateHiddenField( "server-restorebackup2", "bfe7507954135d") . "\n";
			echo "<input type=\"hidden\" name=\"data\" value=\"$idb\" />
			<input type=\"hidden\" name=\"task\" value=\"server-restorebackup2\" />
			<input type=\"hidden\" name=\"serverid\" value=\"$serverid\" />
			<button id=\"ah\" onclick=\"return confirm('Do you really want to restore this backup?\\nThe data can NOT be recovered!')\"> <i class=\"icon-download\"></i> Restore</button></button>
				</form>
				
				
			<form action= \"serverprocess.php\" method=\"post\">";echo $cg2->generateHiddenField( "server-delbackup2", "bfe7507954135d") . "\n";
			echo "<input type=\"hidden\" name=\"data\" value=\"$idb\" />
			<input type=\"hidden\" name=\"task\" value=\"server-delbackup2\" />
			<input type=\"hidden\" name=\"serverid\" value=\"$serverid\" />
			<button id=\"ah\" onclick=\"return confirm('Do you really want to delete this backup?\\nThe data can NOT be recovered!')\"> <i class=\"icon-download\"></i> Delete</button></button>
				</form>	
				</td>";
			
			
			}else{
			
			echo "<td></td>";
			
			}
			
				echo "</tr>";
			}
			
		}
			
		
		/*$listdata = get_backup_data2($_SESSION['klijentid'],$serverid);
		
		
		
		if($listdata == false) 
		    echo '<tr><td colspan="5" align="center">Niste napravili nijednom backup.</td></tr>';
		else{
		foreach ( $listdata as $id => $fileinfo )
		{	
		    $id += 1;
			if($fileinfo['status'] == 4) 
			  continue;
			  
			echo "<tr>";
			
			if($fileinfo['status'] == 2) 
			        echo "<td colspan=\"5\" align=\"center\">Error. </td>";
			else{
				
		    echo "<td>#$id</td>";
			echo "<td>{$fileinfo['date']}</td>";
			echo "<td>{$fileinfo['size']}</td>";
			
			
			if($fileinfo['status'] == 0) 
			   echo "<td><font color=\"#E08010\">Copying files...</font></td>";
			else if($fileinfo['status'] == 1) 
			   echo "<td><font color=\"#00FF00\">Available</font></td>";
			else if($fileinfo['status'] == 3) 
				echo "<td><font color=\"#E08010\">Restoring...</font></td>";
				
			echo "<td>
				
					<form action= \"serverprocess.php\" method=\"post\">";echo $cg2->generateHiddenField( "server-restorebackup2", "bfe7507954135d") . "\n";
			echo "<input type=\"hidden\" name=\"data\" value=\"{$fileinfo['name']}\" />
			<input type=\"hidden\" name=\"task\" value=\"server-restorebackup2\" />
			<input type=\"hidden\" name=\"serverid\" value=\"$serverid\" />
			<button id=\"ah\" onclick=\"return confirm('Do you really want to restore this backup?\\nThe data can NOT be recovered!')\"> <i class=\"icon-download\"></i> Povrati</button></button>
				</form>
				
				
			<form action= \"serverprocess.php\" method=\"post\">";echo $cg2->generateHiddenField( "server-delbackup2", "bfe7507954135d") . "\n";
			echo "<input type=\"hidden\" name=\"data\" value=\"{$fileinfo['name']}\" />
			<input type=\"hidden\" name=\"task\" value=\"server-delbackup2\" />
			<input type=\"hidden\" name=\"serverid\" value=\"$serverid\" />
			<button id=\"ah\" onclick=\"return confirm('Do you really want to delete this backup?\\nThe data can NOT be recovered!')\"> <i class=\"icon-download\"></i> Delete</button></button>
				</form>	
				</td>";
			}
			
			echo "</tr>";
			
			
			
		}
}	*/	
		
?>			
			

	
		</table>
	</div>
</div>
<?php
include("./assets/footer.php");
?>