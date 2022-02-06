<link rel="stylesheet" href="<?php echo $httpFrame ?>template.css">
<div class="gbframeblock gbf__0004">
    <?php if($device == 'desktop') { ?>
    <div class="swiper-container swiper__gbf--004">
        <div class="swiper-wrapper">
            <?php if (!empty($blockdata['GBF0004_217'])) { ?>
                <?php foreach ($blockdata['GBF0004_217'] as $image) { ?>
                    <div class="swiper-slide">
                        <img width="100%" height="250" src="<?php echo IMAGE_SERVER ?>fixsize-1600x250/<?php echo $image['col01']; ?>" class="d-block">
                    </div>
                <?php } ?>
            <?php } ?>
        </div>
        <!-- Add Arrows -->
        <!--
        <div class="swiper-button-next gbf__0004--btnnext"></div>
        <div class="swiper-button-prev gbf__0004--btnprev"></div>
        -->
        <!-- Add Pagination -->

        <div class="swiper-pagination gbf__0004--pagination"></div>
    </div>
    <?php } else { ?>
    <div class="swiper-container swiper__gbf--004">
        <div class="swiper-wrapper">
            <?php if (!empty($blockdata['GBF0004_217'])) { ?>
            <?php foreach ($blockdata['GBF0004_217'] as $image) { ?>
            <div class="swiper-slide">
                <img width="100%" height="500" src="<?php echo IMAGE_SERVER ?>fixsize-1600x500/<?php echo $image['col01']; ?>" class="d-block">
            </div>
            <?php } ?>
            <?php } ?>
        </div>
        <!-- Add Pagination -->
        <div class="swiper-pagination gbf__0004--pagination"></div>
    </div>
    <?php } ?>
</div>
<script src="<?php echo $httpFrame ?>template.js"></script>