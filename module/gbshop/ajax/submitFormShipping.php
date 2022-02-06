<?php
// Set type = editcart để đánh dấu việc ấn nút "Sửa", nếu ấn nút sửa thì shipcost sẽ = 0 để tiền tính ở trang danh sách sản phẩm chạy đúng
$submittype = @$_GET['type'];
if ($submittype == 'editcart') {
    $_POST['shipcost'] = 0;
    $_POST['cartstatus'] =  "cart";
    $_POST['cartcode'] = @$_SESSION['cartcode'];
} else {
    $_POST['shipcost'] = intval(str_replace(".", "", $_POST['ordershipprice']));
    unset($_POST['ordershipprice']);
    $_POST['cartstatus'] =  "payment";
    $_POST['cartcode'] = @$_SESSION['cartcode'];
}


$jsontext = callAPI("gbshop", "cart_updateInformation.api", array(), @$_POST);

$_SESSION['cartstatus'] = $_POST['cartstatus'];
echo $jsontext;