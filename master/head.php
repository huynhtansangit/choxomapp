<!-- ========== Meta Tags ========== -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- ========== Page Title ========== -->
<?php if (!empty($gbeMetaTitle)) { ?>
    <!-- Đây là nơi dành cho những trang có seourl -->
    <title><?php echo $gbeMetaTitle ?></title>
    <meta property="og:title" content="<?php echo $dataSEO['og_title'] ?>">
    <meta property="og:url" content="<?php echo HTTP_SERVER . $dataSEO['seourl'] ?>.html">
    <meta property="og:description" content="<?php echo $dataSEO['og_description'] ?>">
    <meta property="og:type" content="article">
    <meta property="og:image" content="<?php echo IMAGE_SERVER . 'fixsize-158x158/' . $dataSEO['og_image'] ?>">
    <meta name="description" content="<?php echo $dataSEO['og_description'] ?>">
<?php } else { ?>
    <!-- Đây là nơi cho những trang không có seourl -->
    <?php $functionTitle = array(
        'index' => 'Chợ Xổm',
        'thankyou' => "Cảm ơn",
        'list' => "Product List",
        "cart" => "Giỏ hàng",
        "carts" => "Giỏ hàng của tôi",
        "shipping" => "Giao hàng",
        "cart_payment" => "Thanh toán",
        "order" => "Đơn hàng",
        "profile" => "Thông tin của tôi",
        "orderdetail" => "Chi tiết đơn hàng",
        "orderdetailbytoken" => "Chi tiết đơn hàng",
        "search" => "Tìm kiếm",
        "login" => "Đăng nhập",
        "activeaccount" => "Đăng ký thành công",
        "forgotpassword" => "Quên mật khẩu",
        "changepassword" => "Đổi mật khẩu",
        "contact" => "Liên hệ",
        "about" =>"Về Chợ Xổm",
        "foodcorner" => "Góc ẩm thực"
    ) ?>
    <meta property="og:title" content="Homepage">
    <meta property="og:url" content="<?php echo HTTP_SERVER ?>">
    <meta property="og:description" content="">
    <meta property="og:type" content="article">
    <meta property="og:image" content="<?php echo IMAGE_SERVER . 'fixsize-158x158/' . $dataSEO['og_image'] ?>">
    <meta name="description" content="GBmaster">
    <title><?php echo $functionTitle[$gbeFunction] != '' ? $functionTitle[$gbeFunction] : $gbeFunction ?></title>
<?php } ?>
<!-- ========== Favicon Icon ========== -->
<link rel="shortcut icon" href="<?php echo HTTP_ROOTSERVER ?>favicon.ico?v=<?php echo FILE_VERSION ?>" type="image/x-icon">

<!-- ========== Start Stylesheet ========== -->
<link rel="stylesheet" href="./assets/plugins/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="./assets/plugins/swiper-5.4.5/css/swiper.min.css">
<link rel="stylesheet" href="./assets/plugins/animate/animate.min.css">
<link rel="stylesheet" href="./assets/plugins/font-awesome-5.13.0/css/all.min.css?v=<?php echo FILE_VERSION ?>">
<link rel="stylesheet" href="./assets/0css/default.css">

<link rel="stylesheet" href="./assets/css/header.css">
<link rel="stylesheet" href="./assets/css/footer.css">

<!-- ========== End Stylesheet ========== -->
<?php loadGlobalCSS(); ?>
