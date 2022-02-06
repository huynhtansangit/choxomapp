<?php
$email = @$_SESSION['loginmemberemail'];
$ordercode = @$_POST['ordercode'];

$crypto = new Crypto();
$rootdata = $ordercode . ".." . $email;
$token = $crypto->encrypt_tripledes($rootdata);
$params= array(
    "ordertoken" => $token
);
$jsontext = callAPI("gbshop", 'order_getOrderDetailByToken.api', $params, array());
echo $jsontext;
?>