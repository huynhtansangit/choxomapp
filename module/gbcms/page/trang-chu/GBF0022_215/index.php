<?php
require_once($_SERVER["DOCUMENT_ROOT"].'/gbframe/config.php');
$framefolder = "GBF0022";
$httpFrame = HTTP_SERVER."gbframe/frame/".$framefolder."/html/";
require_once($_SERVER["DOCUMENT_ROOT"].'/gbframe/clientlib/style.php');

include($_SERVER["DOCUMENT_ROOT"].'/gbframe/frame/'.$framefolder.'/html/template.tpl');
?>

