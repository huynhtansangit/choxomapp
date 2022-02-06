<?php
//38be5418a8e2601443030c8cba989324
define('TOKE', '20485');
define('CROS_DOMAIN', true);
define('FILE_VERSION', '1.0');

if (empty($_GET['token'])) {
    http_response_code(404);
    exit;
}

if (md5(TOKE) != $_GET['token']) {
    header("Location: error.html");
    exit;
} else {
    $folder = !empty($_GET['folder']) ? $_GET['folder'] : '';
    define("DIR_FOLDER_FILE", "../file/");
    define("DIR_FILE", "../file/?folder=". $folder);
}