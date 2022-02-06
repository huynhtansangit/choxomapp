<?php
    set_time_limit(300); //seconds
    $numberEmailToSend = 10;
    $countEmailToSend = $numberEmailToSend;
    $jsontext = callAPI("gbshop", 'promotion_getIDAllPromotionEmail.api', $params, array());
    $IDPromotionEmail = json_decode($jsontext,true);

    foreach ($IDPromotionEmail as $promotionemail){
        if (file_exists('data/mail/'.$promotionemail['id'])) {
            $files = scandir('data/mail/'.$promotionemail['id'].'/outbox/');
            foreach($files as $file) {
                if ($file != "." && $file != "..") {
                    $fromFilePath = 'data/mail/'.$promotionemail['id'].'/outbox/'.$file;
                    $toFilePath   = 'data/mail/'.$promotionemail['id'].'/sentbox/'.$file;

                    $params = json_decode(file_get_contents($fromFilePath), true);
                    sendMail($params['from'], $params['to'], $params['subject'], $params['body']);
                    copy($fromFilePath,$toFilePath);
                    unlink($fromFilePath);

                    $countEmailToSend -= 1;
                    if ($countEmailToSend == 0){
//                        echo 'Đã gửi xong '.$numberEmailToSend.' thư cho khách hàng.';
                        exit();
                    }
                }
            }
        }
    }

?>