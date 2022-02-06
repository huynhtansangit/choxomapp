<?php

$provincecode = @$_GET['provincecode'];
$params = array(
    "provincecode" => $provincecode
);

$jsontext = callAPI("gbshop", 'shipping_getDistrictList.api', $params, array());

echo $jsontext;


