<?php
if(empty($_SESSION["loginmemberid"]))
    header("Location:" .  HTTP_SERVER);
$gbeLayout = "layout.tpl";
$gbeTemplate = "carts.tpl";
$gbeTittle = "Carts";
//add library popup
//addGlobalCSS("/module/gbshop/theme/plugins/popup/css/popup.min.css");
//addGlobalJS("/module/gbshop/theme/plugins/popup/js/popup.min.js");

addGlobalCSS("./module/gbuser/theme/css/account.min.css");
addGlobalCSS("./module/gbuser/theme/css/account_sidebar.min.css");

$jsonText =  callAPI('gbshop', 'cart_getCartListByAccount.api');
$cartData = json_decode($jsonText, true);
$cartList = $cartData['data'];
?>



