<?php
$_POST['cartcode'] = @$_SESSION['cartcode'];
$jsontext = callAPI("gbshop", "cart_updatePaymentMenthodInShippingCart.api", @$_POST, array());
echo $jsontext;