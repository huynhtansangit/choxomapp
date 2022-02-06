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

//exit(DIR_FILE . $path."aaaa");
//Nếu dữ liệu đầu vào không hợp lệ hoặc nếu file gốc không tồn tại --> trả về hình mặc định
if ($path == "" || $resizetype == "" || !$is_exist_upload_file) {
    $path = 'default/default.png';
}

//Tính lại thời gian timestamp của file gốc
$timestamp = filemtime(DIR_FILE . $path);
$gmt_mtime = gmdate('r', $timestamp);

//Kiểm tra file gốc có sự thay đổi không? nếu không thì trả về 304
if (isset($_SERVER['HTTP_IF_MODIFIED_SINCE']) || isset($_SERVER['HTTP_IF_NONE_MATCH'])) {
    if ($_SERVER['HTTP_IF_MODIFIED_SINCE'] == $gmt_mtime || str_replace('"', '', stripslashes($_SERVER['HTTP_IF_NONE_MATCH'])) == md5($timestamp . $path)) {
        if (HTTP_VERSION == 1) {
            header('HTTP/1.1 304 Not Modified');
        }
        if (HTTP_VERSION == 2) {
            header('H2 304 Not Modified');
        }
        exit();
    }
}

//Resize File Images
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
    //optimize images
    if ($required_webp) {
        $mime = "image/webp";
    } else {
        $info = getimagesize($file);
        $imageinfor = array(
            "width" => $info[0],
            "height" => $info[1],
            "bits" => $info["bits"],
            "mime" => $info["mime"],
            'type' => $info[2]
        );
        $mime = $imageinfor['mime']; //image/jpeg, image/png
    }

    //header for file's image
    header('Content-Type: ' . $mime);
    header('Content-Length: ' . filesize($file));
    // if the browser has a cached version of this image, send 304
    $offset = 30 * 24 * 60 * 60;
    $expire = 'Expires: ' . gmdate('D, d M Y H:i:s', time() + $offset) . ' GMT';
    header($expire);
    header('ETag: "' . md5($timestamp . $path) . '"');
    header('Last-Modified: ' . $gmt_mtime);
    header('Cache-Control: public');

    flush();
    readfile($file);

} else {
    http_response_code(404);
    //echo $file;
}
