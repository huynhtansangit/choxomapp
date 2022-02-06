<?php
//a. hệ thống sẽ tìm những Cart ở trạng thái ‘payment’ và bị hết hạn (>5p) và chuyển thành trạng thái ‘cart’ và các sản phẩm trong giỏ hàng thành processing.
//b. hệ thống kiểm tra các Cart tồn tại >24h và không đc lưu (issave ? cart = 0)  thì xóa cart(cả cartdetail).

    $jsontext = callAPI("gbshop", 'cart_updateCartStatus.api');
    $gbeAPIData = json_decode($jsontext, true);

?>