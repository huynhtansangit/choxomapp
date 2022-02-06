<?php if ($_SESSION['loginmembername']) { ?>
<div class="shoppingcart_invoice__title">
    <p>Chào <b><?php echo $_SESSION['loginmembername'] ?></b></p>
</div>
<?php } ?>
<div class="shoppingcart_invoice__yourcart">
    <div class="yourcart__title">
        <p><b>Giỏ hàng của bạn</b><a id="btn-backtocart" class="shipping__backtocart" href="javascript:void(0)">Sửa</a>
        </p>
    </div>
    <div class="yourcart__quantity">
        <p><?php echo count($cartData['data']['products'])?></p>
    </div>
</div>
<div class="shoppingcart__invoice__products">
    <?php if (!empty($cartData['data']['products'])) { ?>
    <?php foreach($cartData['data']['products'] as $product ){ ?>
    <div class="shoppingcart__invoice__product">
        <img width="80" height="80" class="" alt=""
             srcset="<?php echo IMAGE_SERVER.'resize-80x80/'.$product['image'] . '?v=' . IMAGE_VERSION ?> 1.25x, <?php echo IMAGE_SERVER.'resize-80x80/'.$product['image'] . '?v=' . IMAGE_VERSION ?> 2x"
             src="<?php echo IMAGE_SERVER.'resize-80x80/'.$product['image'] . '?v=' . IMAGE_VERSION ?>">

        <div class="shoppingcart__invoice__product__detail">
            <div class="product__name">
                <?php echo $product['productname'] ?>
            </div>
            <div class="product__quantity">
                Số lượng: <?php echo $product['quantity'] ?>

            </div>
            <div class="d-flex">
                <?php if($product['basesubtotal'] != $product['subtotal']) { ?>
                <div class="product__oldprice mr-2">
                    <?php echo number_format($product['basesubtotal'], 0, '.', '.') ?><?php echo $webconfig['currency']?>
                </div>
                <?php } ?>
                <div class="product__lastprice">
                    <?php echo number_format($product['subtotal'], 0, '.', '.') ?><?php echo $webconfig['currency']?>
                </div>
            </div>
        </div>
    </div>
    <?php } ?>
    <?php } ?>

</div>
<div class="cart__content__total__sum">
    <div class="cart__content__total__sum__row">
        <span>Cộng giỏ hàng</span>

        <div id="shipping_totallines" class="cart__content__total__sum__price"><?php echo number_format($cartData['data']['totallines'], 0, '.', '.') ?><?php echo $cartData["data"]["currency"]?></div>
    </div>

    <div class="cart__content__total__sum__row">
        <?php if (!empty($cartData['data']['promotioncode'])) { ?>
        <div class="cart__content__total__code">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512">
                <path d="M497.941 225.941L286.059 14.059A48 48 0 0 0 252.118 0H48C21.49 0 0 21.49 0 48v204.118a48 48 0 0 0 14.059 33.941l211.882 211.882c18.744 18.745 49.136 18.746 67.882 0l204.118-204.118c18.745-18.745 18.745-49.137 0-67.882zM112 160c-26.51 0-48-21.49-48-48s21.49-48 48-48 48 21.49 48 48-21.49 48-48 48zm513.941 133.823L421.823 497.941c-18.745 18.745-49.137 18.745-67.882 0l-.36-.36L527.64 323.522c16.999-16.999 26.36-39.6 26.36-63.64s-9.362-46.641-26.36-63.64L331.397 0h48.721a48 48 0 0 1 33.941 14.059l211.882 211.882c18.745 18.745 18.745 49.137 0 67.882z"/>
            </svg>
            <span><?php echo $cartData['data']['promotioncode'] ?></span>
        </div>
        <div id="shipping__promotionamount" class="cart__content__total__sum__sale">-<?php echo number_format($cartData['data']['discountamount'], 0, '.', '.') ?><?php echo $cartData["data"]["currency"]?></div>
        <?php } ?>
    </div>
    <?php if($cartData['data']['iscollect'] == '0') { ?>
    <div id="shippingfee__row" class="cart__content__total__sum__row--total">
        <span>Phí vận chuyển</span>
        <?php if($cartData['data']['shipcost'] == 0) { ?>
        <div id="shippingfee" class="cart__content__total__sum__price">Báo giá  sau</div>
        <?php } else { ?>
            <div id="shippingfee" class="cart__content__total__sum__price"><?php echo number_format($cartData['data']['shipcost'], 0, '.', '.') ?> <?php echo $cartData["data"]["currency"]?></div>
        <?php } ?>
    </div>
    <div class="cart__content__total__sum__row cart__content__total__sum__row--cartsubtotal">
        <span class="total__title">Tổng</span>

        <div id="shipping__totalprice" class="total__price"><?php echo number_format($cartData['data']['totalorder'], 0, '.', '.') ?> <?php echo $cartData["data"]["currency"]?></div>
    </div>
    <?php } else { ?>
    <div id="shippingfee__row" class="cart__content__total__sum__row--total" style="display: none;">
        <span>Phí vận chuyển</span>
        <?php if($cartData['data']['shipcost'] == 0) { ?>
        <div id="shippingfee" class="cart__content__total__sum__price">Báo giá  sau</div>
        <?php } else { ?>
        <div id="shippingfee" class="cart__content__total__sum__price"><?php echo number_format($cartData['data']['shipcost'], 0, '.', '.') ?> <?php echo $cartData["data"]["currency"]?></div>
        <?php } ?>
    </div>
    <div class="cart__content__total__sum__row cart__content__total__sum__row--cartsubtotal">
        <span class="total__title">Tổng</span>

        <div id="shipping__totalprice" class="total__price"><?php echo number_format($cartData['data']['totalorder'], 0, '.', '.') ?> <?php echo $cartData["data"]["currency"]?></div>
    </div>
    <?php } ?>
</div>

