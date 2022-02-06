<?php
if(empty($_SESSION["loginmemberid"]))
    header("Location:" .  HTTP_SERVER);
$gbeLayout = "layout.tpl";
$gbeTemplate = "profile.tpl";
$gbeTittle = "Profile";
//add library popup
//addGlobalCSS("/module/gbshop/theme/plugins/popup/css/popup.min.css");
//addGlobalJS("/module/gbshop/theme/plugins/popup/js/popup.min.js");

addGlobalCSS("./module/gbuser/theme/css/account.min.css");
addGlobalCSS("./module/gbuser/theme/css/account_sidebar.min.css");

$jsonText =  callAPI('gbuser', 'account_getAccount.api');
$apiData = json_decode($jsonText, true);
$account = $apiData['data'];

