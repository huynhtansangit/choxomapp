<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <?php include("master/head.php") ?>
    <link rel="stylesheet" href="https://demo.gbotweb.com/golead/golead.css">
    <script defer src="https://demo.gbotweb.com/golead/golead.js"></script>
</head>

<body>
    <div class="modalLoading">
        <!--Loading-->
    </div>
    <!-- Header -->
    <?php if ($device == 'desktop') { ?>
    <?php include("master/header.php") ?>

    <?php } else { ?>
    <?php include("master/header_mobile.php") ?>
    <?php } ?>
    <!-- End Header -->
    <link rel="stylesheet" href="<?= HTTP_ROOTSERVER ?>module/homepage/homepage.css?v=<?= FILE_VERSION ?>" />
    <!-- Main -->
    <section class="carousel">
        <!-- Slider main container -->
        <div id="homepage_swiper" class="swiper-container carousel__container">
            <!-- Additional required wrapper -->
            <div class="swiper-wrapper">
                <!-- Slides -->
                <div class="swiper-slide slide--1"
                    style="background-image: url('../../assets/img/banner/banner1_1x.png') !important;background-size: cover !important;background-repeat: no-repeat !important;">
                    <div class="slide__container container h-100">
                        <div class="row">
                            <div class="thumbnail col-12 col-lg-6 col-md-6 h-100">
                                <picture>
                                    <source media="(max-width: 768px)"
                                        srcset="<?= HTTP_SERVER ?>assets/img/banner/smartphone-slide1-mobile-1x.png">
                                    <img src="<?= HTTP_SERVER ?>assets/img/banner/img_carousel1_1x.png"
                                        alt="smartphone-1">
                                </picture>
                            </div>
                            <div class="content col-12 col-lg-6 col-md-6">
                                <div>
                                    <h2 class="content__heading">Đi chợ tiện lợi hơn qua ứng dụng Mobile với Chợ Xổm nhà
                                        em
                                    </h2>
                                    <p class="content__description">Để quý khách có trải nghiệm thuận tiện hơn và dễ
                                        dàng
                                        tìm hàng tươi ngon mỗi ngày, Chợ em hân hạnh cung cấp ứng dụng mua sắm qua điện
                                        thoại, quý khách có thể đặt hàng qua ứng dụng như Grab/Vin hay vẫn chat với chợ
                                        em
                                        để đặt hàng như hằng ngày ạ.</p>
                                </div>
                                <div>
                                    <div class="content__download--title">Tải app ngay:</div>
                                    <!-- Reuse from footer -->
                                    <div class="footer__app-links">
                                        <div class="footer__app-links-container">
                                            <a class="footer__link ml-0 banner__customized-link" href="#">
                                                <img class="google-play" src="assets/img/banner/banner_ggplay.png"
                                                    alt="" srcset="">
                                                <div class="footer__link-text-container">
                                                    <span class="footer__link-text--smaller">Available on</span>
                                                    <span class="footer__link-text">Google Play</span>
                                                </div>
                                            </a>
                                            <a class="footer__link banner__customized-link -mr-mobile" href="#">
                                                <img class="app-store" src="assets/img/banner/banner__appstore.png"
                                                    alt="" srcset="">
                                                <div class="footer__link-text-container">
                                                    <span class="footer__link-text--smaller">Available on</span>
                                                    <span class="footer__link-text">App Store</span>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <!-- Reuse from footer -->
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End slide 1 -->
                <!-- -----Slide 2----- -->
                <div class="swiper-slide slide--2"
                    style="background-image: url('../../assets/img/banner/banner2_1x.png') !important;background-size: cover !important;background-repeat: no-repeat !important;">
                    <div class="slide__container container h-100">
                        <div class="row">
                            <div class="thumbnail col-12 col-lg-6 col-md-6 h-100">
                                <picture>
                                    <source media="(max-width: 768px)"
                                        srcset="<?= HTTP_SERVER ?>assets/img/banner/smartphone-slide2-mobile-1x.png">
                                    <img src="<?= HTTP_SERVER ?>assets/img/banner/img_carousel2_1x.png"
                                        alt="smartphone-2">
                                </picture>
                            </div>
                            <div class="content col-12 col-lg-6 col-md-6">
                                <div>
                                    <h2 class="content__heading">Kiểm tra hàng tươi ngon mỗi ngày, tích điểm mua sắm,
                                        nhận
                                        quà thả ga!
                                    </h2>
                                    <p class="content__description">Quý khách sau khi tải app, chợ em có chuyên mục “Chợ
                                        Xổm
                                        Hôm Nay”, quý khách sẽ dễ dàng xem tất cả hàng tươi ngon mà chợ em về mỗi ngày
                                        ạ.
                                        Đồng thời đơn hàng mua qua App chợ em sẽ tích điểm để tri ân và tặng quà cho quý
                                        khách ạ.
                                    </p>
                                </div>
                                <div>
                                    <div class="content__download--title">Tải app ngay:</div>
                                    <!-- Reuse from footer -->
                                    <div class="footer__app-links">
                                        <div class="footer__app-links-container">
                                            <a class="footer__link ml-0 banner__customized-link" href="#">
                                                <img class="google-play" src="assets/img/banner/banner_ggplay.png"
                                                    alt="" srcset="">
                                                <div class="footer__link-text-container">
                                                    <span class="footer__link-text--smaller">Available on</span>
                                                    <span class="footer__link-text">Google Play</span>
                                                </div>
                                            </a>
                                            <a class="footer__link banner__customized-link -mr-mobile" href="#">
                                                <img class="app-store" src="assets/img/banner/banner__appstore.png"
                                                    alt="" srcset="">
                                                <div class="footer__link-text-container">
                                                    <span class="footer__link-text--smaller">Available on</span>
                                                    <span class="footer__link-text">App Store</span>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <!-- Reuse from footer -->
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End slide 2 -->
                <!-- Slide 3 -->
                <div class="swiper-slide slide--3"
                    style="background-image: url('../../assets/img/banner/banner3_1x.png') !important;background-size: cover !important;background-repeat: no-repeat !important;">
                    <div class="slide__container container h-100">
                        <div class="row">
                            <div id="thumbnail-slide3" class="thumbnail">
                                <!-- <img class="position-absolute" style="width: 70%;right: 43px;" src="<?= HTTP_SERVER ?>assets/img/banner/img_carousel1_1x.png" alt="">
                                <img class="position-absolute" style="left: -56px;width: 57%;" src="<?= HTTP_SERVER ?>assets/img/banner/img-carousel-3-boxchat-1x.png" alt=""> -->
                                <picture>
                                    <source media="(max-width: 768px)"
                                        srcset="<?= HTTP_SERVER ?>assets/img/banner/smartphone-slide3-mobile-1x.png">
                                    <img id="img-slide3" src="<?= HTTP_SERVER ?>assets/img/banner/img_carousel3_1x.png"
                                        alt="smartphone-3">
                                </picture>
                            </div>
                            <div class="content col-12 col-lg-6 col-md-6 offset-lg-6 offset-md-6">
                                <div>
                                    <h2 class="content__heading">Đăng ký tải app hôm nay, nhận ngay 10,000đ
                                    </h2>
                                    <p class="content__description">Nhân dịp khai trương ứng dụng mua sắm này, quý anh
                                        chị
                                        cô bác tải app về sẽ được nhận ngay 10,000đ vào ví điểm tương ứng 10 điểm để
                                        tích
                                        điểm đổi quà tặng từ Chợ Xổm ạ.</p>
                                </div>
                                <div>
                                    <div class="content__download--title">Tải app ngay:</div>
                                    <!-- Reuse from footer -->
                                    <div class="footer__app-links">
                                        <div class="footer__app-links-container">
                                            <a class="footer__link ml-0 banner__customized-link" href="#">
                                                <img class="google-play" src="assets/img/banner/banner_ggplay.png"
                                                    alt="" srcset="">
                                                <div class="footer__link-text-container">
                                                    <span class="footer__link-text--smaller">Available on</span>
                                                    <span class="footer__link-text">Google Play</span>
                                                </div>
                                            </a>
                                            <a class="footer__link banner__customized-link -mr-mobile" href="#">
                                                <img class="app-store" src="assets/img/banner/banner__appstore.png"
                                                    alt="" srcset="">
                                                <div class="footer__link-text-container">
                                                    <span class="footer__link-text--smaller">Available on</span>
                                                    <span class="footer__link-text">App Store</span>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <!-- Reuse from footer -->
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End slide 3 -->
            </div>
            <!-- If we need pagination -->
            <div class="d-none d-md-block carousel-banner__pagination-vertical swiper-pagination"></div>
            <div class="d-md-none carousel-banner__pagination-horizontal swiper-pagination"></div>
        </div>
    </section>
    <!-- End Main -->

