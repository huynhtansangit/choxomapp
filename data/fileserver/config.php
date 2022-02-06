<?php
//cho phép tạo folder theo ý muốn (căn cứ vào đường link url)
//ví dụ: http://localhost/masterfile/filemng/upload/?folder=addon/adbanner/W5bcd55e27baa0&token=38be5418a8e2601443030c8cba989324
//hệ thống sẽ tự động tạo thư mục addon/adbanner/W5bcd55e27baa trong upload
define('ALLOW_CREATE_NEW_FOLDER', true);

//xóa file gốc tìm những file liên quan trong cache xóa luôn
define('ALLOW_ALSO_REMOVE_CACHE', true);

define("DIR_SERVERROOT", '/');

define("OS_SYSTEM", 'window'); //window, linux
define("WEBP_SUPPORT", true); //true, false
define("HTTP_VERSION", 1); //1: http 1.1, 2: http 2

define("OPTIMIZE_IMAGE", false); //true, false
define('COMPRESSION', !OPTIMIZE_IMAGE); //compression of imagick

define("DIR_FILE", $_SERVER['DOCUMENT_ROOT'] . DIR_SERVERROOT . "data/fileserver/" . "file/");
define("DIR_SYSTEM", $_SERVER['DOCUMENT_ROOT'] . DIR_SERVERROOT . "data/fileserver/system/");
define("DIR_PLUGIN", $_SERVER['DOCUMENT_ROOT'] . DIR_SERVERROOT . "data/fileserver/system/plugin/");
define("DIR_WEBFILE", "");

define("WATERMASK_FILEPATH", DIR_FILE . "default/watermask.png");
define("WATERLOGO_POSITION", "BottomLeft"); //TopLeft, TopRight, BottomLeft, BottomRight

require_once("system/helper/eimagick.php");
require_once("system/library/eimagick.php");
require_once("system/library/common.php");