<!-- Main -->
<div class="homepage">
    <!-- Slider main container -->
    <div id="homepage_swiper" class="swiper-container homepage__swiper h-100">
        <!-- Additional required wrapper -->
        <div class="swiper-wrapper">
            <!-- Slides -->
            <?php if(!empty($banners)) { ?>
                <?php foreach($banners as $index => $banner) { ?>
                    <div class="swiper-slide homepage__slide" style="background-image: url('<?= HTTP_SERVER . 'assets/img/banner/' . $banner['background']  ?>')">
                        <div class="h-100 position-relative">
                            <div class="h-100 homepage-slide__image">
                                <img src="<?= HTTP_SERVER ?>assets/img/banner/<?= $banner['image']?>"
                                     alt="smartphone-<?= $index ?>">
                            </div>
                            <div class="container h-100">
                                <div class="row h-100 align-items-center">
                                    <div class="offset-lg-6 col-lg-6">
                                        <div class="homepage-slide__content d-flex" style="flex-direction: column">
                                            <div class="homepage-slide__title order-lg-1 order-3"><?= $banner['title']?></div>
                                            <div class="homepage-slide__summary order-lg-2 order-4"><?= $banner['summary']?></div>
                                            <div class="homepage-slide__download-app order-lg-3 order-1">Tải app ngay:</div>
                                            <div class="footer__app-links order-lg-4 order-2">
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
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                <?php } ?>
            <?php } ?>

        </div>
        <!-- If we need pagination -->
        <div class="swiper-pagination homepage__pagination"></div>
    </div>
</div>
