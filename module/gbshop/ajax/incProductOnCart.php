<?php
exit;
$jsontext = callAPI("gbshop", "cart_addMoreProductToShoppingCart.api", array(), @$_POST);
$codeAndIdCart = json_decode($jsontext, true)["data"];
$_SESSION['cartcode'] = $codeAndIdCart["cartcode"];
$_SESSION['cartid'] = $codeAndIdCart["cartid"];
