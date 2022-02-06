<?php

$gbeLayout = "layout.tpl";
$gbeTemplate = "shipping.tpl";

addGlobalCSS("/module/gbshop/theme/css/shoppingcart_css.min.css");
addGlobalCSS("/module/gbshop/theme/css/shipping.min.css");
//add jquery
addGlobalJS("assets/plugins/jquery-3.4.1/jquery-3.4.1.min.js");

addGlobalJS("/module/gbshop/theme/js/jquery.validate.js");
//addGlobalJS("assets/plugins/swiper-5.4.5/js/swiper.min.js");
addGlobalJS("/module/gbshop/theme/js/shipping.js");

//add library popup
addGlobalCSS("/module/gbshop/theme/plugins/popup/css/popup.min.css");
addGlobalJS("/module/gbshop/theme/plugins/popup/js/popup.js");

// Lấy thông tin các tỉnh
$jsontext = callAPI("gbshop", "shipping_getProvinceList.api", array(), array());
$provincesBuyer = $provincesShipto = json_decode($jsontext, true);
$jsontext = callAPI("gbshop", "shipping_getDistrictList.api", array(), array());
$districtsBuyer = $districtsShipto = json_decode($jsontext, true);
$jsontext = callAPI("gbshop", "shipping_getWardList.api", array(), array());
$wardsBuyer = $wardsShipto = json_decode($jsontext, true);

//Lấy thông tin tài khoản đang đăng nhập
$jsonAccountInfo = callAPI("gbshop", "account_getAccount.api");
$accountInfo = json_decode($jsonAccountInfo , true)['data'];

/*update lại status của cart khi ở bước shipment*/
$params = array(
    "cartcode" => $_SESSION["cartcode"],
    "cartstatus" => "shipment"
);
callAPI("gbshop", "cart_updateCartAndProductStatus.api", $params, array());

//var_dump($accountInfo['city'] . ' - ' . $accountInfo['district'] . ' - ' . $accountInfo['ward'] );
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

/*Thông tin quận huyện của người đặt hàng*/
$choosenBuyerProvince = @$cartData['data']['membercity'];
$choosenBuyerDistrict = @$cartData['data']['memberdistrict'];
$choosenBuyerWard = @$cartData['data']['memberward'];

$choosenShiptoProvince = @$cartData['data']['shipcity'];
$choosenShiptoDistrict = @$cartData['data']['shipdistrict'];
$choosenShiptoWard = @$cartData['data']['shipward'];

if ( empty($choosenBuyerProvince) && empty($accountInfo['city']) ){
    $choosenBuyerProvince = 'P79';//TP Ho Chi Minh
} elseif (empty($choosenBuyerProvince)) {
    $choosenBuyerProvince = $accountInfo['city'];//@$gbeData[$datafield."city"];
}

if ( empty($choosenShiptoProvince) && empty($accountInfo['city']) ){
    $choosenShiptoProvince = 'P79';//TP Ho Chi Minh
} elseif (empty($choosenShiptoProvince)) {
    $choosenShiptoProvince = $accountInfo['city'];//@$gbeData[$datafield."city"];
}

if ( empty($choosenBuyerDistrict) && empty($accountInfo['district']) ){
    $choosenBuyerDistrict = 'D760';
} elseif (empty($choosenBuyerDistrict)) {
    $choosenBuyerDistrict = $accountInfo['district'];
}

if ( empty($choosenShiptoDistrict) && empty($accountInfo['district']) ){
    $choosenShiptoDistrict = 'D760';
} elseif (empty($choosenShiptoDistrict)) {
    $choosenShiptoDistrict = $accountInfo['district'];
}

if ( empty($choosenBuyerWard) && empty($accountInfo['ward']) ){
    $choosenBuyerWard = 'D760';
} elseif (empty($choosenBuyerWard)) {
    $choosenBuyerWard = $accountInfo['ward'];
}

if ( empty($choosenShiptoWard) && empty($accountInfo['ward']) ){
    $choosenShiptoWard = 'D760';
} elseif (empty($choosenShiptoWard)) {
    $choosenShiptoWard = $accountInfo['ward'];
}

//var_dump($choosenBuyerProvince . ' - ' . $choosenBuyerDistrict . ' - ' . $choosenBuyerWard);
//var_dump($choosenShiptoProvince . ' - ' . $choosenShiptoDistrict . ' - ' . $choosenShiptoWard);

// Lấy thông tin quận huyện
$params = array(
    "provincecode" => $choosenBuyerProvince
);

$jsontext = callAPI("gbshop", "shipping_getDistrictList.api", $params, array());
$districtsBuyer = json_decode($jsontext, true);

$params = array(
    "provincecode" => $choosenShiptoProvince
);

$jsontext = callAPI("gbshop", "shipping_getDistrictList.api", $params, array());
$districtsShipto = json_decode($jsontext, true);

//Lấy thông tin phường xã
$params = array(
    "provincecode" => $choosenBuyerProvince,
    "districtcode" => $choosenBuyerDistrict
);

$jsontext = callAPI("gbshop", "shipping_getWardList.api", $params, array());
$wardsBuyer = json_decode($jsontext, true);

$params = array(
    "provincecode" => $choosenShiptoProvince,
    "districtcode" => $choosenShiptoDistrict
);

$jsontext = callAPI("gbshop", "shipping_getWardList.api", $params, array());
$wardsShipto = json_decode($jsontext, true);

if($cartData['data']['membername'] == '') $cartData['data']['membername'] = $cartData['data']['shipname'] = @$accountInfo['membername'] ;
if($cartData['data']['memberemail'] == '') $cartData['data']['memberemail'] = $cartData['data']['shipemail'] = @$accountInfo['memberemail'];
if($cartData['data']['memberphone'] == '') $cartData['data']['memberphone'] = $cartData['data']['shipphone'] = @$accountInfo['memberphone'];
if($cartData['data']['memberaddress'] == '') $cartData['data']['memberaddress'] = $cartData['data']['shipaddress'] = @$accountInfo['address'];

//gán lại giá trị cho shippingmethod
$shipmentmethod_invalid = array("standard", "grabexpress", "ghtk");
if(!in_array($cartData['data']['shippingmethod'], $shipmentmethod_invalid)) {
    $cartData['data']['shippingmethod'] = "standard";
}

$date = getdate();

?>