<?php
$gbeLayout = "layout.tpl";
$gbeTemplate = "activeaccount.tpl";
$gbeTitle = "Confirm account";
addGlobalCSS("./module/gbuser/theme/css/activeaccount.min.css");

$params = array(
    "verificationcode" => $_GET["verificationcode"],
    "membercode" => $_GET["membercode"]
);

$jsontext = callAPI("gbuser", "member_activeAccount.api", $params, array());
$activeAccountData = json_decode($jsontext, true);
?>