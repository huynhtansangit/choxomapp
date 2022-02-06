<?php
$params = array(
    "cartcode" => empty($_SESSION['cartcode']) ? "" : $_SESSION['cartcode'],
    "productsku" => $_POST["productsku"],
    "quantity" => $_POST["quantity"],
);

$jsontext = callAPI("gbshop", "cart_addMoreProductToShoppingCart.api", array(), $params);

if (empty($_SESSION['cartcode'])) {
    $codeAndIdCart = json_decode($jsontext, true);
    $_SESSION['cartcode'] = $codeAndIdCart['data']["cartcode"];
    $_SESSION['cartid'] = $codeAndIdCart['data']["id"];
    $_SESSION['cartstatus'] = $codeAndIdCart['data']['status'];
}
echo $jsontext;