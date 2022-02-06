<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $error = "";
    $params = array(
        "email" => @$_POST["email_subscriber"]
    );

    $jsontext = callAPI("content_saveSubscribeForm.api", array(), $params);
    //var_dump($jsontext);
    $apiData = json_decode($jsontext, true);
    $error = trim(@$apiData["error"]);
    header('Location: ' . $_SERVER['HTTP_REFERER'] . "?mes=success");
}