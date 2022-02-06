<header class="header">
    <section class="top-bar">
        <div class="container">
            <div class="row justify-content-between">
                <div class="col-auto d-flex align-items-center">
                    <a class="--none-text-decor" href="<?php echo HTTP_SERVER ?>">
                        <div class="top-bar__brand">
                            <img src="../assets/0img/logo-header_1x.png" srcset="" alt="logo-header" class="top-bar__logo">
                            <div class="top-bar__slogan-container">
                                <span class="top-bar__slogan-text">
                                    Đi chợ quê online
                                </span>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-auto d-flex align-items-center">
                    <div class="top-bar__links-page-container">
                        <ul class="top-bar__links-page-list" id="top-bar__links-page-list">
                            <li><a class="top-bar__link" href="<?php echo HTTP_SERVER ?>">Trang chủ</a></li>
                            <li><a class="top-bar__link" href="<?php echo HTTP_SERVER ?>about/about.gbe">Về Chợ Xổm</a></li>
                            <li><a class="top-bar__link" href="<?php echo HTTP_SERVER ?>foodcorner/foodcorner.gbe">Góc ẩm thực</a></li>
                            <li><a class="top-bar__link" href="<?php echo HTTP_SERVER ?>policies/policy.gbe">Chính sách</a></li>
                            <li><a class="top-bar__link" href="<?php echo HTTP_SERVER ?>contact/contact.gbe">Liên hệ</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
</header>
<script>
    const windowHref = window.location.href;
    const link_List = document.getElementsByClassName("top-bar__link");
    console.log(link_List.length);

    function docReady() {
        for (let index = 0; index < link_List.length; index++) {
            const link = link_List[index];
            if (link.href == windowHref) {
                link.classList.add("active");
            } else {
                link.classList.remove("active");
            }
            //console.log("window:" + windowHref, "a href: " + link.href)
        }
    }
    docReady();
</script>