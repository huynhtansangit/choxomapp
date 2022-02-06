<?php
$params = array(
    "filename" => $_GET['filename']
);

echo (HTTP_APISERVER.'module/gbshop/shipping/data/'.$_GET['filename']);
?>