<?php
$gbeLayout = "layout.tpl";
$gbeTemplate = "cart_payment.tpl";

//chặn trường hợp user gõ thẳng link tới trang payment.
//duy nhất 1 trường hợp để cartstatus = payment là nhấn xác nhận từ bước shipping.
if(@$_SESSION['cartstatus'] != 'payment') {
    header("Location:" . HTTP_SERVER . "gbshop/shoppingcart/shipping.gbe");
}

//add library popup
addGlobalCSS("/module/gbshop/theme/plugins/popup/css/popup.min.css");
addGlobalJS("/module/gbshop/theme/plugins/popup/js/popup.min.js");
//add jquery
addGlobalJS("assets/plugins/jquery-3.4.1/jquery-3.4.1.min.js");
addGlobalJS("/module/gbshop/theme/js/default.js");
addGlobalCSS("/module/gbshop/theme/css/default.css");

addGlobalCSS("/module/gbshop/theme/css/shoppingcart_css.min.css");
addGlobalCSS("/module/gbshop/theme/css/cart_payment.min.css");

addGlobalJS("/module/gbshop/theme/js/cart_payment.js");

?>