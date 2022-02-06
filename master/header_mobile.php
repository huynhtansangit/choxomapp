
<link rel="stylesheet" href="./assets/css/header_mobile.css">
<header class="header__mobile">
    <div class="header__mobile-container">
        <div class="top-bar-mobile">
            <div class="top-bar_container">
                <div class="col-auto logo-container">
                    <div class="row">
                        <a href="<?php echo HTTP_SERVER ?>homepage/index.gbe">
                            <img src="assets/0img/logo-mobile-1x.png" alt="logo-mobile" class="logo-mobile">
                        </a>
                    </div>
                </div>
                <div class="col-auto bars-icon-container" onclick="processNav()">
                    <div class="row">
                        <img src="../assets/0img/bars-icon-1x.png" alt="logo-mobile" class="logo-mobile">
                    </div>
                </div>
            </div>
            <div class="top-bar__menu" id="top-bar__menu" style="display: none;">
                <ul>
                    <li><a href="<?php echo HTTP_SERVER ?>homepage/index.gbe">Trang chủ</a></li>
                    <li><a href="<?php echo HTTP_SERVER ?>about/about.gbe">Về Chợ Xổm</a></li>
                    <li><a href="<?php echo HTTP_SERVER ?>foodcorner/foodcorner.gbe">Góc ẩm thực</a></li>
                    <li><a href="<?php echo HTTP_SERVER ?>policies/policy.gbe">Chính sách</a></li>
                    <li><a href="<?php echo HTTP_SERVER ?>contact/contact.gbe">Liên hệ</a></li>
                </ul>
            </div>
        </div>
    </div>
</header>
<script>
    function processNav() {
        var header__menu = document.getElementById("top-bar__menu");
        // if (window.getComputedStyle(header__menu).display === "none") {
        //     alert("none");
        //     header__menu.clas.display = "block !important";
        // }
        // else {
        //     alert("block");
        //     header__menu.style.display = "none !important";
        // }
        header__menu.style.display = header__menu.style.display === 'none' ? '' : 'none';
    }
</script>