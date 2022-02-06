<?php

$jsontext = callAPI("account_changePassword.api", array(), @$_POST);
echo $jsontext;

?>