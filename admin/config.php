<?php
error_reporting(E_ALL & ~E_NOTICE);
session_set_cookie_params(0, '/');
session_start();
date_default_timezone_set("Asia/Ho_Chi_Minh");

// CONFIG DOMAIN
define('HTTP_SERVER', "https://choxom.gbotweb.com/admin/");
define('IMAGE_SERVER', "https://choxom.gbotweb.com/data/fileserver/images/");

define('IMAGE_VERSION', '1.1');
define('FILE_VERSION', '1.0');

//API CONFIGS
define('HTTP_APISERVER', "http://choxomapi.gbotweb.com");
define('TOKEN', "choxom123456");


?>