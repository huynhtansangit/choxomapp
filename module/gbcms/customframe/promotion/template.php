<?php
$jsonText = callAPI("gbcms", "banner_getPromotionBannerList.api");
$jsonData = json_decode($jsonText, true);
$promotionBannerData = $jsonData['data'];

?>
<link rel="stylesheet" href="<?php echo HTTP_SERVER ?>module/gbcms/customframe/promotion/style.css">
<!--<script src="<?php echo HTTP_SERVER ?>module/gbcms/customframe/promotion/script.js"></script>-->
<div class="promotion">
    <div class="container">
        <div class="row">
            <?php if (!empty($promotionBannerData)) { ?>
                <?php foreach($promotionBannerData as $promotion) { ?>
                    <div class="col-lg-4 col-12 promotion__banner">
                        <a href="<?php echo $promotion['url']; ?>">
                            <img width="724" height="470" alt="Homepage promotion banner"
                                 srcset="<?php echo IMAGE_SERVER ?>fixsize-724x470/<?php echo $promotion['image'] . '?v=' . IMAGE_VERSION ?> 1.25x, <?php echo IMAGE_SERVER ?>fixsize-724x470/<?php echo $promotion['image'] . '?v=' . IMAGE_VERSION ?> 2x"
                                 src="<?php echo IMAGE_SERVER ?>fixsize-362x235/<?php echo $promotion['image'] == '' ? 'upload/default.png' . '?v=' . IMAGE_VERSION : $promotion['image'] . '?v=' . IMAGE_VERSION?>">
                        </a>
                    </div>
                <?php } ?>
            <?php } ?>
        </div>
    </div>
</div>
