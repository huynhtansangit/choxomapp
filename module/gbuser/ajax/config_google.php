<?php
require_once("./system/plugin/vendor/autoload.php");

$google_client = new Google_Client();
$google_client->setClientId("56944723688-lt3459plmsfmcugl8ldf0hlft2f8tvpt.apps.googleusercontent.com");
$google_client->setClientSecret("QD0lYhFLwu79rq0Q0NcY6ro_");
$google_client->setRedirectUri(HTTP_SERVER . "gbuser/ajax/callback_google.gbe");
$google_client->addScope("email");
$google_client->addScope("profile");

$loginGoogleURL = $google_client->createAuthUrl();
?>