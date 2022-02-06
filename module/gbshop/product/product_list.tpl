<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
<form id="frm__products" action="" method="get">
    <input type="hidden" name="categorycode" value="<?php echo $categorycode_getparam?>">
    <input type="hidden" name="page" value="<?php echo $page?>">
    <section id="product__list" class="product__list container">
        <div class="breadbrum">
            <ol class="list-unstyled d-flex mb-0">
                <li>
                    <a class="breadbrum__active" href="<?php echo HTTP_SERVER ?>">Trang chủ</a>
                </li>
                <li>
                    <a href="<?php echo HTTP_SERVER ?>san-pham.html" class=""> Sản Phẩm </a>
                </li>
                <?php echo $category_breadcrumb_html ?>
            </ol>
            <!--
            <div class="breadcrumb__content">
                <a class="breadbrum__active" href="<?php echo HTTP_SERVER ?>">Trang chủ</a>
                <span>/</span>
                <a href="<?php echo HTTP_SERVER ?>san-pham.html" class=""> Sản Phẩm</a>

                <?php echo $category_breadcrumb_html ?>
            </div>
            -->
        </div>
        <div class="categorypage__row row">
            <?php if($device == 'desktop') { ?>
            <div class="col-12 col-lg-3 categorypage__col" id="myTopnav">
                <div class="col__inner">
                    <div class="widget">

                        <p class="widget__title">Danh mục</p>

                        <ul class="product__categories">
                            <?php echo $category_html ?>
                        </ul>

                    </div>
                    <div class="widget">
                        <p class="widget__title">Thương hiệu</p>

                        <div class="pwbfilter__products scrollbar-success">
                            <ul class="force-overflow">
                                <?php if(!empty($manufacturers)) { ?>
                                <?php foreach($manufacturers as $manufacturer) { ?>
                                <li>
                                    <label>
                                        <input name="manufacturercodes[]"
                                               type="checkbox" <?php echo in_array($manufacturer['manufacturercode'], $manufacturercodes_getparam)? 'checked' : ''?>
                                        value="<?php echo $manufacturer['manufacturercode']?>"
                                        hidden><?php echo $manufacturer['name']?>
                                        <span class="checkmark"></span>
                                    </label>
                                </li>
                                <?php } ?>
                                <?php } ?>
                            </ul>


                        </div>
                    </div>

                    <div class="widget">
                        <p class="widget__title">Khoảng Giá</p>

                        <div class="middle">
                            <div class="multi-range-slider">
                                <input oninput="document.getElementById('min__price').innerText = numberWithCommas(this.value.toString()).replace(',', '.');"
                                       type="range" id="input-left" min="<?php echo $productListData['pricemin']?>"
                                       max="<?php echo $productListData['pricemax']?>" name="pricemin"
                                       value="<?php echo empty(@$_GET['pricemin']) ? $productListData['pricemin'] : $_GET['pricemin'] ?>">
                                <input oninput="document.getElementById('max__price').innerText = numberWithCommas(this.value.toString()).replace(',', '.');"
                                       type="range" id="input-right" min="<?php echo $productListData['pricemin']?>"
                                       max="<?php echo $productListData['pricemax']?>" name="pricemax"
                                       value="<?php echo empty(@$_GET['pricemax']) ? $productListData['pricemax'] : $_GET['pricemax'] ?>">

                                <div class="slider">
                                    <div class="track"></div>
                                    <div class="range"></div>
                                    <div class="thumb left"></div>
                                    <div class="thumb right"></div>
                                </div>
                            </div>
                        </div>
                        <span id="min__price"
                              class="min__price"><?php echo empty(@$_GET['pricemin']) ? $productStartPrice : number_format($_GET['pricemin'], 0, '.', '.') ?></span>
                        -
                        <span id="max__price"
                              class="max__price"><?php echo empty(@$_GET['pricemax']) ? $productEndPrice : number_format($_GET['pricemax'], 0, '.', '.') ?></span><span
                                class="min__price"><?php echo $productListData['currency'] ?></span>

                        <!--<span id="min__price"
                        class="min__price"><?php echo empty(@$_GET['manufacturercodes']) && empty(@$_GET['pricemin']) ? $productMinPrice : number_format($_GET['pricemin'], 0, '.', '.') ?></span>
                        -
                        <span id="max__price"
                              class="max__price"><?php echo empty(@$_GET['manufacturercodes']) && empty(@$_GET['pricemax']) ? $productMaxPrice : number_format($_GET['pricemax'], 0, '.', '.') ?></span><span
                                class="min__price"><?php echo $productListData['currency'] ?></span>-->


                    </div>
                    <div class="widget__button">
                        <button id="widget__submit__button" type="submit">ÁP DỤNG</button>
                        <a href="<?php echo HTTP_SERVER ?>san-pham.html">BỎ LỌC</a>
                    </div>
                </div>
            </div>
            <?php } ?>

            <div class="productlist__col col-12 col-xl-9">

                <div class="productlist__filter">

                    <div class="title">
                        <?php echo !empty($productlist_categoryname) ? $productlist_categoryname : 'Sản phẩm' ?>

                    </div>

                    <div class="result__right">
                        <div class="number__product">
                            <?php
                                if(!empty($products_count)){
                                    echo $products_count." sản phẩm.";
                                } else {
                                    echo 'Không tìm thấy sản phẩm nào khớp với lựa chọn của bạn.';
                                }
                            ?>
                        </div>
                        <div class="productlist__filter__result justify-content-between">
                            <div class="productlist__rank">
                                <div class="navBarMenu container">
                                    <a id="navBarMenu__icon" href="javascript:void(0);" class="icon" onclick="openFilterProductList()">
                                        <svg width="20" height="20" viewBox="0 0 1792 1792" xmlns="http://www.w3.org/2000/svg">
                                            <path d="M1595 295q17 41-14 70l-493 493v742q0 42-39 59-13 5-25 5-27 0-45-19l-256-256q-19-19-19-45v-486l-493-493q-31-29-14-70 17-39 59-39h1280q42 0 59 39z"/>
                                        </svg>
                                        <span>LỌC</span>
                                    </a>
                                </div>
                            </div>
                            <div class="productlist__rank__select">
                                <select name="orderby" aria-label="Filter Popular">
                                    <option value="priority"
                                    <?php echo @$_GET['orderby'] == 'priority' ? 'selected' : ''?>>Thứ tự theo mức độ
                                    phổ biến</option>
                                    <option value="addeddate"
                                    <?php echo @$_GET['orderby'] == 'addeddate' ? 'selected' : ''?>>Mới nhất</option>
                                    <option value="minprice"
                                    <?php echo @$_GET['orderby'] == 'minprice' ? 'selected' : ''?>>Giá: thấp tới
                                    cao</option>
                                    <option value="maxprice"
                                    <?php echo @$_GET['orderby'] == 'maxprice' ? 'selected' : ''?>>Giá: cao đến
                                    thấp</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="product">
                    <div class="product__container">
                        <div class="product__row row">
                            <?php if(!empty($products)) { ?>
                            <?php foreach($products as $product) { ?>

                            <div class="product__item <?php echo $product['quantity'] <= 0 ? 'product__item__outofstock' : '' ?> col-6 col-lg-4">
                                <div class="product__inner">
                                    <div class="product__image">
                                        <a class="d-inline-block"
                                           href="<?php echo HTTP_SERVER . $product['seourl']?>.html">
                                            <img width="246" height="246" class=""
                                                 alt="<?php echo $productsList['productname']?>"
                                                 srcset="<?php echo IMAGE_SERVER ?>resize-246x246/<?php echo $product['image1'] == '' ? '/assets/img/default.png' . '?v=' . IMAGE_VERSION : $product['image1'] . '?v=' . IMAGE_VERSION?> 1.25x,
                                             <?php echo IMAGE_SERVER ?>resize-246x246/<?php echo $product['image1'] == '' ? '/assets/img/default.png' . '?v=' . IMAGE_VERSION : $product['image1'] . '?v=' . IMAGE_VERSION?> 2x"
                                                 src="<?php echo IMAGE_SERVER ?>resize-246x246/<?php echo $product['image1'] == '' ? '/assets/img/default.png' . '?v=' . IMAGE_VERSION : $product['image1'] . '?v=' . IMAGE_VERSION?>">
                                        </a>
                                    </div>

                                    <?php if($product["baseprice"] !== $product["sellingprice"]) { ?>
                                    <div class="product__sale">
                                        <p>-<?php echo $product["discount"]?>%</p>
                                    </div>
                                    <?php } ?>

                                    <div class="product__addcart">
                                        <?php if($product['quantity'] > 0) { ?>
                                        <a style="cursor: pointer;" class="product__addtocart"
                                           data-productsku="<?php echo $product['sku'] ?>"
                                           data-cartcode="<?php echo $_SESSION['cartcode'] ?>" data-quantity="1"
                                                data-quantityinstock="<?php echo $product['quantity']?>">
                                            <svg fill="white" xmlns="http://www.w3.org/2000/svg"
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
                                        <a href="<?php echo HTTP_SERVER . $product['seourl']?>.html"
                                           class="product__viewdetail">
                                            <svg fill="white" viewBox="0 0 1792 1792"
                                                 xmlns="http://www.w3.org/2000/svg">
                                                <path d="M1216 832q0-185-131.5-316.5t-316.5-131.5-316.5 131.5-131.5 316.5 131.5 316.5 316.5 131.5 316.5-131.5 131.5-316.5zm512 832q0 52-38 90t-90 38q-54 0-90-38l-343-342q-179 124-399 124-143 0-273.5-55.5t-225-150-150-225-55.5-273.5 55.5-273.5 150-225 225-150 273.5-55.5 273.5 55.5 225 150 150 225 55.5 273.5q0 220-124 399l343 343q37 37 37 90z"/>
                                            </svg>
                                            XEM CHI TIẾT</a>
                                    </div>
                                    <div class="product__description">
                                        <a href="<?php echo HTTP_SERVER . $product['categoryseourl'] . '.html' ?>"
                                           class="product__category"><?php echo $product['categoryname'] ?></a>

                                        <a href="<?php echo HTTP_SERVER . $product['seourl']?>.html"
                                           style="<?php if($product['baseprice'] != $product['sellingprice']) echo 'margin-bottom: 0' ?>"
                                           class="product__name"><?php echo $product['productname']?></a>


                                        <p class="product__price--old">
                                            <?php if($product["baseprice"] !== $product["sellingprice"]) { ?>
                                            <?php echo number_format($product["baseprice"], 0, ',', '.'); echo $productListData['currency'] ?>
                                            <?php } ?>
                                        </p>

                                        <p class="product__price"><?php echo number_format(intval($product['sellingprice']),'0','.','.');echo $productListData['currency'] ?></p><span>/<?php echo $product['unitname'] ?></span>
                                    </div>

                                    <div class="product__item__advancebutton--mobile">
                                        <?php if($product['quantity'] > 0 ) { ?>
                                        <a style="cursor: pointer;" class="product__addtocart"
                                           data-productsku="<?php echo $product['sku'] ?>"
                                           data-cartcode="<?php echo $_SESSION['cartcode'] ?>" data-quantity="1"
                                                data-quantityinstock="<?php echo $product['quantity']?>">
                                            <svg fill="white" xmlns="http://www.w3.org/2000/svg"
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
                                            THÊM VÀO GIỎ
                                        </a>
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
                                        <a href="<?php echo HTTP_SERVER . $product['seourl']?>.html"
                                           class="product__viewdetail">
                                            <svg fill="white" viewBox="0 0 1792 1792"
                                                 xmlns="http://www.w3.org/2000/svg">
                                                <path d="M1216 832q0-185-131.5-316.5t-316.5-131.5-316.5 131.5-131.5 316.5 131.5 316.5 316.5 131.5 316.5-131.5 131.5-316.5zm512 832q0 52-38 90t-90 38q-54 0-90-38l-343-342q-179 124-399 124-143 0-273.5-55.5t-225-150-150-225-55.5-273.5 55.5-273.5 150-225 225-150 273.5-55.5 273.5 55.5 225 150 150 225 55.5 273.5q0 220-124 399l343 343q37 37 37 90z"/>
                                            </svg>
                                            XEM CHI TIẾT
                                        </a>
                                        <?php } ?>
                                    </div>
                                </div>
                            </div>
                            <?php } ?>
                            <?php } ?>

                        </div>
                    </div>
                    <div class="pagination__inner row">
                        <div class="col-md-12 pagi-area text-center">
                            <ul class="pagination mb-0">
                                <?php echo $pagination?>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
    </section>
    <?php if($device != 'desktop') { ?>
    <!-- The overlay -->
    <div id="productlist__filter__mobile" class="header__overlay">
        <!-- Overlay content -->
        <div class="header__overlay__content">
            <div class="col__inner">
                <div class="widget">

                    <p class="widget__title">Danh mục</p>

                    <ul class="product__categories">
                        <?php echo $category_html ?>
                    </ul>

                </div>
                <div class="widget">
                    <p class="widget__title">Thương hiệu</p>


                    <div class="pwbfilter__products scrollbar-success">

                        <ul class="force-overflow">
                            <?php if(!empty($manufacturers)) { ?>
                            <?php foreach($manufacturers as $manufacturer) { ?>
                            <li>
                                <label>
                                    <input name="manufacturercodes[]"
                                           type="checkbox" <?php echo in_array($manufacturer['manufacturercode'], $manufacturercodes_getparam)? 'checked' : ''?>
                                    value="<?php echo $manufacturer['manufacturercode']?>"
                                    hidden><?php echo $manufacturer['name']?>
                                    <span class="checkmark"></span>
                                </label>
                            </li>
                            <?php } ?>
                            <?php } ?>
                        </ul>


                    </div>
                </div>

                <div class="widget">
                    <p class="widget__title">Khoảng Giá</p>

                    <div class="middle">
                        <div class="multi-range-slider">
                            <input oninput="document.getElementById('min__price').innerText = numberWithCommas(this.value.toString()).replace(',', '.');"
                                   type="range" id="input-left" min="<?php echo $productListData['pricemin']?>"
                                   max="<?php echo $productListData['pricemax']?>" name="pricemin"
                                   value="<?php echo empty(@$_GET['pricemin']) ? $productListData['pricemin'] : $_GET['pricemin'] ?>">
                            <input oninput="document.getElementById('max__price').innerText = numberWithCommas(this.value.toString()).replace(',', '.');"
                                   type="range" id="input-right" min="<?php echo $productListData['pricemin']?>"
                                   max="<?php echo $productListData['pricemax']?>" name="pricemax"
                                   value="<?php echo empty(@$_GET['pricemax']) ? $productListData['pricemax'] : $_GET['pricemax'] ?>">

                            <div class="slider">
                                <div class="track"></div>
                                <div class="range"></div>
                                <div class="thumb left"></div>
                                <div class="thumb right"></div>
                            </div>
                        </div>
                    </div>
                    <br>
                    <span id="min__price"
                          class="min__price"><?php echo empty(@$_GET['pricemin']) ? $productStartPrice : number_format($_GET['pricemin'], 0, '.', '.') ?></span>
                    -
                        <span id="max__price"
                              class="max__price"><?php echo empty(@$_GET['pricemax']) ? $productEndPrice : number_format($_GET['pricemax'], 0, '.', '.') ?></span><span
                            class="min__price"><?php echo $productListData['currency'] ?></span>



                </div>
                <div class="widget__button">
                    <button id="widget__submit__button" type="submit">LỌC</button>
                    <a href="<?php echo HTTP_SERVER ?>san-pham.html">BỎ LỌC</a>
                </div>
            </div>
        </div>

    </div>
    <?php } ?>
</form>

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
<script>
    var cartcode = "<?php echo $_SESSION['cartcode'] ?>";
</script>