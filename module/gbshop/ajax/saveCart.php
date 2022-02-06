<?php
$params = array(
    'membercode' => @$_SESSION['loginmemberid'],
    'cartcode' => @$_SESSION['cartcode'],
    'isshare' => 0,
    'issave' => 1
);

$jsontext = callAPI("gbshop", "cart_saveShoppingCart.api", array(), $params);
echo $jsontext;