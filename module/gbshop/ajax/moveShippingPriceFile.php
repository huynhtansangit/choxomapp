<?php
    //  Chuyển file từ Client -> Client API
    $uploadfile = $_GET['uploadfile'];
    $shipcode = $_GET['shipcode'];

    $headers = array("Content-Type:multipart/form-data");
    //Do đang làm trên bản Demo.../goodpharma NÊN sau DOCUMENT_ROOT có /goodpharma, khi nào deploy sẽ xóa
    $filepath = 'data/fileupload/'.$uploadfile;

    $postfields = array(
        "filecontent" => new CURLFile($filepath, 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'file'),
        "filename" => 'shipping_price_'.$shipcode.'.xlsx' //đặt tên mới cho file khi được lưu ở ClientAPI shipping/source
    );

    // Kh?i t?o CURL
    $ch = curl_init(HTTP_APISERVER.'gbshop/shipping_uploadShippingPriceFile.api'. "?token=" . TOKEN);

    // C?u hình có s? d?ng header
    // Vì chúng ta ?ang g?i file nên header c?a nó
    // ph?i ? d?ng Content-Type:multipart/form-data
    curl_setopt($ch, CURLOPT_HEADER, true);
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    curl_setopt($ch, CURLOPT_POST, 1);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $postfields);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    $response = curl_exec($ch);
    curl_close($ch);

    //xóa file đã upload
    if (!empty($uploadfile) && file_exists('data/fileupload/'.$uploadfile)) {
        array_map('unlink', glob("data/fileupload/".$uploadfile));
    }

    $params = array(
        'shipcode' => $shipcode
    );
    callAPI('gbshop',"shipping_importShippingPrice.api",$params);

?>