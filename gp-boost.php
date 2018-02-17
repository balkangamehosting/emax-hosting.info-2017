<?php
session_start();
include("includes.php");
$naslov = $jezik['text320'];
$fajl = "gp";
$return = "gp.php";
$ucp = "gp-serveri";
$gpr = "1";
$gps = "gp-boost";



if(klijentServeri($_SESSION['klijentid']) == 0)
{
	$_SESSION['msg'] = $jezik['text300'];
	header("Location: index.php");
}

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

if($server['igra'] != "1")
{
	$_SESSION['msg'] = $jezik['text313'];
	header("Location: gp-server.php?id=".$serverid);
	die();
}

include("./assets/header.php");

?>
	<div id="bsve">
		<i id="ib" class="icon-cog icon-spin icon-4x"></i>
		<p id="h5"><?php echo $jezik['text321']; ?></p><br />
		<p><?php echo $jezik['text322']; ?></p><br />
		<p style="margin-top: -3px;"><?php echo $jezik['text323']; ?> <a href="http://e-max.xyz/">gt.e-max.xyz</a>.</p>	
		
		<form action="serverprocess.php" method="post" id="server-boost">
			<input type="hidden" name="task" value="server-boost" />
			<input type="hidden" name="serverid" value="<?php echo $serverid; ?>" />
			<button type="submit" class="btn btn-warning btn-large btn-block" style="width: 35%; float: right; margin-top: -30px;"><i class="icon-gamepad"></i> <?php echo $jezik['text324']; ?></button>
		</form><br /><br />
		<table id="webftp">
			<tr>
				<th>#ID</th>
				<th><?php echo $jezik['text325']; ?></th>
				<th><?php echo $jezik['text326']; ?></th>
			</tr>
