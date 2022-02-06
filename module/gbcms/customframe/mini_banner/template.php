<link rel="stylesheet" href="<?php echo HTTP_SERVER ?>module/gbcms/customframe/mini_banner/style.css">
<!--<script src="<?php echo HTTP_SERVER ?>module/gbcms/customframe/promotion/script.js"></script>-->

<?php if ($device == "desktop") { ?>
    <div class="productbanner" style="background-image: url('<?php echo HTTP_SERVER . 'module/gbcms/customframe/mini_banner/images/banner2.png'?>')">
        <div class="productbanner__container container">
            <div class="productbanner__content">
                <div class="productbanner__content__slogan">THUỐC CHẤT LƯỢNG</div>
                <div class="productbanner__content__slogan">GIÁ PHẢI CHĂNG</div>
                <p>GoodPharma đảm bảo khách hàng luôn được chăm sóc tận tâm và cam kết chất lượng sản phẩm tốt nhất thị
                    trường.</p>
            </div>
        </div>
    </div>
<?php } elseif ($device == "mobile") { ?>
    <div class="productbanner" style="background-image: url('<?php echo HTTP_SERVER . 'module/gbcms/customframe/mini_banner/images/banner2_mobile.jpg'?>')">
        <div class="productbanner__container container">
            <div class="productbanner__content">
                <div class="productbanner__content__slogan">THUỐC CHẤT LƯỢNG</div>
                <div class="productbanner__content__slogan">GIÁ PHẢI CHĂNG</div>
                <p>GoodPharma đảm bảo khách hàng luôn được chăm sóc tận tâm và cam kết chất lượng sản phẩm tốt nhất thị
                    trường.</p>
            </div>
        </div>
    </div>
<?php } ?>
