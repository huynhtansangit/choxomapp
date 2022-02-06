<?php
    $params = array(
        "filename" => $_GET['filename']
    );

    echo (HTTP_APISERVER.'module/gbshop/shipping/source/'.$_GET['filename']);
?>