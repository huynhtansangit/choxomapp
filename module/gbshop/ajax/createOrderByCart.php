<?php
$_POST['cartid'] = @$_SESSION['cartid'];
//$_POST['cartid'] = 181;
$jsontext = callAPI("gbshop", "order_createOrderBasedOnCart.api", array(), @$_POST);
$apiData = json_decode($jsontext, true);
$orderData = $apiData['data'];

//-----------------------------------------------------------------------------------------------


//------------------------ CHUẨN BỊ DỮ LIỆU CHO MAIL --------------------------------------------
//--------------- Tạo link orderurl ----------------------------------------------------
$email = $orderData['memberemail'];
$ordercode = $orderData['ordercode'];
$crypto = new Crypto();
$rootdata = $ordercode . ".." . $email;
$token = $crypto->encrypt_tripledes($rootdata);
$orderurl = HTTP_SERVER . 'gbuser/account/orderdetailbytoken.gbe?ordertoken=' . $token;
$apiData['data']['token'] = $token; // gán lại token để trả về cart_payment.js khi chuyển trang, không liên quan đến MAIL
//--------------------------------------------------------------------------------------
$data = array(
    "ordercode" => $orderData['ordercode'],
    "orderurl" => $orderurl,
    "totallines" => $orderData['totallines'],
    "discountamount" => $orderData['discountamount'],
    "shipcost" => $orderData['shipcost'],
    "totalorder" => $orderData['totalorder'],
    "ordercreateddate" => $orderData['ordercreateddate'],
    "membername" => $orderData['membername'],
    "memberemail" => $orderData['memberemail'],
    "memberphone" => $orderData['memberphone'],
    "status" => 'Đã tiếp nhận',
    "productlist" => $orderData['products'],
    "webconfig" => $webconfig // Truyền webconfig theo để load động tên cửa hàng, link website và những thông tin liên quan đến site
);
$subject = "[" . $webconfig['businessname'] . "] " . "Xác nhận đơn hàng #" . $data['ordercode'];
$body = getbodyEmail($data, 'orderconfirm');
//-----------------------------------------------------------------------------------------------

//------------------- PHẦN XỬ LÝ CỐ ĐỊNH ĐỂ GỌI GỬI MAIL-----------------------------------------
$params = array(
    "from" => array(
        "username" => $config_email['username'],
        "password" => $config_email['password']
    ),
    "to" => $data['memberemail'],
    "subject" => $subject,
    "body" => $body
);
sendMail($params['from'], $params['to'], $params['subject'], $params['body']);
//-----------------------------------------------------------------------------------------------

echo json_encode($apiData);