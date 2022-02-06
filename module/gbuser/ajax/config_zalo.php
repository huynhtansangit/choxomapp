<?php
require_once("./system/plugin/vendor/autoload.php");

use Zalo\Zalo;


$config = array(
    'app_id' => '4250142566645816093',
    'app_secret' => 'HI43WvrN0i2GJX1RI1xX',
    'callback_url' => HTTP_SERVER . 'gbuser/ajax/callback_zalo.gbe'
);
$zalo = new Zalo($config);

$helper = $zalo->getRedirectLoginHelper();
$callbackUrl = HTTP_SERVER . "gbuser/ajax/callback_zalo.gbe";
$loginZaloURL = $helper->getLoginUrl($callBackUrl) . "&redirect_uri=" . $callbackUrl; // This is login url

?>