</body>
<script src="/assets/plugins/swiper-5.4.5/js/swiper.min.js"></script>
<script src="assets/js/swipperBanner.js"></script>
<script>
    //set padding top of banner equal to header height
    function centerSlide3() {
        var swiperSlide3Element = document.getElementsByClassName("swiper-slide")[2];
        var swiperSlide3Style = swiperSlide3Element.currentStyle || window.getComputedStyle(swiperSlide3Element);
        var swiperSlide3Height = swiperSlide3Element.offsetHeight;
        var swiperSlide3Padding = parseFloat(swiperSlide3Style.paddingBottom) + parseFloat(swiperSlide3Style.paddingTop);
        var slide3HeightValue = swiperSlide3Height - swiperSlide3Padding;
        document.querySelectorAll("#thumbnail-slide3").forEach((e) => {
            e.style.lineHeight = slide3HeightValue + "px";
        });
        return slide3HeightValue;
    };
    function resizeImageSlide3() {
        var heightSlide3 = centerSlide3();
        var widthSlide3 = document.getElementsByClassName("swiper-slide")[2].offsetWidth;
        if (heightSlide3 <= 786) {
            document.getElementById("img-slide3").style.height = heightSlide3 + "px";
        }
        var widthImg = document.getElementById("img-slide3").offsetWidth;
        if (widthImg >= widthSlide3 / 2) {
            document.getElementById("img-slide3").style.width = widthSlide3 / 2 - 70 + "px";
            widthImg = document.getElementById("img-slide3").offsetWidth;
        }
        else {
            document.getElementById("img-slide3").style.width = "auto";
        }

        if (heightSlide3 <= 786) {
            document.getElementById("thumbnail-slide3").style.left = widthSlide3 / 4 - widthImg / 2 + "px";
        }
        else if (heightSlide3 > 786) {
            document.getElementById("thumbnail-slide3").style.left = widthSlide3 / 2 - widthImg - 70 + "px";
            if (heightSlide3 == 904 && widthSlide3 == 768) {
                document.getElementById("img-slide3").style.width = 362 + "px";
                document.getElementById("img-slide3").style.paddingLeft = 15 + "px";
            }
        }

    }
    window.onload = () => {
        var header = document.querySelector("header");
        document.querySelectorAll(".swiper-slide").forEach((e) => {
            e.style.paddingTop = "clamp(" + (header.offsetHeight + 30) + "px,3.8vw," + (header.offsetHeight + 60) + "px";
        });
        // set line height of slide 3
        centerSlide3();
        resizeImageSlide3();
        window.onresize = () => {
            centerSlide3();
            resizeImageSlide3();
        }
    };
</script>

</html>