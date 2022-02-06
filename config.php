<?php
error_reporting(E_ALL & ~E_NOTICE);
session_set_cookie_params(0, '/');
session_start();
date_default_timezone_set("Asia/Ho_Chi_Minh");


//*********** Multi-language conf ********************
if(!isset($_GET['lang'])){
    header("Location: https://choxom.gbotweb.com/vi-vn/");
}

define('HTTP_ROOTSERVER', 'https://choxom.gbotweb.com/');
if ($_GET['lang'] == "vi") {
    define('HTTP_SERVER', HTTP_ROOTSERVER . "vi-vn/");
    define('TOKEN', 'choxom123456');
} else {
    define('HTTP_SERVER', HTTP_ROOTSERVER . $_GET['lang'] . '-' . $_GET['country'] . '/');
    define('TOKEN', 'choxom123456' . "-" . $_GET['lang']);
}
define('HTTP_APISERVER', "http://choxomapi.gbotweb.com/");
define('IMAGE_SERVER', "https://choxom.gbotweb.com/data/fileserver/images/");

define('IMAGE_VERSION', '1.0');
define('FILE_VERSION', '1.0');
//**********************************************



include("system/corefunction.php");
include("system/plugin/mobile_detect.php");
include("system/plugin/crypto/crypto.php");
include("system/format.php");

define("DIR_MODULE","module/");

//CÁC BIẾN DÙNG CHUNG
$gbeSEOURL = "";
$gbeModule = "";
$gbeFunction = "";
$gbeLayout = "";
$gbeLayoutPath = "";
$gbeTemplate = "";
$gbeTemplatePath = "";
$gbeCSSList = array();
$gbeJSList = array();
$config_email = array(
    "username" => "hoaianhpkvvkp@gmail.com",
    "password" => "hoaianh123"
);
//get config info
$jsontext = callAPI("gbcms", "content_getConfigList.api");
$webconfig = json_decode($jsontext, true)['data'];
?>