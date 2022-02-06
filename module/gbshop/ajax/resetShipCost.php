<?php
$crypto = new Crypto();
$carttoken = $crypto->encrypt_tripledes($_SESSION['cartid'] . '..' . $_SESSION['cartcode']);
$params = array(
    "carttoken" => $carttoken
);
$jsontext = callAPI("gbshop", "cart_resetShipcost.api", $params);
var_dump($jsontext);