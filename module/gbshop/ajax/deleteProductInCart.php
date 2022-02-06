<?php
$jsontext = callAPI("gbshop", "cart_deleteProductInCart.api", array(), @$_POST);
echo $jsontext;