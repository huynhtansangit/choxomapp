<?php

$jsontext = callAPI("gbuser", "account_changePassword.api", array(), @$_POST);
echo $jsontext;

?>