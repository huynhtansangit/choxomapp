<?php
$params = array(
    'membercode' => @$_SESSION['loginmemberid'],
    'cartcode' => @$_SESSION['cartcode'],
    'isshare' => 1,
    'issave' => 0
);

$jsontext = callAPI("gbshop", "cart_shareShoppingCart.api", array(), $params);
$apiData = json_decode($jsontext, true);
$shoppingcartData = $apiData['data'];

$crypto_encode = $shoppingcartData['token'];
$crypto_encode = str_replace("/", "%2F", $crypto_encode);
$shoppingcartData['shareurl'] = HTTP_SERVER . 'gbshop/shoppingcart/cart.gbe?shareid=' . $crypto_encode;

echo json_encode($shoppingcartData);


