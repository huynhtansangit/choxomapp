<?php
$jsontext = callAPI("gbshop", "cart_checkProductAvailabilityInCart.api", array(), $_POST);
echo $jsontext;