<script type="application/javascript" src="<?php echo HTTP_SERVER ?>assets/plugins/jquery-3.4.1/jquery-3.4.1.min.js"></script>
<section class="cart">
    <div class="cart__container container">
        <?php if($cartData["data"]["products"]){ ?>
        <div class="cart__row row">
            <div class="cart__content col-lg-9">
                <?php include("cart_content.tpl")?>
            </div>
            <div class="cart__login col-lg-3">
                <?php if($_SESSION["loginmemberid"]) include("cart_rightside_afterlogin.tpl"); else include("cart_rightside_beforelogin.tpl") ?>
            </div>
        </div>
        <?php } else { ?>
        <div class="cart__empty">
            <p>Chưa có sản phẩm trong giỏ hàng</p>
            <a href="<?php echo HTTP_SERVER ?>san-pham.html">Tiếp tục mua sắm</a>
        </div>
        <?php } ?>
    </div>
</section>

<div class="modalLoading"><!--Loading--></div>
<div id="modal__productoutofstock" class="gbmodal">
    <div class="gbmodal__inner">
        <a class="gbreload" href="javascript:void(0)">
            <svg width="14" height="14" viewBox="0 0 1792 1792" xmlns="http://www.w3.org/2000/svg">
                <path
                        d="M1490 1322q0 40-28 68l-136 136q-28 28-68 28t-68-28l-294-294-294 294q-28 28-68 28t-68-28l-136-136q-28-28-28-68t28-68l294-294-294-294q-28-28-28-68t28-68l136-136q28-28 68-28t68 28l294 294 294-294q28-28 68-28t68 28l136 136q28 28 28 68t-28 68l-294 294 294 294q28 28 28 68z"/>
            </svg>
        </a>
        <div class="modal__content">

        </div>
    </div>
</div>