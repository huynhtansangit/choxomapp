<?php
$gbeLayout = "layout.tpl";
$gbeTemplate = "thankyou.tpl";

unset($_SESSION['cartcode']);
unset($_SESSION['cartid']);
//add library popup
addGlobalCSS("/module/gbshop/theme/plugins/popup/css/popup.min.css");
addGlobalJS("/module/gbshop/theme/plugins/popup/js/popup.min.js");

addGlobalCSS("/module/gbshop/theme/css/thankyou.min.css");

if(strpos($_SERVER["QUERY_STRING"], "+") !== false){
    $_SERVER["QUERY_STRING"] = str_replace("+", "%2B", $_SERVER["QUERY_STRING"]);
    parse_str($_SERVER["QUERY_STRING"], $_GET);
}

$crypto = new Crypto();
$ordertoken = $_GET['ordertoken'];
$encode = $crypto->decrypt_tripledes($ordertoken);

$params = array(
    "ordertoken" => $ordertoken
);

$jsontext = callAPI("gbshop", "order_getOrderDetailByToken.api", $params, array());

$confirmData = json_decode($jsontext, true);


$products = $confirmData['data']['products'];
$orderData = $confirmData['data'];

?>
