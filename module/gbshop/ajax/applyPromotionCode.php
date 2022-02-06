<?php
$_POST['cartcode'] = '';
$_POST['id'] = '';

if($_POST['applyto'] != 'product') {
    $_POST['cartcode'] = @$_SESSION['cartcode'];
} else {
    if(!empty(@$_POST['productids'])) {
        $_POST['id'] = implode(",", @$_POST['productids']);
    }
}

unset($_POST['productids']);
unset($_POST['applyto']);

if(($_POST['id'] != '') || ($_POST['cartcode'] != '')) {
    $jsontext = callAPI("gbshop", "cart_applyPromotion.api", array(), @$_POST);
} else {
    $response = array(
        'status' => 'failed',
        'error' => 'Vui lòng chọn sản phẩm áp dụng mã khuyến mãi',
        'error_field' => 'id'
    );

    $jsontext = json_encode($response, JSON_UNESCAPED_UNICODE);
}

echo $jsontext;