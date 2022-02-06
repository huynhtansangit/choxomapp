<?php
$gbeLayout = "layout.tpl";
$gbeTemplate = "cart.tpl";


require './module/gbuser/ajax/config_fb.php';
require './module/gbuser/ajax/config_google.php';
require './module/gbuser/ajax/config_zalo.php';

//add library popup
addGlobalCSS("/module/gbshop/theme/plugins/popup/css/popup.min.css");
addGlobalJS("/module/gbshop/theme/plugins/popup/js/popup.js");

addGlobalCSS("/module/gbshop/theme/css/default.css");
addGlobalCSS("/module/gbshop/theme/css/cart.min.css");

addGlobalJS("/module/gbshop/theme/js/default.js");
addGlobalJS("/module/gbshop/theme/js/cart.js");

addGlobalJS("/module/gbshop/theme/js/jquery.validate.js");
addGlobalJS("/module/gbshop/theme/js/login.js");

/*update lại status của cart khi ở bước shipment*/
$params = array(
    "cartcode" => $_SESSION["cartcode"],
    "cartstatus" => "cart"
);
callAPI("gbshop", "cart_updateCartAndProductStatus.api", $params, array());

// GET dữ liệu 1 giỏ hàng bình thường
if (!empty($_SESSION["cartcode"])) {
    $crypto = new Crypto();
    $carttoken = $crypto->encrypt_tripledes($_SESSION['cartid'] . '..' . $_SESSION['cartcode']);
    
    $params = array(
        "carttoken" => $carttoken
    );
    $jsontext = callAPI("gbshop", "cart_getShoppingCartDetailsByToken.api", $params, array());
    $cartData = json_decode($jsontext, true);
    $_SESSION['cartstatus'] = $cartData['data']['status'];
}

//SHARE CART
$shareid = @$_GET['shareid'];
if (!empty($shareid)) {
    $params = array(
        'carttoken' => $shareid
    );
    $cartsharedetail_jsontext = callAPI("gbshop", "cart_getShoppingCartDetailsByToken.api", $params, array());

    $cartsharedetail = json_decode($cartsharedetail_jsontext, true);
    $cartshare_products = $cartsharedetail['data']['products'];

    if ($cartsharedetail['data']['isshare']) {
        //clear session
        unset($_SESSION['cartcode']);
        unset($_SESSION['cartid']);

        //add shared product to new cart
        if (!empty($cartshare_products)) {
            foreach ($cartshare_products as $product) {
                $params = array(
                    'cartcode' => @$_SESSION['cartcode'],
                    'productsku' => $product['skucode'],
                    'quantity' => $product['quantity']
                );

                $cartdetail_jsontext = callAPI("gbshop", "cart_addProductToShoppingCart.api", array(), $params);
                $codeAndIdCart = json_decode($cartdetail_jsontext, true);
                if (empty($_SESSION['cartcode'])) {
                    $_SESSION['cartcode'] = $codeAndIdCart['data']["cartcode"];
                    $_SESSION['cartid'] = $codeAndIdCart['data']['id'];
                    $_SESSION['cartstatus'] = $codeAndIdCart['data']['status'];
                }
            }
        }

        //get new detail cart
        $params = array(
            "id" => $_SESSION["cartid"]
        );
        $jsontext = callAPI("gbshop", "cart_getShoppingCartDetails.api", $params, array());
        $cartData = json_decode($jsontext, true);

    } else {
        //error
        unset($_SESSION['cartcode']);
        unset($_SESSION['cartid']);
        $cartData = array();
    }
}

?>