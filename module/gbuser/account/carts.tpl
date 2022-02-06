<style>
    .account__sidebar__carts {
        background-color: #E2E2E2;
    }
</style>
<div class="carts">
    <div class="carts__container container">
        <nav class="account__breadcrumb">
            <a class="breadbrum__active" href="<?php echo HTTP_SERVER ?>">Trang chủ</a>
            <span>/</span>
            <a class="breadbrum__noactive"> Giỏ hàng của tôi</a>
        </nav>
        <div class="carts__row row">
            <div class="carts__col-md-3 col-md-3">
                <div class="carts__sidebar">
                    <?php include("account_sidebar.php")?>
                </div>
            </div>

            <div class="carts__col-md-9 col-md-9">
                <div class="carts__content">
                    <p class="carts__content__heading">Giỏ hàng của tôi</p>

                    <div class="carts__content__table">
                        <table>
                            <thead>
                            <tr>
                                <th style="width:15%;min-width:118px">Mã giỏ hàng</th>
                                <th style="width:25%;min-width:196px">Ngày lưu</th>
                                <th style="width:18%;min-width:140px">Tổng</th>
                                <th style="width:25%;min-width:196px">Tiếp tục mua hàng</th>
                            </tr>
                            </thead>
                            <tbody>
                            <?php if (!empty($cartList)) { ?>
                            <?php foreach($cartList as $cart){ ?>
                            <tr>
                                <td>
                                    <?php echo $cart['cartcode']?>
                                </td>
                                <td>
                                    <?php echo $cart['updateddate']?>
                                </td>
                                <td class="text-right">
                                    <?php echo number_format($cart['totalorder'],0,',','.')?><?php echo $cart['currency'] ?>
                                </td>
                                <td class="text-center">
                                    <a class="continue__shopping" data-cartcode="<?php echo $cart['cartcode'] ?>">Tiếp tục mua hàng</a>
                                </td>
                            </tr>
                            <?php } ?>
                            <?php } ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    var continue__shopping = document.getElementsByClassName('continue__shopping');
    for(var i= 0; i< continue__shopping.length; i++){
        continue__shopping[i].addEventListener("click", function(){
            var formData = new FormData();
            var cartCode = this.getAttribute("data-cartcode");
            formData.append('cartcode',cartCode);
            showLoading();
            xhr(main_http_server + "gbshop/ajax/cloneCart.gbe", formData, function(res) {
                data = JSON.parse(res);
                url = main_http_server + 'gbshop/shoppingcart/cart.gbe';
                window.location.replace(url);
            })
        })
    }

</script>