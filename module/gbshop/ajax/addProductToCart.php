<?php

$_POST['cartcode'] = @$_SESSION['cartcode'];

$jsontext = callAPI("gbshop", "cart_addProductToShoppingCart.api", array(), @$_POST);

if(empty($_SESSION['cartcode'])){
    $codeAndIdCart = json_decode($jsontext, true);
    $_SESSION['cartcode'] = $codeAndIdCart['data']["cartcode"];
    $_SESSION['cartid'] = $codeAndIdCart['data']['id'];
    $_SESSION['cartstatus'] = $codeAndIdCart['data']['status'];
}
echo $jsontext;

