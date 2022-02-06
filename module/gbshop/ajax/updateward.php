<?php

$provincecode = @$_GET['provincecode'];
$districtcode = @$_GET['districtcode'];

$params = array(
    "provincecode" => $provincecode,
    "districtcode" => $districtcode
);

$jsontext = callAPI("gbshop", 'shipping_getWardList.api', $params, array());

echo $jsontext;


