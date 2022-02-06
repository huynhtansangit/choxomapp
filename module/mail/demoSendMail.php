<?php
$data = array(
    "customername" => "Quang Minh"
);
$template = 'orderconfirm';
$body = getbodyEmail($data, $template);

$params = array(
    "from" => array(
        "username" => "hoaianhpkvvkp@gmail.com",
        "password" => "hoaianh123"
    ),
    "to" => "thienmenh199@gmail.com",
    "subject" => "[GBSHOP] Test email system",
    "body" => $body
);

sendMail($params['from'], $params['to'], $params['subject'], $params['body']);

