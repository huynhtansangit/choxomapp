<?php
require_once("config.php");

$path = isset($_GET['path']) ? $_GET['path'] : "";
$width = isset($_GET['width']) ? $_GET['width'] : "0";
$height = isset($_GET['height']) ? $_GET['height'] : "0";
$resizetype = isset($_GET['type']) ? $_GET['type'] : "root";
$mask = isset($_GET['mask']) ? $_GET['mask'] : "0";
define("MASK_LOGO", $mask); //true, false

//Dùng cho hỗ trợ đường link webp
$required_webp = WEBP_SUPPORT && strpos($path, ".webp") !== false;
if ($required_webp) {
    $path = str_replace(".webp", "", $path);
}

//Kiểm tra file gốc có tồn tại không?
$is_exist_upload_file = false;
$timestamp = filemtime(DIR_FILE . $path);
if ($timestamp) {
    $is_exist_upload_file = true;
}

//Nếu dữ liệu đầu vào không hợp lệ hoặc nếu file gốc không tồn tại --> trả về hình mặc định
if ($path == "" || $resizetype == "" || !$is_exist_upload_file) {
    $path = 'default/default.png';
}

switch ($resizetype) {
    case "resize":
        $file = DIR_FILE . HelperEimagick::resize($path, $width, $height);
        break;
    case "resizepng":
    case "autosize":
        $file = DIR_FILE . HelperEimagick::resizePNG($path, $width, $height);
        break;
    case "fixsize":
        $file = DIR_FILE . HelperEimagick::fixsize($path, $width, $height);
        break;
    case "fixsizetop":
        $file = DIR_FILE . HelperEimagick::fixsizetop($path, $width, $height);
        break;
    case "root":
        $file = DIR_FILE . HelperEimagick::getroot($path);
        break;
    default:
        $file = DIR_FILE . HelperEimagick::resize($path, $width, $height);
        break;
}

if ($required_webp) {
    $file .= ".webp";
}

if (file_exists($file)) {
    $extension = '';
    $pos = strripos($file, ".");
    if ($pos !== FALSE) {
        $extension = substr($file, $pos + 1);
    }
    switch ($extension) {
        case "pdf":
            $ctype = "application/pdf";
            break;
        case "exe":
            $ctype = "application/octet-stream";
            break;
        case "zip":
            $ctype = "application/zip";
            break;
        case "doc":
            $ctype = "application/msword";
            break;
        case "xls":
            $ctype = "application/vnd.ms-excel";
            break;
        case "ppt":
            $ctype = "application/vnd.ms-powerpoint";
            break;
        case "gif":
            $ctype = "image/gif";
            break;
        case "png":
            $ctype = "image/png";
            break;
        case "webp":
            $ctype = "image/webp";
            break;
        case "jpeg":
        case "jpg":
            $ctype = "image/jpg";
            break;
        default:
            $ctype = "application/force-download";
    }
    header("Pragma: public"); // required
    header("Expires: 0");
    header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
    header("Cache-Control: private", false); // required for certain browsers
    header("Content-Type: $ctype");
    // change, added quotes to allow spaces in filenames, by Rajkumar Singh
    header("Content-Disposition: attachment; filename=\"" . basename($file) . "\";");
    header("Content-Transfer-Encoding: binary");
    header("Content-Length: " . filesize($file));

    ob_end_flush();
    readfile($file);

} else {
    echo $file;
}