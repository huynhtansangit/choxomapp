<link rel="stylesheet" href="<?php echo HTTP_SERVER ?>module/gbcms/customframe/about_goodpharma/style.css">
<!--<script src="<?php echo HTTP_SERVER ?>module/gbcms/customframe/promotion/script.js"></script>-->

<?php if ($device == "desktop") { ?>
    <section id="aboutus" class="aboutus">
        <div class="aboutus__image">
            <img width="980" height="558" class="lazy"
                 data-srcset="<?php echo HTTP_SERVER . 'module/gbcms/customframe/about_goodpharma/images/goodpharma-staffs.jpg'?>?v=<?php echo IMAGE_VERSION?> 1.25x,
                            <?php echo HTTP_SERVER . 'module/gbcms/customframe/about_goodpharma/images/goodpharma-staffs.jpg'?>?v=<?php echo IMAGE_VERSION?> 2x"
                 data-src="<?php echo HTTP_SERVER . 'module/gbcms/customframe/about_goodpharma/images/goodpharma-staffs.jpg'?>?v=<?php echo IMAGE_VERSION?>"
                 src="data:image/svg+xml;utf8,<svg xmlns='http://www.w3.org/2000/svg' width='980' height='558'><rect style='fill:rgb(255,255,255);' width='100%' height='100%' /></svg>"
                 alt="Good Pharma Staffs">
        </div>
        <div class="aboutus__rightcol">
            <div class="aboutus__rightcol__content">
                <h2>Về GoodPharma</h2>
                <p>Goodpharma.vn là một website thương mại điện tử của GoodPharma – G.P Ngọc Tuyết, nơi quý khách hàng có thể đặt hàng trực tuyến bên cạnh việc mua sắm tại hệ thống cửa hàng của chúng tôi. Hy vọng Goodpharma.vn sẽ mang đến cho quý khách sự thuận tiện hơn trong việc mua sắm các sản phẩm chăm sóc sức khỏe cũng như cập nhật các kiến thức y học bổ ích cho bản thân và gia đình..</p>
                <a href="<?php echo HTTP_SERVER?>ve-goodpharma.html">Tham khảo thêm</a>
            </div>
        </div>
    </section>
<?php } else { ?>
    <section id="aboutus" class="aboutus">
        <div class="aboutus__image">
            <img width="980" height="558" class="lazy"
                 data-srcset="<?php echo HTTP_SERVER . 'module/gbcms/customframe/about_goodpharma/images/goodpharma-staffs.jpg'?>?v=<?php echo IMAGE_VERSION?> 1.25x,
                            <?php echo HTTP_SERVER . 'module/gbcms/customframe/about_goodpharma/images/goodpharma-staffs.jpg'?>?v=<?php echo IMAGE_VERSION?> 2x"
                 data-src="<?php echo HTTP_SERVER . 'module/gbcms/customframe/about_goodpharma/images/goodpharma-staffs.jpg'?>?v=<?php echo IMAGE_VERSION?>"
                 src="data:image/svg+xml;utf8,<svg xmlns='http://www.w3.org/2000/svg' width='980' height='558'><rect style='fill:rgb(255,255,255);' width='100%' height='100%' /></svg>"
                 alt="Good Pharma Staffs">
        </div>
        <div class="aboutus__rightcol__mobile container">
            <div class="aboutus__rightcol__content__mobile">
                <h2>Về Good Pharma</h2>
                <p>Goodpharma.vn là một website thương mại điện tử của GoodPharma – G.P Ngọc Tuyết, nơi quý khách hàng có thể đặt hàng trực tuyến bên cạnh việc mua sắm tại hệ thống cửa hàng của chúng tôi. Hy vọng Goodpharma.vn sẽ mang đến cho quý khách sự thuận tiện hơn trong việc mua sắm các sản phẩm chăm sóc sức khỏe cũng như cập nhật các kiến thức y học bổ ích cho bản thân và gia đình..</p>
                <a href="<?php echo HTTP_SERVER?>ve-goodpharma.html">Xem thêm</a>
            </div>
        </div>
    </section>
<?php } ?>
