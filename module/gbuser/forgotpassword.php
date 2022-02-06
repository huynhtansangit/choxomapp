<?php
if($_SESSION["loginmemberid"]) {
    header("Location:" .  HTTP_SERVER);
}

$gbeLayout = "layout.tpl";
$gbeTemplate = "forgotpassword.tpl";
$gbeTitle = "Quên mật khẩu";

//add library popup
addGlobalCSS("/module/gbshop/theme/plugins/popup/css/popup.min.css");
addGlobalJS("/module/gbshop/theme/plugins/popup/js/popup.min.js");

addGlobalJS("assets/plugins/jquery-3.4.1/jquery-3.4.1.min.js");
addGlobalJS("assets/plugins/validate/jquery.validate.min.js");
addGlobalCSS("/module/gbuser/theme/css/login.min.css");
addGlobalJS("/module/gbuser/theme/js/forgotpassword.js");
addGlobalCSS("./module/gbuser/theme/css/default.css");