<?php
//add library popup
addGlobalJS("./module/gbshop/theme/plugins/popup/js/popup.js");

addGlobalJS("assets/plugins/jquery-3.4.1/jquery-3.4.1.min.js");
addGlobalJS("assets/plugins/jquery-ui/jquery-ui.min.js");
addGlobalJS("module/gbshop/customframe/covid_product/script.js");

$params = array(
    "tag" => "covid"
);
$jsonText = callAPI("gbshop", "product_getProductByTag.api", $params, array());
$covidProductsData = json_decode($jsonText, true);
$covidProductsList = $covidProductsData['data'];

?>
    <link rel="stylesheet" href="<?php echo HTTP_SERVER ?>module/gbshop/customframe/covid_product/style.css">
    <link rel="stylesheet" href="<?php echo HTTP_SERVER ?>module/gbshop/theme/plugins/popup/css/popup.min.css">
    <!--<script defer src="<?php echo HTTP_SERVER ?>module/gbshop/customframe/covid_product/script.js"></script>-->
<?php if (!empty($covidProductsList) && (sizeof($covidProductsList) >= 4)) { ?>
    <div class="product" style="background-color: #10BDD9;">
        <div class="product__container container">
            <div class="productsection__title">
                <h2 style="color: white;" class="productsection__title__before">
                    Đến GoodPharma <span class="d-none d-xl-inline-block">-</span>&nbsp;<br class="d-xl-none">Dịch bệnh bay xa
                </h2>
            </div>
            <div class="product__row row">

                <?php for ($i = 0; $i < 4; $i++) { ?>
                <?php if(!empty($covidProductsList)) { ?>
                    <div class="product__item <?php echo $covidProductsList[$i]['quantity'] <= 0 ? 'product__item__outofstock' : '' ?> col-6 col-lg-3">
                        <div class="product__inner">
                            <div class="product__image">
                                <img width="246" height="246" class="lazy"
                                     alt="<?php echo $covidProductsData[$i]['productname'] ?>"
                                     data-srcset="<?php echo IMAGE_SERVER ?>resize-492x492/<?php echo $covidProductsList[$i]['image1'] == '' ? '/assets/img/default.png' . '?v=' . IMAGE_VERSION : $covidProductsList[$i]['image1'] . '?v=' . IMAGE_VERSION ?> 1.25x,
                                                  <?php echo IMAGE_SERVER ?>resize-492x492/<?php echo $covidProductsList[$i]['image1'] == '' ? '/assets/img/default.png' . '?v=' . IMAGE_VERSION : $covidProductsList[$i]['image1'] . '?v=' . IMAGE_VERSION ?> 2x"
                                     data-src="<?php echo IMAGE_SERVER ?>resize-246x246/<?php echo $covidProductsList[$i]['image1'] == '' ? '/assets/img/default.png' . '?v=' . IMAGE_VERSION : $covidProductsList[$i]['image1'] . '?v=' . IMAGE_VERSION ?>"
                                     src="data:image/svg+xml;utf8,<svg xmlns='http://www.w3.org/2000/svg' width='246' height='246'><rect fill-opacity='0.0' style='fill:rgb(230,230,230);' width='100%' height='100%' /></svg>">
                            </div>

                            <?php if ($covidProductsList[$i]["baseprice"] !== $covidProductsList[$i]["sellingprice"]) { ?>
                                <div class="product__sale">
                                    <p>-<?php echo $covidProductsList[$i]["discount"] ?>%</p>
                                </div>
                            <?php } ?>

                            <div class="product__addcart">
                                <?php if($covidProductsList[$i]['quantity'] > 0) { ?>
                                <a style="cursor: pointer;" class="product__addtocart"
                                   data-productsku="<?php echo $covidProductsList[$i]['sku'] ?>"
                                   data-cartcode="<?php echo $_SESSION['cartcode'] ?>" data-quantity="1"
                                   data-quantityinstock="<?php echo $covidProductsList[$i]['quantity']?>">

                                    <svg fill="white" xmlns="http://www.w3.org/2000/svg"
                                         xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Capa_1" x="0px"
                                         y="0px" viewBox="0 0 260.293 260.293"
                                         style="enable-background:new 0 0 260.293 260.293;" xml:space="preserve">
<g>
    <path
        d="M258.727,57.459c-1.42-1.837-3.612-2.913-5.934-2.913H62.004l-8.333-32.055c-0.859-3.306-3.843-5.613-7.259-5.613H7.5   c-4.142,0-7.5,3.358-7.5,7.5c0,4.142,3.358,7.5,7.5,7.5h33.112l8.333,32.055c0,0.001,0,0.001,0.001,0.002l29.381,112.969   c0.859,3.305,3.843,5.612,7.258,5.612h137.822c3.415,0,6.399-2.307,7.258-5.612l29.385-112.971   C260.636,61.687,260.147,59.295,258.727,57.459z M117.877,167.517H91.385l-5.892-22.652h32.384V167.517z M117.877,129.864H81.592   l-5.895-22.667h42.18V129.864z M117.877,92.197H71.795l-5.891-22.651h51.973V92.197z M176.119,167.517h-43.242v-22.652h43.242   V167.517z M176.119,129.864h-43.242v-22.667h43.242V129.864z M176.119,92.197h-43.242V69.546h43.242V92.197z M217.609,167.517   h-26.49v-22.652h32.382L217.609,167.517z M227.403,129.864h-36.284v-22.667h42.18L227.403,129.864z M237.201,92.197h-46.081V69.546   h51.974L237.201,92.197z"/>
    <path
        d="M105.482,188.62c-15.106,0-27.396,12.29-27.396,27.395c0,15.108,12.29,27.4,27.396,27.4   c15.105,0,27.395-12.292,27.395-27.4C132.877,200.91,120.588,188.62,105.482,188.62z M105.482,228.415   c-6.835,0-12.396-5.563-12.396-12.4c0-6.835,5.561-12.395,12.396-12.395c6.834,0,12.395,5.561,12.395,12.395   C117.877,222.853,112.317,228.415,105.482,228.415z"/>
    <path
        d="M203.512,188.62c-15.104,0-27.392,12.29-27.392,27.395c0,15.108,12.288,27.4,27.392,27.4   c15.107,0,27.396-12.292,27.396-27.4C230.908,200.91,218.618,188.62,203.512,188.62z M203.512,228.415   c-6.833,0-12.392-5.563-12.392-12.4c0-6.835,5.559-12.395,12.392-12.395c6.836,0,12.396,5.561,12.396,12.395   C215.908,222.853,210.347,228.415,203.512,228.415z"/>
</g>

</svg>
                                    THÊM VÀO GIỎ</a>
                                <?php } else { ?>
                                    <a class="product__btn__outofstock"><svg fill="white" xmlns="http://www.w3.org/2000/svg"
                                                                             xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Capa_1"
                                                                             x="0px"
                                                                             y="0px" viewBox="0 0 260.293 260.293"
                                                                             style="enable-background:new 0 0 260.293 260.293;"
                                                                             xml:space="preserve">
<g>
    <path d="M258.727,57.459c-1.42-1.837-3.612-2.913-5.934-2.913H62.004l-8.333-32.055c-0.859-3.306-3.843-5.613-7.259-5.613H7.5   c-4.142,0-7.5,3.358-7.5,7.5c0,4.142,3.358,7.5,7.5,7.5h33.112l8.333,32.055c0,0.001,0,0.001,0.001,0.002l29.381,112.969   c0.859,3.305,3.843,5.612,7.258,5.612h137.822c3.415,0,6.399-2.307,7.258-5.612l29.385-112.971   C260.636,61.687,260.147,59.295,258.727,57.459z M117.877,167.517H91.385l-5.892-22.652h32.384V167.517z M117.877,129.864H81.592   l-5.895-22.667h42.18V129.864z M117.877,92.197H71.795l-5.891-22.651h51.973V92.197z M176.119,167.517h-43.242v-22.652h43.242   V167.517z M176.119,129.864h-43.242v-22.667h43.242V129.864z M176.119,92.197h-43.242V69.546h43.242V92.197z M217.609,167.517   h-26.49v-22.652h32.382L217.609,167.517z M227.403,129.864h-36.284v-22.667h42.18L227.403,129.864z M237.201,92.197h-46.081V69.546   h51.974L237.201,92.197z"/>
    <path d="M105.482,188.62c-15.106,0-27.396,12.29-27.396,27.395c0,15.108,12.29,27.4,27.396,27.4   c15.105,0,27.395-12.292,27.395-27.4C132.877,200.91,120.588,188.62,105.482,188.62z M105.482,228.415   c-6.835,0-12.396-5.563-12.396-12.4c0-6.835,5.561-12.395,12.396-12.395c6.834,0,12.395,5.561,12.395,12.395   C117.877,222.853,112.317,228.415,105.482,228.415z"/>
    <path d="M203.512,188.62c-15.104,0-27.392,12.29-27.392,27.395c0,15.108,12.288,27.4,27.392,27.4   c15.107,0,27.396-12.292,27.396-27.4C230.908,200.91,218.618,188.62,203.512,188.62z M203.512,228.415   c-6.833,0-12.392-5.563-12.392-12.4c0-6.835,5.559-12.395,12.392-12.395c6.836,0,12.396,5.561,12.396,12.395   C215.908,222.853,210.347,228.415,203.512,228.415z"/>
</g>

</svg>
                                        HẾT HÀNG</a>
                                <?php } ?>
                                <a href="<?php echo HTTP_SERVER . $covidProductsList[$i]['seourl'] ?>.html"
                                   class="product__viewdetail">
                                    <svg fill="white" viewBox="0 0 1792 1792"
                                         xmlns="http://www.w3.org/2000/svg">
                                        <path
                                            d="M1216 832q0-185-131.5-316.5t-316.5-131.5-316.5 131.5-131.5 316.5 131.5 316.5 316.5 131.5 316.5-131.5 131.5-316.5zm512 832q0 52-38 90t-90 38q-54 0-90-38l-343-342q-179 124-399 124-143 0-273.5-55.5t-225-150-150-225-55.5-273.5 55.5-273.5 150-225 225-150 273.5-55.5 273.5 55.5 225 150 150 225 55.5 273.5q0 220-124 399l343 343q37 37 37 90z"/>
                                    </svg>
                                    XEM CHI TIẾT</a>
                            </div>
                            <div class="product__description">
                                <a href="<?php echo HTTP_SERVER . $covidProductsList[$i]['categoryseourl'] . '.html' ?>"
                                   class="product__category"><?php echo $covidProductsList[$i]['categoryname'] ?></a>

                                <a href="<?php echo HTTP_SERVER . $covidProductsList[$i]['seourl'] ?>.html"
                                   class="product__name"
                                   style="<?php if ($covidProductsList[$i]['baseprice'] != $covidProductsList[$i]['sellingprice']) echo 'margin-bottom: 0' ?>"><?php echo $covidProductsList[$i]['productname'] ?></a>

                                <p class="product__price--old">
                                    <?php if ($covidProductsList[$i]["baseprice"] !== $covidProductsList[$i]["sellingprice"]) { ?>
                                        <?php echo number_format($covidProductsList[$i]["baseprice"], 0, ',', '.') . $covidProductsData["currency"] ?>
                                    <?php } ?>
                                </p>

                                <p class="product__price"><?php echo number_format(intval($covidProductsList[$i]['sellingprice']), '0', '.', '.') . $covidProductsData['currency'] ?></p><span>/<?php echo $covidProductsList[$i]['unitname'] ?></span>

                            </div>
                            <div class="product__item__advancebutton--mobile">
                                <?php if($covidProductsList[$i]['quantity'] > 0) { ?>
                                <a style="cursor: pointer;" class="product__addtocart"
                                   data-productsku="<?php echo $covidProductsList[$i]['sku'] ?>"
                                   data-cartcode="<?php echo $_SESSION['cartcode'] ?>" data-quantity="1"
                                   data-quantityinstock="<?php echo $covidProductsList[$i]['quantity']?>">

                                    <svg fill="white" xmlns="http://www.w3.org/2000/svg"
                                         xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Capa_1" x="0px"
                                         y="0px" viewBox="0 0 260.293 260.293"
                                         style="enable-background:new 0 0 260.293 260.293;" xml:space="preserve">
<g>
    <path
        d="M258.727,57.459c-1.42-1.837-3.612-2.913-5.934-2.913H62.004l-8.333-32.055c-0.859-3.306-3.843-5.613-7.259-5.613H7.5   c-4.142,0-7.5,3.358-7.5,7.5c0,4.142,3.358,7.5,7.5,7.5h33.112l8.333,32.055c0,0.001,0,0.001,0.001,0.002l29.381,112.969   c0.859,3.305,3.843,5.612,7.258,5.612h137.822c3.415,0,6.399-2.307,7.258-5.612l29.385-112.971   C260.636,61.687,260.147,59.295,258.727,57.459z M117.877,167.517H91.385l-5.892-22.652h32.384V167.517z M117.877,129.864H81.592   l-5.895-22.667h42.18V129.864z M117.877,92.197H71.795l-5.891-22.651h51.973V92.197z M176.119,167.517h-43.242v-22.652h43.242   V167.517z M176.119,129.864h-43.242v-22.667h43.242V129.864z M176.119,92.197h-43.242V69.546h43.242V92.197z M217.609,167.517   h-26.49v-22.652h32.382L217.609,167.517z M227.403,129.864h-36.284v-22.667h42.18L227.403,129.864z M237.201,92.197h-46.081V69.546   h51.974L237.201,92.197z"/>
    <path
        d="M105.482,188.62c-15.106,0-27.396,12.29-27.396,27.395c0,15.108,12.29,27.4,27.396,27.4   c15.105,0,27.395-12.292,27.395-27.4C132.877,200.91,120.588,188.62,105.482,188.62z M105.482,228.415   c-6.835,0-12.396-5.563-12.396-12.4c0-6.835,5.561-12.395,12.396-12.395c6.834,0,12.395,5.561,12.395,12.395   C117.877,222.853,112.317,228.415,105.482,228.415z"/>
    <path
        d="M203.512,188.62c-15.104,0-27.392,12.29-27.392,27.395c0,15.108,12.288,27.4,27.392,27.4   c15.107,0,27.396-12.292,27.396-27.4C230.908,200.91,218.618,188.62,203.512,188.62z M203.512,228.415   c-6.833,0-12.392-5.563-12.392-12.4c0-6.835,5.559-12.395,12.392-12.395c6.836,0,12.396,5.561,12.396,12.395   C215.908,222.853,210.347,228.415,203.512,228.415z"/>
</g>

</svg>
                                    THÊM VÀO GIỎ</a>
                                <?php } else { ?>
                                    <a class="product__btn__outofstock"><svg fill="white" xmlns="http://www.w3.org/2000/svg"
                                                                             xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Capa_1"
                                                                             x="0px"
                                                                             y="0px" viewBox="0 0 260.293 260.293"
                                                                             style="enable-background:new 0 0 260.293 260.293;"
                                                                             xml:space="preserve">
<g>
    <path d="M258.727,57.459c-1.42-1.837-3.612-2.913-5.934-2.913H62.004l-8.333-32.055c-0.859-3.306-3.843-5.613-7.259-5.613H7.5   c-4.142,0-7.5,3.358-7.5,7.5c0,4.142,3.358,7.5,7.5,7.5h33.112l8.333,32.055c0,0.001,0,0.001,0.001,0.002l29.381,112.969   c0.859,3.305,3.843,5.612,7.258,5.612h137.822c3.415,0,6.399-2.307,7.258-5.612l29.385-112.971   C260.636,61.687,260.147,59.295,258.727,57.459z M117.877,167.517H91.385l-5.892-22.652h32.384V167.517z M117.877,129.864H81.592   l-5.895-22.667h42.18V129.864z M117.877,92.197H71.795l-5.891-22.651h51.973V92.197z M176.119,167.517h-43.242v-22.652h43.242   V167.517z M176.119,129.864h-43.242v-22.667h43.242V129.864z M176.119,92.197h-43.242V69.546h43.242V92.197z M217.609,167.517   h-26.49v-22.652h32.382L217.609,167.517z M227.403,129.864h-36.284v-22.667h42.18L227.403,129.864z M237.201,92.197h-46.081V69.546   h51.974L237.201,92.197z"/>
    <path d="M105.482,188.62c-15.106,0-27.396,12.29-27.396,27.395c0,15.108,12.29,27.4,27.396,27.4   c15.105,0,27.395-12.292,27.395-27.4C132.877,200.91,120.588,188.62,105.482,188.62z M105.482,228.415   c-6.835,0-12.396-5.563-12.396-12.4c0-6.835,5.561-12.395,12.396-12.395c6.834,0,12.395,5.561,12.395,12.395   C117.877,222.853,112.317,228.415,105.482,228.415z"/>
    <path d="M203.512,188.62c-15.104,0-27.392,12.29-27.392,27.395c0,15.108,12.288,27.4,27.392,27.4   c15.107,0,27.396-12.292,27.396-27.4C230.908,200.91,218.618,188.62,203.512,188.62z M203.512,228.415   c-6.833,0-12.392-5.563-12.392-12.4c0-6.835,5.559-12.395,12.392-12.395c6.836,0,12.396,5.561,12.396,12.395   C215.908,222.853,210.347,228.415,203.512,228.415z"/>
</g>

</svg>
                                        HẾT HÀNG</a>
                                <?php } ?>
                                <?php if ($device == "desktop") { ?>
                                    <a href="<?php echo HTTP_SERVER . $covidProductsList[$i]['seourl'] ?>.html"
                                       class="product__viewdetail">
                                        <svg fill="white" viewBox="0 0 1792 1792"
                                             xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="M1216 832q0-185-131.5-316.5t-316.5-131.5-316.5 131.5-131.5 316.5 131.5 316.5 316.5 131.5 316.5-131.5 131.5-316.5zm512 832q0 52-38 90t-90 38q-54 0-90-38l-343-342q-179 124-399 124-143 0-273.5-55.5t-225-150-150-225-55.5-273.5 55.5-273.5 150-225 225-150 273.5-55.5 273.5 55.5 225 150 150 225 55.5 273.5q0 220-124 399l343 343q37 37 37 90z"/>
                                        </svg>
                                        XEM CHI TIẾT</a>
                                <?php } ?>
                            </div>
                        </div>
                    </div>

                <?php } ?>
                <?php } ?>
            </div>
            <div class="product__seemore">
                <a href="<?php echo HTTP_SERVER ?>san-pham.html"
                   style="background-color: #0BAEC8; color: white;"> Xem thêm </a>
            </div>
        </div>
    </div>
<?php } ?>

<div id="modal__message" class="gbmodal">
    <div class="gbmodal__inner">
        <a class="gbclose" href="javascript:void(0)">
            <svg width="14" height="14" viewBox="0 0 1792 1792" xmlns="http://www.w3.org/2000/svg">
                <path
                    d="M1490 1322q0 40-28 68l-136 136q-28 28-68 28t-68-28l-294-294-294 294q-28 28-68 28t-68-28l-136-136q-28-28-28-68t28-68l294-294-294-294q-28-28-28-68t28-68l136-136q28-28 68-28t68 28l294 294 294-294q28-28 68-28t68 28l136 136q28 28 28 68t-28 68l-294 294 294 294q28 28 28 68z"/>
            </svg>
        </a>
        <div class="modal__message__content">

        </div>
    </div>
</div>
