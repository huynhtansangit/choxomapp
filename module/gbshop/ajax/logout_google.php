<?php
include("config_google.php");

$accesstoken = $_SESSION['access_token'];
$google_client->revokeToken($accesstoken);

header(HTTP_SERVER);
?>