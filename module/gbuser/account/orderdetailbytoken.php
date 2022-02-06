<?php
$gbeLayout = "layout.tpl";
$gbeTemplate = "orderdetailbytoken.tpl";
$gbeTittle = "Order detail";
//add library popup
addGlobalCSS("./module/gbuser/theme/css/orderdetail.min.css");
// token = G5PVY+tI8UpT6q6auaQe3c6tLYW8TNgxVqYd6p4vqZg=
//$crypto = new Crypto();
//$rootdata = "HD00247" . ".." . "nghidk3499@gmail.com";
//$token = $crypto->encrypt_tripledes($rootdata);
//var_dump($token);
//$decodeToken = $crypto->decrypt_tripledes($token);

if(strpos($_SERVER["QUERY_STRING"], "+") !== false){
    $_SERVER["QUERY_STRING"] = str_replace("+", "%2B", $_SERVER["QUERY_STRING"]);
    parse_str($_SERVER["QUERY_STRING"], $_GET);
}

$ordertoken = $_GET['ordertoken'];
$params = array(
    "ordertoken" => $ordertoken
);

$jsonText =  callAPI("gbshop", 'order_getOrderDetailByToken.api', $params, array());
$orderDetailData = json_decode($jsonText, true);
