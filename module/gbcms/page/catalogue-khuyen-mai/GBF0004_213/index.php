<?php
$framefolder = "GBF0004_213";
$http_image = "https://adminapi.gbotweb.com/gbframe/frame/".$framefolder."/html/";
$httpFrame =
require_once($_SERVER["DOCUMENT_ROOT"].'/gbframe/clientlib/style.php');
?>

<link rel="stylesheet" href="https://adminapi.gbotweb.com/gbframe/frame/<?php echo $framefolder?>/html/<?php echo $framefolder?>.css">

<?php
include($_SERVER["DOCUMENT_ROOT"].'/gbframe/frame/'.$framefolder.'/html/template.tpl');
?>
<script src="https://adminapi.gbotweb.com/gbframe/frame/<?php echo $framefolder?>/html/<?php echo $framefolder?>.js"></script>
