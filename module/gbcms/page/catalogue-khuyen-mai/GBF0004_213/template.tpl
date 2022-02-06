<link rel="stylesheet" href="<?php echo HTTP_SERVER ?>assets/plugins/photoswipe/photoswipe.min.css">
<link rel="stylesheet" href="<?php echo HTTP_SERVER ?>assets/plugins/photoswipe/photoswipe-default-skin.min.css">

<link rel="stylesheet" href="<?php echo HTTP_SERVER ?>module/gbcms/page/catalogue-khuyen-mai/GBF0004_213/GBF0004_213.css">

<script type="application/javascript" src="<?php echo HTTP_SERVER ?>assets/plugins/photoswipe/photoswipe.min.js"></script>
<script type="application/javascript" src="<?php echo HTTP_SERVER ?>assets/plugins/photoswipe/photoswipe-ui-default.min.js"></script>
<script type="application/javascript" src="<?php echo HTTP_SERVER ?>module/gbcms/page/catalogue-khuyen-mai/GBF0004_213/GBF0004_213.js"></script>

<section id="catalogue__promotion">
    <?php include("assets/plugins/photoswipe/template/photoswipe.tpl"); ?>
    <div class="catalogue__container container">
        <h1>GoodPharma tạm thời chưa có chương trình khuyến mãi đặc biệt</h1>
        <!-- Slider main container -->
        <div class="swiper-container catalogue__swiper">
            <!-- Additional required wrapper -->
            <div class="swiper-wrapper catalogue__photoswipe">
                <!-- Slides -->
                <?php if(!empty($blockdata['GBF0004_213'])) { ?>
                <?php foreach($blockdata['GBF0004_213'] as $index => $catalogue) { ?>
                <figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject" class="swiper-slide text-center">
                    <a href="<?php echo IMAGE_SERVER ?>fixsize-533x746/<?php echo $catalogue['col02'] ?>?v=<?php echo IMAGE_VERSION ?>" itemprop="contentUrl" data-size="533x746">
                        <?php if($index < 2) { ?>
                        <img width="533" height="746"
                             srcset="<?php echo IMAGE_SERVER ?>fixsize-1066x1492/<?php echo $catalogue['col02'] ?>?v=<?php echo IMAGE_VERSION ?> 1.25x,
                                <?php echo IMAGE_SERVER ?>fixsize-1066x1492/<?php echo $catalogue['col02'] ?>?v=<?php echo IMAGE_VERSION ?> 2x"
                             src="<?php echo IMAGE_SERVER ?>fixsize-533x746/<?php echo $catalogue['col02'] ?>?v=<?php echo IMAGE_VERSION ?>" alt="gallery promotion">

                        <?php } else { ?>
                        <img width="533" height="746" class="lazy"
                             data-srcset="<?php echo IMAGE_SERVER ?>fixsize-1066x1492/<?php echo $catalogue['col02'] ?>?v=<?php echo IMAGE_VERSION ?> 1.25x,
                                <?php echo IMAGE_SERVER ?>fixsize-1066x1492/<?php echo $catalogue['col02'] ?>?v=<?php echo IMAGE_VERSION ?> 2x"
                             data-src="<?php echo IMAGE_SERVER ?>fixsize-533x746/<?php echo $catalogue['col02'] ?>?v=<?php echo IMAGE_VERSION ?>"
                             src="data:image/svg+xml;utf8,<svg xmlns='http://www.w3.org/2000/svg' width='533' height='746'><rect style='fill:rgb(255,255,255);' width='100%' height='100%' /></svg>"
                             alt="gallery promotion">
                        <?php } ?>
                    </a>
                </figure>
                <?php } ?>
                <?php } ?>
            </div>


            <!-- If we need navigation buttons -->
            <div class="swiper-button-prev catalogue__btn__prev"></div>
            <div class="swiper-button-next catalogue__btn__next"></div>

        </div>
        <!-- If we need pagination -->
        <div class="swiper-pagination catalogue__pagination" style="visibility: hidden"></div>
    </div>
</section>
