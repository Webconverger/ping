<?php

// Expecting a md5 hash
if (empty($_POST["M"]) || !ctype_alnum($_POST["M"]) || (strlen($_POST["M"]) != 32)) {
	include("chart.html");
	die();
}

// Assuming version numbers won't be longer than four characters
if (empty($_POST["V"]) || (strlen($_POST["V"])) > 4) {
	include("chart.html");
	die();
}

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
