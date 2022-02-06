<?php
require './system/plugin/PHPExcel/startup.php';
$id = $_GET['id'];
if (!file_exists('data/mail/'.$id)) {
    mkdir('data/mail/'.$id, 0777);
    mkdir('data/mail/'.$id.'/outbox', 0777);
    mkdir('data/mail/'.$id.'/sentbox', 0777);
} else {
    //xóa cache
    if (file_exists('data/mail/'.$id.'/sentbox')) {
        array_map('unlink', glob("data/mail/".$id."/sentbox/*.*"));
    }
    if (file_exists('data/mail/'.$id.'/outbox')) {
        array_map('unlink', glob("data/mail/".$id."/outbox/*.*"));
    }
}

$jsontext = callAPI("gbshop", "promotion_getPromotionEmailDetail.api", $_GET, $_POST);
$gbeAPIData = json_decode($jsontext, true);
$contentAPIData = $gbeAPIData['data']['content'];
$attachmentAPIData = $gbeAPIData['data']['customerfile'];
$subjectAPIData = $gbeAPIData['data']['subject'];

if($attachmentAPIData!= ""){
    // Đọc excel
//    $URLCustomerExportData = HTTP_SERVER . "/data/fileupload/".$attachmentAPIData;
    $CustomerExportData = readExcelToArray("data/fileupload/".$attachmentAPIData);
    $gender = array(
        "male" => "Anh",
        "female" => "Chị",
        "" => ""
    );

    foreach($CustomerExportData as $customer) {
        if (!empty($customer['Email'])) {
            $str = ['{customername}', '{Today Date}', '{Title (Anh/Chị)}', '{Birthdate}'];
            $rplc = [$customer["Name"], date('d/m/Y'), $gender[$customer["Gender"]], $customer["Birthday"]];
            $contentforEmail = str_replace($str, $rplc, $contentAPIData);

            $data = array(
                "content" => $contentforEmail,
                "webconfig" => $webconfig,
            );
            $template = 'promotionemail';
            $body = getbodyEmail($data, $template);

            $params = array(
                "from" => array(
                    "username" => "hoaianhpkvvkp@gmail.com",
                    "password" => "hoaianh123"
                ),
                "to" => $customer["Email"],
                "subject" => $subjectAPIData,
                "body" => $body
            );
            file_put_contents("data/mail/".$id."/outbox/".$id."-".uniqid().".cache",json_encode($params));
        }
    }
}
?>
