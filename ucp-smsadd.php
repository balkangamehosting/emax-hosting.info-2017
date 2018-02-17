<?php
session_start();
include("includes.php");
$naslov = $jezik['text577sa'];
$fajl = "ucp";
$return = "ucp.php";
$ucp = "ucp-smsadd";


if(!isset($_SESSION['klijentid'])){
    header("Location: process.php?task=logout");
    die();
}

$adjacents = 3;

$sql = "SELECT COUNT(*) as num FROM `billing_smszemlje`";
$ukupnostrana = query_fetch_assoc($sql);
$ukupnostrana = $ukupnostrana['num'];

$targetstrana = "ucp-smsadd.php";
$limit = 30;

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
    if(!is_numeric($_GET['strana'])) { $_SESSION['msg'] = $jezik['text327']; header("Location: ucp-smsadd.php"); die(); }
    $zadnjastrana = ceil($ukupnostrana/$limit);
    $strana = mysql_real_escape_string($_GET['strana']);
    if($zadnjastrana < $strana OR $strana < 1) { $_SESSION['msg'] = $jezik['text328']; header("Location: ucp-smsadd.php"); die(); }
}

$sql = "SELECT * FROM `billing_smszemlje` ORDER BY `id` DESC LIMIT $start, $limit";
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
        $paginacija.= "<li><a href=\"$targetstrana?strana=$prev\">?/a></li>";
    else
        $paginacija.= "<li class=\"disabled\"><a>?/a></li>";

    //Strana
    if ($zadnjastrana < 7 + ($adjacents * 2))	//not enough stranas to bother breaking it up
    {
        for ($counter = 1; $counter <= $zadnjastrana; $counter++)
        {
            if ($counter == $strana)
                $paginacija.= "<li><a class=\"active\">$counter</a></li>";
            else
                $paginacija.= "<li><a href=\"$targetstrana?strana=$counter\">$counter</a></li>";
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
                    $paginacija.= "<li><a href=\"$targetstrana?strana=$counter\">$counter</a></li>";
            }
            $paginacija.= "<li><a>...</a></li>";
            $paginacija.= "<li><a href=\"$targetstrana?strana=$lpm1\">$lpm1</a></li>";
            $paginacija.= "<li><a href=\"$targetstrana?strana=$zadnjastrana\">$zadnjastrana</a></li>";
        }
        elseif($zadnjastrana - ($adjacents * 2) > $strana && $strana > ($adjacents * 2))
        {
            $paginacija.= "<li><a href=\"$targetstrana?strana=1\">1</a></li>";
            $paginacija.= "<li><a href=\"$targetstrana?strana=2\">2</a></li>";
            $paginacija.= "<li><a>...</a></li>";
            for ($counter = $strana - $adjacents; $counter <= $strana + $adjacents; $counter++)
            {
                if ($counter == $strana)
                    $paginacija.= "<li><a class=\"active\">$counter</a></li>";
                else
                    $paginacija.= "<li><a href=\"$targetstrana?strana=$counter\">$counter</a></li>";
            }
            $paginacija.= "<li><a>...</a></li>";
            $paginacija.= "<li><a href=\"$targetstrana?strana=$lpm1\">$lpm1</a></li>";
            $paginacija.= "<li><a href=\"$targetstrana?strana=$zadnjastrana\">$zadnjastrana</a></li>";
        }
        else
        {
            $paginacija.= "<li><a href=\"$targetstrana?strana=1\">1</a></li>";
            $paginacija.= "<li><a href=\"$targetstrana?strana=2\">2</a></li>";
            $paginacija.= "<li><a>...</a></li>";
            for ($counter = $zadnjastrana - (2 + ($adjacents * 2)); $counter <= $zadnjastrana; $counter++)
            {
                if ($counter == $strana)
                    $paginacija.= "<li><a class=\"active\">$counter</a></li>";
                else
                    $paginacija.= "<li><a href=\"$targetstrana?strana=$counter\">$counter</a></li>";
            }
        }
    }

        //next button
    if ($strana < $counter - 1)
        $paginacija.= "<li><a href=\"$targetstrana?strana=$next\">?/a></li>";
    else
        $paginacija.= "<li class=\"disabled\"><a>?/a></li>";
    $paginacija.= "</ul></div>\n";

}

include("./assets/header.php");

?>

<div id="sep" style="margin-bottom: 5px;"></div> <!-- #sep end -->


<div id="serverinfo">
    <div id="infox">
        <i class="icon-th"></i>
        <p id="h5"><?php echo $jezik['text578sa']; ?></p><br />
        <p><?php echo $jezik['text579sa']; ?></p><br />
        <p style="margin-top: -3px;"><?php echo $jezik['text580sa']; ?></p>
    </div>
    <table id="webftp">
        <tr>
            <th><?php echo "Flag"; ?></th>
            <th><?php echo "Zemlja"; ?></th>
            <th><?php echo "Sadraj poruke"; ?></th>
            <th><?php echo "Broj"; ?></th>
            <th><?php echo "Cijena poruke"; ?></th>
            <th><?php echo "Stanje koje ide na raèun"; ?></th>
            <th><?php echo "Local Disclaimer"; ?></th>
            <th><?php echo "Dostupno"; ?></th>
        </tr>

<?php
        if(mysql_num_rows($result) == 0) echo'<tr><td colspan="8">'.$jezik['text585'].'</td></tr>';
        while($row = mysql_fetch_array($result)){
?>
        <tr>
            <td><img src="assets/img/<?php echo $row['currency']; ?>.png"/></td>
            <td><?php echo $row['zemlja']; ?></td>
            <td><?php echo $row['poruka']; ?>  <?php echo $_SESSION['klijentusername']; ?></td>
            <td><?php echo $row['broj']; ?></td>
            <td><?php echo $row['cijena']; ?> <?php echo $row['currency']; ?> <?php echo $row['dodatno']; ?></td>
            <td><?php $fee = 0.00 * $row['cijena'];
      $row['cijena'] = round($row['cijena'] - $fee,2); echo $row['cijena']; ?> <?php echo $row['currency']; ?> (-0% provizije uraèunato)</td>
	        <td><?php echo $row['disclaimer']; ?></td>
            <td><?php if($row['status'] == "Da") {?><span style="color: #4ED000;"><?php echo $row['status']; }?></span><?php if($row['status'] == "Ne") {?><span style="color: red;"><?php echo $row['status']; }?></span></td>
        </tr>
<?php	} ?>
    </table>
    <?php echo $paginacija; ?>
</div>

<?php
include("./assets/footer.php");
?>