<?php

if (!session_id()){
    session_start();
}

require './system/plugin/Facebook/autoload.php';

$app_id      = '129121902361351';
$app_secret  = 'b19e38dae741596db8f644c11046141a';
$permissions = ['email'];
$callbackUrl = HTTP_SERVER . 'gbuser/ajax/callback_fb.gbe';

$fb = new Facebook\Facebook([
    'app_id' => $app_id,
    'app_secret' => $app_secret,
    'default_graph_version' => 'v9.0',
]);

$helper      = $fb->getRedirectLoginHelper();

if (isset($_GET['state'])) {
    $helper->getPersistentDataHandler()->set('state', $_GET['state']);
}

$permissions = ['email']; // Optional permissions
$loginUrl    = $helper->getLoginUrl($callbackUrl, $permissions);

?>