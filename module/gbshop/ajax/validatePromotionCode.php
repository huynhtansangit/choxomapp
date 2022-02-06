<?php
$_POST['cartcode'] = @$_SESSION['cartcode'];
$jsontext = callAPI("gbshop", "cart_validatePromotionCode.api", array(), @$_POST);
echo $jsontext;