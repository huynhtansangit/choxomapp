<?php
//gọi api $jsontext
$params = array(
    "membercode" => $_SESSION['loginmemberid'],
    "cartcode" => $_POST['cartcode']
);
$jsonText = callAPI("gbshop", 'cart_addShoppingCart.api', array(), $params);
$cloneCart = json_decode($jsonText, true);
$cartid = $cloneCart['data']['id'];
$cartcode = $cloneCart['data']['cartcode'];
$_SESSION['cartid'] = $cartid;
$_SESSION['cartcode'] = $cartcode;

$response = array(
    "error" => "",
    "cartid" => $cartid,
    "cartcode" => $cartcode
);

echo json_encode($response);

?>