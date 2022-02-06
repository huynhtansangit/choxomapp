<?php
if(empty($_SESSION["loginmemberid"]))
    header("Location:" .  HTTP_SERVER);
$gbeLayout = "layout.tpl";
$gbeTemplate = "orderdetail.tpl";
$gbeTittle = "Order detail";
//add library popup
//addGlobalCSS("assets/plugins/popup/css/popup.min.css");
//addGlobalJS("assets/plugins/popup/js/popup.min.js");

addGlobalCSS("/module/gbuser/theme/css/orderdetail.min.css");

$params = array(
    "ordercode" => @$_GET["ordercode"]
);
$jsonText =  callAPI('gbshop', 'order_getOrderDetail.api', $params, array());
$orderDetailData = json_decode($jsonText, true);

