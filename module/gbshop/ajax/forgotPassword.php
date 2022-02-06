<?php
$params = array(
    "memberemail" => @$_POST["memberemail"]
);

$jsontext = callAPI("account_forgotPassword.api",array(),$params);
echo $jsontext;