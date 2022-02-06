<?php

$districtcode = @$_GET['districtcode'];
$provincecode = @$_GET['provincecode'];
$wardcode = @$_GET['wardcode'];

$params = array(
    "provincecode" => $provincecode,
    "districtcode" => $districtcode,
    "wardcode" => $wardcode,
);

$jsontext = callAPI("gbshop", 'shipping_getShippingMethodFee.api', $params, array());

echo $jsontext;


