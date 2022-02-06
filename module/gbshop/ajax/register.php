<?php

$params = array(
    "membername" => $_POST["membername"],
    "memberphone" => $_POST["memberphone"],
    "memberemail" => $_POST["memberemail"],
    "password" => $_POST["password"],
    "address" => $_POST["address"],
);

$jsontext = callAPI("gbuser", "common_register.api", array(), $params);
echo $jsontext;
?>