<?php
		$kon = mysql_connect(BOOST_HOST, BOOST_DBUSER, BOOST_DBPASS);
		$sel = mysql_select_db(BOOST_DBNAME);
		
		$adjacents = 3;

		$sql = "SELECT COUNT(*) as num FROM `servers` WHERE `address` = '{$boxip['ip']}:{$server['port']}'";
		$ukupnostrana = query_fetch_assoc($sql);
		$ukupnostrana = $ukupnostrana['num'];

		$targetstrana = "gp-boost.php?id=".$serverid; 	
		$limit = 15; 	
			
		if(empty($_GET['strana'])) 
		{
			$start = 0;	
			$strana = 1;
		}
		elseif(!isset($_GET['strana'])) 
		{
			$start = 0; 	
			$strana = 0;
		} 
		else
		{
			$start = ($_GET['strana'] - 1) * $limit;
			if(!is_numeric($_GET['strana'])) { $_SESSION['msg'] = $jezik['text327']; header("Location: ucp-logovi.php"); die(); }
			$zadnjastrana = ceil($ukupnostrana/$limit);		
			$strana = mysql_real_escape_string($_GET['strana']);
			if($zadnjastrana < $strana OR $strana < 1) { $_SESSION['msg'] = $jezik['text328']; header("Location: ucp-logovi.php"); die(); }
		}
			
		$sql = "SELECT * FROM `servers` WHERE `address` = '{$boxip['ip']}:{$server['port']}' ORDER BY `id` DESC LIMIT $start, $limit";
		$result = mysql_query($sql);
			

		if ($strana == 0) $strana = 1;					
		$prev = $strana - 1;							
		$next = $strana + 1;
		$zadnjastrana = ceil($ukupnostrana/$limit);								
		$lpm1 = $zadnjastrana - 1;					
			
		$paginacija = "";
		if($zadnjastrana > 1)
		{	
			$paginacija .= "<div class=\"pagination\"><ul>";
			
			//Prethodna button
			if ($strana > 1) 
				$paginacija.= "<li><a href=\"$targetstrana&strana=$prev\">«</a></li>";
			else
				$paginacija.= "<li class=\"disabled\"><a>«</a></li>";	
				
			//Strana	
			if ($zadnjastrana < 7 + ($adjacents * 2))	//not enough stranas to bother breaking it up
			{	
				for ($counter = 1; $counter <= $zadnjastrana; $counter++)
				{
					if ($counter == $strana)
						$paginacija.= "<li><a class=\"active\">$counter</a></li>";
					else
						$paginacija.= "<li><a href=\"$targetstrana&strana=$counter\">$counter</a></li>";					
				}
			}
			elseif($zadnjastrana > 5 + ($adjacents * 2))	//enough stranas to hide some
			{
				if($strana < 1 + ($adjacents * 2))		
				{
					for ($counter = 1; $counter < 4 + ($adjacents * 2); $counter++)
					{
						if ($counter == $strana)
							$paginacija.= "<li><a class=\"active\">$counter</a></li>";
						else
							$paginacija.= "<li><a href=\"$targetstrana&strana=$counter\">$counter</a></li>";					
					}
					$paginacija.= "<li><a>...</a></li>";
					$paginacija.= "<li><a href=\"$targetstrana&strana=$lpm1\">$lpm1</a></li>";
					$paginacija.= "<li><a href=\"$targetstrana&strana=$zadnjastrana\">$zadnjastrana</a></li>";		
				}
				elseif($zadnjastrana - ($adjacents * 2) > $strana && $strana > ($adjacents * 2))
				{
					$paginacija.= "<li><a href=\"$targetstrana&strana=1\">1</a></li>";
					$paginacija.= "<li><a href=\"$targetstrana&strana=2\">2</a></li>";
					$paginacija.= "<li><a>...</a></li>";
					for ($counter = $strana - $adjacents; $counter <= $strana + $adjacents; $counter++)
					{
						if ($counter == $strana)
							$paginacija.= "<li><a class=\"active\">$counter</a></li>";
						else
							$paginacija.= "<li><a href=\"$targetstrana&strana=$counter\">$counter</a></li>";					
					}
					$paginacija.= "<li><a>...</a></li>";
					$paginacija.= "<li><a href=\"$targetstrana&strana=$lpm1\">$lpm1</a></li>";
					$paginacija.= "<li><a href=\"$targetstrana&strana=$zadnjastrana\">$zadnjastrana</a></li>";		
				}
				else
				{
					$paginacija.= "<li><a href=\"$targetstrana&strana=1\">1</a></li>";
					$paginacija.= "<li><a href=\"$targetstrana&strana=2\">2</a></li>";
					$paginacija.= "<li><a>...</a></li>";
					for ($counter = $zadnjastrana - (2 + ($adjacents * 2)); $counter <= $zadnjastrana; $counter++)
					{
						if ($counter == $strana)
							$paginacija.= "<li><a class=\"active\">$counter</a></li>";
						else
							$paginacija.= "<li><a href=\"$targetstrana&strana=$counter\">$counter</a></li>";					
					}
				}
			}
				
				//next button
			if ($strana < $counter - 1)
				$paginacija.= "<li><a href=\"$targetstrana&strana=$next\">»</a></li>";
			else
				$paginacija.= "<li class=\"disabled\"><a>»</a></li>";
			$paginacija.= "</ul></div>\n";	
				
		}		

		if(mysql_num_rows($result) == 0) echo '<tr><td colspan="3">'.$jezik['text329'].'</td></tr>';
		
		while($row = mysql_fetch_array($result))
		{
?>
			<tr>
				<td>#<?php echo $row['id']; ?></td>
				<td><?php echo $row['nick']; ?></td>
				<td><?php echo vreme($row['time']); ?></td>
			</tr>
<?php
		}
		
		mysql_close($kon);
		unset($sel);
		unset($kon);

?>
		</table>
		<?=$paginacija?>
	</div>
</div>
<?php
include("./assets/footer.php");
?>