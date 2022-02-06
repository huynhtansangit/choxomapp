<?php
$params= array(
    "ordercode" => @$_POST["ordercode"]
);
$jsontext =  callAPI("gbshop", 'order_getOrderDetail.api', $params, array());
echo $jsontext;
?>