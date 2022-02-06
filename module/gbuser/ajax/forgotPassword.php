<?php
$params = array(
    "memberemail" => @$_POST["memberemail"]
);

$jsontext = callAPI("gbuser", "account_forgotPassword.api", array(), $params);
$apiData = json_decode($jsontext, true);
$error = $apiDatap['error'];
if (empty($error)) {
    $data = $apiData['data'];
    $emaildata = array(
        "webconfig" => $webconfig,
        "newpassword" => $data['newpassword'],
    );
    $subject = "[" . $webconfig['businessname'] . "] " . "Mật khẩu mới";
    $body = getbodyEmail($emaildata, 'forgotpassword');

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