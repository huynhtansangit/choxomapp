<?php

$params = array(
    "username" => @$_POST["username"],
    "password" => @$_POST["password"]
);

$jsontext = callAPI("gbuser", "common_login.api",array(),$params);
$loginData = json_decode($jsontext, true);

if(empty($loginData["error"])){
    $dataSession = @$loginData["sessiondata"];
    foreach($dataSession as $key => $value)
    {
        $_SESSION[$key] = $value;
    }
}

echo $jsontext;
?>