<?php

// Expecting a md5 hash and a version
if (empty($_POST["M"]) || empty($_POST["V"]) ) {
	include("chart.html");
	die();
}

$fp = fopen('debug.log', 'a');
fwrite($fp, $_SERVER["REMOTE_ADDR"] . ": " . $_POST["V"] . " hmac ". $_POST["M"] . " dev " . $_POST["D"] .  "\n");
fclose($fp);

date_default_timezone_set('Europe/London');
$dir = getcwd();
if (is_writable($dir)) {
	$dir = $dir . '/' . date("Y-m");
} else {
	die("No write permission.\n Fix with: chown -R www-data $dir");
}
@mkdir($dir, 0777);

$handle = fopen($dir . '/' . $_POST["M"], "a");
fwrite($handle, $_POST["V"] . "\n");
fclose($handle);
?>
