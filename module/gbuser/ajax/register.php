<?php

$params = array(
    "membername" => $_POST["membername"],
    "memberphone" => $_POST["memberphone"],
    "memberemail" => $_POST["memberemail"],
    "password" => $_POST["password"],
    "address" => $_POST["address"],
);

$jsontext = callAPI("gbuser", "common_register.api", array(), $params);
$apiData = json_decode($jsontext, true);
$error = $apiData['error'];
if (empty($error)) {
    $data = $apiData["data"];
    $emaildata = array(
        "webconfig" => $webconfig,
        "membername" => $data['membername'],
        "membercode" => $data['membercode'],
        "verificationcode" => $data['verificationcode']
    );
    $subject = "[" . $webconfig['businessname'] . "] " . "Xác nhận đăng ký tài khoản";
    $body = getbodyEmail($emaildata, 'activationconfirm');

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
}



echo $jsontext;
?>