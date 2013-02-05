<?php

// Expecting a md5 hash and a version
if (empty($_POST["M"]) || empty($_POST["V"]) ) {
	include("chart.html");
	die();
}

date_default_timezone_set('Europe/London');

$m = gethostbyaddr($_SERVER['REMOTE_ADDR']) . " " . $_POST["D"] . " " . $_SERVER["GEOIP_COUNTRY_CODE"] . " " . $_POST["V"];

$fp = fopen('debug.log', 'a');
fwrite($fp, date("c") . " " . $m . " " . $_POST["M"] . "\n");
fclose($fp);

$dir = ".";
$dir = $dir . '/' . date("Y-m");
$dir = $dir . '/' . date("z");
echo ($dir);
@mkdir($dir, 0777, true);

$handle = fopen($dir . '/' . $_POST["M"], "a");
fwrite($handle, date("U") . " " . $m  . "\n");
fclose($handle);

?>
