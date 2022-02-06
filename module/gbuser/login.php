<?php
if($_SESSION["loginmemberid"])
    header("Location:" .  HTTP_SERVER);

require './module/gbuser/ajax/config_fb.php';
require './module/gbuser/ajax/config_google.php';
require './module/gbuser/ajax/config_zalo.php';


$gbeLayout = "layout.tpl";
$gbeTemplate = "login.tpl";
$gbeTitle = "Log In / Register";
addGlobalCSS("./module/gbuser/theme/css/default.css");
addGlobalCSS("./module/gbuser/theme/css/login.min.css");

$userid = @$_GET['userid'];

//add library popup
addGlobalCSS("./module/gbshop/theme/plugins/popup/css/popup.min.css");
addGlobalJS("./module/gbshop/theme/plugins/popup/js/popup.min.js");

addGlobalJS("assets/plugins/jquery-3.4.1/jquery-3.4.1.min.js");
addGlobalJS("assets/plugins/validate/jquery.validate.js");
addGlobalJS("./module/gbuser/theme/js/default.js");
addGlobalJS("./module/gbuser/theme/js/login.js");

?>