<div id="productDetail" class="productDetail">
    <ol class="list-unstyled d-flex mb-0 container">
        <li>
            <a class="breadbrum__active" href="<?php echo HTTP_SERVER ?>">Trang chủ</a>
        </li>
        <li>
            <a href="<?php echo HTTP_SERVER ?>san-pham.html" class=""> Sản Phẩm </a>
        </li>
        <?php echo $category_breadcrumb_html ?>
        <li><a href="<?php echo HTTP_SERVER . $product['seourl']?>.html"
               class="breadbrum__noactive"><?php echo $mainProduct["productname"] ?> </a></li>
    </ol>
    <!--
    <div class="productDetail_path container">
        <a class="breadbrum__active" href="<?php echo HTTP_SERVER ?>">Trang chủ</a>
        <span>/</span>
        <a href="<?php echo HTTP_SERVER ?>san-pham.html" class="breadbrum__active"> Sản phẩm</a>
        <span>/</span>
        <a href="<?php echo HTTP_SERVER . $categorys[0]['seourl'] . '.html' ?>"
           class="breadbrum__active"> <?php echo $categorys[0]['name']?></a>
        <span>/</span>
        <a href="<?php echo HTTP_SERVER . $product['seourl']?>.html"
           class="breadbrum__noactive"><?php echo $mainProduct["productname"] ?> </a>

    </div>
    -->
    <div class="productDetail__container container pb-xl-4">
        <div class="productDetail__inner">
            <div class="productDetail__row row">
                <div class="col-md-6">
                    <div class="productDetail__illustration">
                        <div class="pd__illustration__thumbnail position-relative">
                            <img id="pd__illustration__thumbnail__image" width="100%" height="540"
                                 alt="<?php echo $mainProduct['productname']; ?>"
                                 srcset="<?php echo IMAGE_SERVER . 'resize-1080x1080/' . $productImages[0] ?> 1.25x, <?php echo IMAGE_SERVER . 'resize-1080x1080/' . $productImages[0] ?> 2x"
                                 src="<?php echo IMAGE_SERVER . 'resize-540x540/' . $productImages[0] ?>"
                                 data-zoom-image="<?php echo IMAGE_SERVER . $productZoomImages[0] . '?v=' . IMAGE_VERSION ?>">
                            <?php if($mainProduct["baseprice"] !== $mainProduct["sellingprice"] ) { ?>
                            <div class="pd__illustration__thumbnail__sale">
                                <p>-<?php echo $mainProduct["discount"]?>%</p>
                            </div>
                            <?php } ?>
                        </div>

                        <div id="pd__illustration__review__images" class="pd__illustration__review__images">
                            <?php if (!empty($productImages)) { ?>
                            <?php foreach ($productImages as $index => $image) { ?>
                            <a onclick="gallery(this)"
                               title="<?php echo $mainProduct['productname']; ?>"
                               data-image="<?php echo IMAGE_SERVER . 'resize-540x540/' . $image ?>"
                               data-zoom-image="<?php echo IMAGE_SERVER . $productZoomImages[$index] ?>"
                               class="elevatezoom-gallery">
                                <img width="114" height="114" class="" alt="<?php echo $mainProduct['productname']; ?>"
                                     srcset="<?php echo IMAGE_SERVER . 'resize-114x114/' . $image ?> 1.25x, <?php echo IMAGE_SERVER . 'resize-114x114/' . $image ?> 2x"
                                     src="<?php echo IMAGE_SERVER . 'resize-114x114/' . $image ?>">
                            </a>
                            <?php } ?>
                            <?php } ?>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="productDetail__description">
                        <div>Thương hiệu: <span><a href="<?=HTTP_SERVER?>san-pham.html?manufacturercodes%5B%5D=<?=$mainProduct['manufacturercode']?>"
                                                   class="maincolor"><?php echo $mainProduct["manufacturername"] ?> </a></span>
                        </div>
                        <div class="pd__description__title">
                            <?php echo $mainProduct["productname"] ?>
                        </div>
                        <div class="pd__description__price">
                            <?php if($mainProduct["baseprice"] != $mainProduct["sellingprice"]) { ?>
                        <span class="pd__description__price__old mb-2"><?php echo number_format($mainProduct["baseprice"], 0, ',', '.'); echo $productData["data"]["currency"] ?>
                            </span><?php } ?>
                            <span class="pd__description__price__current"><?php echo number_format($mainProduct["sellingprice"], 0, ',', '.'); echo $productData["data"]["currency"] ?></span><span
                                    class="pd__description__price__unit">/<?php echo $mainProduct["unitname"] ?></span>
                        </div>
                        <?php if($mainProduct["summary"]){ ?>
                        <div class="pd__description__summary">
                            <?php echo htmlspecialchars_decode($mainProduct["summary"]); ?>
                        </div>
                        <?php } ?>
                        <?php if($mainProduct["quantity"] > 0 && $mainProduct["quantity"] < 100) { ?>
                        <div class="pd__description__number__input">
                            <div class="pd__number__input">
                                <input type="button" value="-" class="button-minus" data-field="quantity">
                                <input type="number" step="1" max="" value="1" name="quantity" class="quantity-field">
                                <input type="button" value="+" class="button-plus" data-field="quantity">
                            </div>
                            <span class="pd__description__quantity"><?php echo $mainProduct["quantity"] ?></span>&nbsp;<span>sản phẩm có sẵn</span>
                        </div>
                        <?php } else if($mainProduct["quantity"] > 99) { ?>

                        <div class="pd__description__number__input">
                            <div class="pd__number__input">
                                <input type="button" value="-" class="button-minus" data-field="quantity">
                                <input type="number" step="1" max="" value="1" name="quantity" class="quantity-field">
                                <input type="button" value="+" class="button-plus" data-field="quantity">
                            </div>
                            <span class="pd__description__quantity"><span style="opacity:0;"><?php echo $mainProduct["quantity"]?></span>Sản phẩm luôn có sẵn</span>
                        </div>
                        <?php } else { ?>
                        <div class="pd__description__outofstock">
                            Xin lỗi, sản phẩm tạm thời hết hàng
                        </div>
                        <?php } ?>

                        <!--Sản phẩm có nhiều size, nhiều color:: size hay color được quy ước là option-->
                        <?php if($productOptions){ ?>
                        <?php $index = 0;?>
                        <div class="pd__description__options">
                            <?php foreach($productOptions as $key=>$productOption){ ?>
                            <div class="pd__description__option">
                                <label><?php echo $productOption["name"] ?>: </label> <span
                                        class="option__value"></span><br>
                                <?php foreach($productOption["data"] as $productOptionValue){ ?>
                                <?php if(empty($imageOptionDetail[$key.'|'.$productOptionValue])){ ?>
                                <button class="option__<?php echo $index; ?>__btn"
                                        data-optionname="<?php echo $productOption['name'] ?>"
                                        data-optionvalue="<?php echo $productOptionValue ?>"><?php echo $productOptionValue; ?></button>
                                <?php } else { ?>
                                <button onmouseover="change_lable_option(this)"
                                        class="option__<?php echo $index; ?>__btn"
                                        data-optionname="<?php echo $productOption['name'] ?>"
                                        data-optionvalue="<?php echo $productOptionValue ?>">
                                    <img width="auto" height="auto" alt=""
                                         srcset="<?php echo IMAGE_SERVER.'fixsize-36x36/'.$imageOptionDetail[$key.'|'.$productOptionValue] . '?v=' . IMAGE_VERSION ?> 1.25x, <?php echo IMAGE_SERVER.'fixsize-36x36/'.$imageOptionDetail[$key.'|'.$productOptionValue] . '?v=' . IMAGE_VERSION ?> 2x"
                                         src="<?php echo IMAGE_SERVER.'fixsize-36x36/'.$imageOptionDetail[$key.'|'.$productOptionValue] . '?v=' . IMAGE_VERSION ?>">
                                </button>
                                <?php } ?>
                                <?php } ?>
                            </div>
                            <?php $index++; } ?>
                        </div>
                        <?php } ?>

                        <p class="pd__description__purchase__error"></p>

                        <?php if($mainProduct["quantity"] > 0) { ?>
                        <div class="pd__description__purchase">
                            <a href="javascript:void(0)" class="purchase__shopping__cart"
                               data-productsku="<?php echo $productData['data']['productmain']['sku'] ?>"
                               data-cartcode="<?php echo @$_SESSION['cartcode']?>">
                                <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg"
                                     xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="30px"
                                     height="30px" viewBox="0 0 30 30" enable-background="new 0 0 30 30"
                                     xml:space="preserve">
<g>
    <path fill-rule="evenodd" clip-rule="evenodd" fill="#FFFFFF" d="M11.199,21.362c0.187,1.737-0.414,2.822-1.719,3.149
		c-1.091,0.272-2.189-0.209-2.705-1.185c-0.528-1.001-0.37-2.2,0.539-2.883c0.567-0.426,0.604-0.82,0.47-1.443
		C6.87,14.776,5.992,10.542,5.101,6.313c-0.033-0.157-0.092-0.31-0.158-0.529c-0.69,0-1.38-0.001-2.07,0
		c-0.528,0-0.941-0.181-0.929-0.777c0.011-0.555,0.423-0.732,0.911-0.74c0.788-0.011,1.577,0.015,2.365-0.01
		c0.723-0.023,1.135,0.261,1.22,1.009c0.039,0.337,0.158,0.663,0.248,1.028c1.823,0,3.605,0,5.388,0c4.915,0,9.83,0,14.744,0
		c1.163,0.001,1.412,0.309,1.134,1.426c-0.74,2.982-1.487,5.962-2.231,8.943c-0.212,0.853-0.405,1.006-1.303,1.006
		c-4.823,0.002-9.646,0.001-14.468,0.001c-0.274,0-0.55,0-0.889,0c0.146,0.721,0.278,1.371,0.432,2.125c0.258,0,0.527,0,0.795,0
		c4.383,0,8.764-0.006,13.146,0.003c1.757,0.004,2.952,1.448,2.53,3.019c-0.294,1.093-1.448,1.909-2.512,1.777
		c-1.31-0.162-2.213-1.163-2.191-2.436c0.004-0.252,0.042-0.503,0.068-0.795C17.97,21.362,14.617,21.362,11.199,21.362z
		 M15.181,9.56c0.999,0,1.937,0,2.947,0c0.037-0.576,0.071-1.117,0.107-1.689c-1.11,0-2.137,0-3.211,0
		C15.078,8.448,15.126,8.974,15.181,9.56z M9.735,9.542c-0.1-0.575-0.196-1.128-0.289-1.661c-0.835,0-1.604,0-2.454,0
		C7.13,8.5,7.251,9.046,7.375,9.598c0.734,0,1.379,0.001,2.024-0.002C9.487,9.595,9.576,9.568,9.735,9.542z M23.62,9.599
		c0.671,0,1.292,0.016,1.911-0.01c0.15-0.007,0.389-0.122,0.426-0.238c0.15-0.473,0.238-0.966,0.367-1.527c-0.388,0-0.685,0-0.983,0
		C23.685,7.822,23.685,7.822,23.62,9.599z M11.291,9.561c0.813,0,1.541,0,2.347,0c-0.059-0.587-0.114-1.128-0.172-1.702
		c-0.812,0-1.587,0-2.43,0C11.123,8.436,11.203,8.974,11.291,9.561z M21.982,9.573c0.096-0.569,0.189-1.122,0.294-1.747
		c-0.781,0-1.468-0.017-2.155,0.015c-0.124,0.005-0.333,0.194-0.342,0.312c-0.04,0.467-0.017,0.94-0.017,1.42
		C20.507,9.573,21.217,9.573,21.982,9.573z M17.961,11.186c-0.96,0-1.8,0-2.675,0c0.066,0.579,0.125,1.096,0.184,1.616
		c0.809,0,1.565,0,2.391,0C17.894,12.255,17.927,11.736,17.961,11.186z M8.386,14.382c0.095,0.514,0.157,0.971,0.276,1.413
		c0.037,0.136,0.223,0.32,0.35,0.328c0.591,0.034,1.184,0.015,1.835,0.015c-0.121-0.651-0.224-1.205-0.327-1.756
		C9.793,14.382,9.148,14.382,8.386,14.382z M9.997,11.178c-0.812,0-1.535,0-2.29,0c0.084,0.46,0.129,0.875,0.245,1.268
		c0.045,0.153,0.243,0.362,0.383,0.371c0.636,0.04,1.276,0.018,1.96,0.018C10.186,12.229,10.093,11.712,9.997,11.178z
		 M25.506,11.129c-0.46,0-0.804,0-1.146,0c-0.359,0-0.718,0-1.084,0c-0.089,0.621-0.163,1.133-0.245,1.705
		c0.629,0,1.18,0.017,1.727-0.013c0.141-0.007,0.353-0.14,0.392-0.26C25.294,12.129,25.376,11.678,25.506,11.129z M15.551,14.405
		c0.071,0.618,0.133,1.156,0.193,1.686c2.134,0.092,1.881,0.328,1.902-1.586c0-0.019-0.02-0.038-0.053-0.099
		C16.96,14.405,16.304,14.405,15.551,14.405z M19.437,12.834c0.58,0,1.111,0.024,1.636-0.016c0.154-0.011,0.388-0.178,0.425-0.316
		c0.112-0.417,0.144-0.857,0.215-1.337c-0.249-0.014-0.451-0.033-0.654-0.035C19.479,11.114,19.479,11.114,19.437,12.834z
		 M13.744,11.165c-0.768,0-1.455,0-2.176,0c0.099,0.575,0.19,1.108,0.279,1.635c0.71,0,1.35,0,2.062,0
		C13.853,12.241,13.8,11.724,13.744,11.165z M12.094,14.364c0.115,0.651,0.208,1.188,0.305,1.73c0.608,0,1.173,0,1.791,0
		c-0.063-0.593-0.121-1.134-0.185-1.73c-0.269,0-0.496,0-0.722,0C12.917,14.364,12.551,14.364,12.094,14.364z M22.556,16.059
		c1.613,0.314,2.145-0.122,2.006-1.641C22.738,14.198,22.468,14.418,22.556,16.059z M21.156,14.448
		c-1.87-0.311-2.25,0.037-1.901,1.693c0.406,0,0.821,0.027,1.229-0.013c0.165-0.016,0.42-0.152,0.453-0.28
		C21.053,15.39,21.089,14.914,21.156,14.448z M9.733,22.265c0.003-0.534-0.417-0.98-0.876-0.93
		c-0.491,0.054-0.811,0.319-0.822,0.856c-0.011,0.5,0.384,0.921,0.866,0.875C9.397,23.019,9.704,22.74,9.733,22.265z M24.485,22.02
		c-0.028-0.379-0.343-0.648-0.838-0.685c-0.475-0.035-0.876,0.404-0.851,0.897c0.027,0.53,0.351,0.8,0.846,0.833
		C24.133,23.098,24.506,22.675,24.485,22.02z"></path>
</g>
</svg>
                                &nbsp;
                                THÊM VÀO GIỎ
                            </a>
                            <a href="javascript:void(0)" class="purchase__buy__now">MUA NGAY</a>
                        </div>
                        <?php } else { ?>
                        <!--
                        <div class="pd__description__purchase">
                            <a class="purchase__btn__disable" style="cursor: pointer">
                                <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg"
                                     xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="30px"
                                     height="30px" viewBox="0 0 30 30" enable-background="new 0 0 30 30"
                                     xml:space="preserve">
<g>
    <path fill-rule="evenodd" clip-rule="evenodd" fill="#FFFFFF" d="M11.199,21.362c0.187,1.737-0.414,2.822-1.719,3.149
		c-1.091,0.272-2.189-0.209-2.705-1.185c-0.528-1.001-0.37-2.2,0.539-2.883c0.567-0.426,0.604-0.82,0.47-1.443
		C6.87,14.776,5.992,10.542,5.101,6.313c-0.033-0.157-0.092-0.31-0.158-0.529c-0.69,0-1.38-0.001-2.07,0
		c-0.528,0-0.941-0.181-0.929-0.777c0.011-0.555,0.423-0.732,0.911-0.74c0.788-0.011,1.577,0.015,2.365-0.01
		c0.723-0.023,1.135,0.261,1.22,1.009c0.039,0.337,0.158,0.663,0.248,1.028c1.823,0,3.605,0,5.388,0c4.915,0,9.83,0,14.744,0
		c1.163,0.001,1.412,0.309,1.134,1.426c-0.74,2.982-1.487,5.962-2.231,8.943c-0.212,0.853-0.405,1.006-1.303,1.006
		c-4.823,0.002-9.646,0.001-14.468,0.001c-0.274,0-0.55,0-0.889,0c0.146,0.721,0.278,1.371,0.432,2.125c0.258,0,0.527,0,0.795,0
		c4.383,0,8.764-0.006,13.146,0.003c1.757,0.004,2.952,1.448,2.53,3.019c-0.294,1.093-1.448,1.909-2.512,1.777
		c-1.31-0.162-2.213-1.163-2.191-2.436c0.004-0.252,0.042-0.503,0.068-0.795C17.97,21.362,14.617,21.362,11.199,21.362z
		 M15.181,9.56c0.999,0,1.937,0,2.947,0c0.037-0.576,0.071-1.117,0.107-1.689c-1.11,0-2.137,0-3.211,0
		C15.078,8.448,15.126,8.974,15.181,9.56z M9.735,9.542c-0.1-0.575-0.196-1.128-0.289-1.661c-0.835,0-1.604,0-2.454,0
		C7.13,8.5,7.251,9.046,7.375,9.598c0.734,0,1.379,0.001,2.024-0.002C9.487,9.595,9.576,9.568,9.735,9.542z M23.62,9.599
		c0.671,0,1.292,0.016,1.911-0.01c0.15-0.007,0.389-0.122,0.426-0.238c0.15-0.473,0.238-0.966,0.367-1.527c-0.388,0-0.685,0-0.983,0
		C23.685,7.822,23.685,7.822,23.62,9.599z M11.291,9.561c0.813,0,1.541,0,2.347,0c-0.059-0.587-0.114-1.128-0.172-1.702
		c-0.812,0-1.587,0-2.43,0C11.123,8.436,11.203,8.974,11.291,9.561z M21.982,9.573c0.096-0.569,0.189-1.122,0.294-1.747
		c-0.781,0-1.468-0.017-2.155,0.015c-0.124,0.005-0.333,0.194-0.342,0.312c-0.04,0.467-0.017,0.94-0.017,1.42
		C20.507,9.573,21.217,9.573,21.982,9.573z M17.961,11.186c-0.96,0-1.8,0-2.675,0c0.066,0.579,0.125,1.096,0.184,1.616
		c0.809,0,1.565,0,2.391,0C17.894,12.255,17.927,11.736,17.961,11.186z M8.386,14.382c0.095,0.514,0.157,0.971,0.276,1.413
		c0.037,0.136,0.223,0.32,0.35,0.328c0.591,0.034,1.184,0.015,1.835,0.015c-0.121-0.651-0.224-1.205-0.327-1.756
		C9.793,14.382,9.148,14.382,8.386,14.382z M9.997,11.178c-0.812,0-1.535,0-2.29,0c0.084,0.46,0.129,0.875,0.245,1.268
		c0.045,0.153,0.243,0.362,0.383,0.371c0.636,0.04,1.276,0.018,1.96,0.018C10.186,12.229,10.093,11.712,9.997,11.178z
		 M25.506,11.129c-0.46,0-0.804,0-1.146,0c-0.359,0-0.718,0-1.084,0c-0.089,0.621-0.163,1.133-0.245,1.705
		c0.629,0,1.18,0.017,1.727-0.013c0.141-0.007,0.353-0.14,0.392-0.26C25.294,12.129,25.376,11.678,25.506,11.129z M15.551,14.405
		c0.071,0.618,0.133,1.156,0.193,1.686c2.134,0.092,1.881,0.328,1.902-1.586c0-0.019-0.02-0.038-0.053-0.099
		C16.96,14.405,16.304,14.405,15.551,14.405z M19.437,12.834c0.58,0,1.111,0.024,1.636-0.016c0.154-0.011,0.388-0.178,0.425-0.316
		c0.112-0.417,0.144-0.857,0.215-1.337c-0.249-0.014-0.451-0.033-0.654-0.035C19.479,11.114,19.479,11.114,19.437,12.834z
		 M13.744,11.165c-0.768,0-1.455,0-2.176,0c0.099,0.575,0.19,1.108,0.279,1.635c0.71,0,1.35,0,2.062,0
		C13.853,12.241,13.8,11.724,13.744,11.165z M12.094,14.364c0.115,0.651,0.208,1.188,0.305,1.73c0.608,0,1.173,0,1.791,0
		c-0.063-0.593-0.121-1.134-0.185-1.73c-0.269,0-0.496,0-0.722,0C12.917,14.364,12.551,14.364,12.094,14.364z M22.556,16.059
		c1.613,0.314,2.145-0.122,2.006-1.641C22.738,14.198,22.468,14.418,22.556,16.059z M21.156,14.448
		c-1.87-0.311-2.25,0.037-1.901,1.693c0.406,0,0.821,0.027,1.229-0.013c0.165-0.016,0.42-0.152,0.453-0.28
		C21.053,15.39,21.089,14.914,21.156,14.448z M9.733,22.265c0.003-0.534-0.417-0.98-0.876-0.93
		c-0.491,0.054-0.811,0.319-0.822,0.856c-0.011,0.5,0.384,0.921,0.866,0.875C9.397,23.019,9.704,22.74,9.733,22.265z M24.485,22.02
		c-0.028-0.379-0.343-0.648-0.838-0.685c-0.475-0.035-0.876,0.404-0.851,0.897c0.027,0.53,0.351,0.8,0.846,0.833
		C24.133,23.098,24.506,22.675,24.485,22.02z"></path>
</g>
</svg> &nbsp;
                                THÊM VÀO GIỎ</a>
                            <a class="purchase__btn__disable" style="cursor: pointer">MUA NGAY</a>
                        </div>
                        -->
                        <?php } ?>
                        <div class="pd__description__outline">
                            <table>
                                <tr>
                                    <td>Danh mục:</td>
                                    <?php foreach($categorys as $category){ ?>
                                    <td class="maincolor">
                                        <a href="<?php echo HTTP_SERVER . $category['seourl'] . '.html';?>"
                                           class="maincolor"><?php echo $category['name'] ?></a>
                                    </td>
                                    <?php } ?>
                                </tr>
                                <tr>
                                    <td>SKU:</td>
                                    <td class="pd__description__sku"><?php echo $mainProduct["sku"] ?></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="productDetail__information">
                <div class="productDetail__information__tab">
                    <div id="pd__information__tab__detail" class="nav__item active"
                         onclick="show_collapse('pd__manufacturer','pd__detail','pd__information__tab__manufacturer','pd__information__tab__detail')">
                        THÔNG TIN CHI TIẾT
                    </div>
                    <div id="pd__information__tab__manufacturer" class="nav__item"
                         onclick="show_collapse('pd__detail','pd__manufacturer','pd__information__tab__detail','pd__information__tab__manufacturer')">
                        THƯƠNG HIỆU
                    </div>
                </div>
                <div id="pd__detail" class="productDetail__information__detail product__description__tab">
                    <div class="product__description__tab__content active">
                        <?php echo htmlspecialchars_decode($mainProduct["description"]) ?>
                    </div>

                    <!--  ^^^^^^  stripslashes -->
                </div>
                <div id="pd__manufacturer"
                     class="productDetail__information__manufacturer product__description__tab active"
                     style="display: none">
                    <div class="product__description__tab__content active">
                        <?php echo htmlspecialchars_decode($mainProduct["manufacturerdescription"]) ?>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

<!-- The Modal -->
<div id="productdetail__modal" class="gbmodal productdetail__modal">
    <!-- Modal content -->
    <div class="gbmodal__content">
        <span class="gbclose">&times;</span>

        <div class="productdetail__moreimages row">
            <div class="productdetail__moreimages__leftcol col-7">
                <div class="swiper-container productdetail__imageshow">
                    <div class="swiper-wrapper">
                        <?php if(!empty($productImages)) { ?>
                        <?php foreach($productImages as $imageitem) { ?>

                        <div class="swiper-slide">
                            <img width="600" height="440" class="lazy" alt=""
                                 data-srcset="<?php echo IMAGE_SERVER.'fixsize-1200x880/'.$imageitem . '?v=' . IMAGEVERSION ?> 1.25x, <?php echo IMAGE_SERVER.'fixsize-1200x880/'. $imageitem . '?v=' . IMAGEVERSION ?> 2x"
                                 data-src="<?php echo IMAGE_SERVER.'fixsize-600x440/'.$imageitem . '?v=' . IMAGEVERSION ?>"
                                 src="data:image/svg+xml;utf8,<svg xmlns='http://www.w3.org/2000/svg' width='600' height='440'><rect style='fill:rgba(255,255,255, 0);' width='100%' height='100%' /></svg>">
                        </div>
                        <?php } ?>
                        <?php } ?>
                    </div>
                    <!-- Add Arrows -->
                    <div class="swiper-button-next productdetail__imageshow--btnnext"></div>
                    <div class="swiper-button-prev productdetail__imageshow--btnprev"></div>
                </div>
            </div>
            <div class="productdetail__moreimages__rightcol col-5">
                <div class="swiper-container productdetail__imagegallery">
                    <div class="swiper-wrapper">
                        <?php if(!empty($productImages)) { ?>
                        <?php foreach($productImages as $imageitem) { ?>

                        <div class="swiper-slide">
                            <img width="80" height="80" class="lazy" alt=""
                                 data-srcset="<?php echo IMAGE_SERVER.'fixsize-160x160/'.$imageitem ?> 1.25x, <?php echo IMAGE_SERVER.'fixsize-160x160/'.$imageitem ?> 2x"
                                 data-src="<?php echo IMAGE_SERVER.'fixsize-80x80/'.$imageitem ?>"
                                 src="data:image/svg+xml;utf8,<svg xmlns='http://www.w3.org/2000/svg' width='80' height='80'><rect style='fill:rgba(255,255,255, 0);' width='100%' height='100%' /></svg>">
                        </div>
                        <?php } ?>
                        <?php } ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--MODAL HTML END-->

<div class="product">
    <div class="product__container container">
        <div class="productsection__title">
            <h2>SẢN PHẨM TƯƠNG TỰ</h2>
        </div>
        <div class="product__row row">
            <?php if (!empty($relatedProductsList)) { ?>
            <?php for($i=0;$i < 4;$i++){ ?>
            <!--<div class="product__item col-6 col-lg-3">
                <div class="product__inner">
                    <div class="product__image">
                        <a class="d-inline-block" href="<?php echo HTTP_SERVER . $relatedProductsList[$i]['seourl']?>.html">
                            <img width="246" height="246" class=""
                                 alt="<?php echo $relatedProductsList[$i]['productname']?>"
                                 srcset="<?php echo IMAGE_SERVER ?>fixsize-246x246/<?php echo $relatedProductsList[$i]['image1'] == '' ? '/assets/img/default.png' . '?v=' . IMAGE_VERSION : $relatedProductsList[$i]['image1'] . '?v=' . IMAGE_VERSION?> 1.25x,
                                 <?php echo IMAGE_SERVER ?>fixsize-246x246/<?php echo $relatedProductsList[$i]['image1'] == '' ? '/assets/img/default.png' . '?v=' . IMAGE_VERSION : $relatedProductsList[$i]['image1'] . '?v=' . IMAGE_VERSION?> 2x"
                                 src="<?php echo IMAGE_SERVER ?>fixsize-246x246/<?php echo $relatedProductsList[$i]['image1'] == '' ? '/assets/img/default.png' . '?v=' . IMAGE_VERSION : $relatedProductsList[$i]['image1'] . '?v=' . IMAGE_VERSION?>">
                        </a>
                    </div>

                    <?php if($relatedProductsList[$i]["baseprice"] !== $relatedProductsList[$i]["sellingprice"]) { ?>
                    <div class="product__sale">
                        <p>-<?php echo $relatedProductsList[$i]["discount"]?>%</p>
                    </div>
                    <?php } ?>

                    <div class="product__addcart">
                        <a style="cursor: pointer;" class="product__addtocart"
                           data-productsku="<?php echo $relatedProductsList[$i]['sku'] ?>"
                           data-cartcode="<?php echo $_SESSION['cartcode'] ?>" data-quantity="1">
                            <svg fill="white" xmlns="http://www.w3.org/2000/svg"
                                 xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Capa_1" x="0px"
                                 y="0px" viewBox="0 0 260.293 260.293"
                                 style="enable-background:new 0 0 260.293 260.293;" xml:space="preserve">
<g>
    <path d="M258.727,57.459c-1.42-1.837-3.612-2.913-5.934-2.913H62.004l-8.333-32.055c-0.859-3.306-3.843-5.613-7.259-5.613H7.5   c-4.142,0-7.5,3.358-7.5,7.5c0,4.142,3.358,7.5,7.5,7.5h33.112l8.333,32.055c0,0.001,0,0.001,0.001,0.002l29.381,112.969   c0.859,3.305,3.843,5.612,7.258,5.612h137.822c3.415,0,6.399-2.307,7.258-5.612l29.385-112.971   C260.636,61.687,260.147,59.295,258.727,57.459z M117.877,167.517H91.385l-5.892-22.652h32.384V167.517z M117.877,129.864H81.592   l-5.895-22.667h42.18V129.864z M117.877,92.197H71.795l-5.891-22.651h51.973V92.197z M176.119,167.517h-43.242v-22.652h43.242   V167.517z M176.119,129.864h-43.242v-22.667h43.242V129.864z M176.119,92.197h-43.242V69.546h43.242V92.197z M217.609,167.517   h-26.49v-22.652h32.382L217.609,167.517z M227.403,129.864h-36.284v-22.667h42.18L227.403,129.864z M237.201,92.197h-46.081V69.546   h51.974L237.201,92.197z"/>
    <path d="M105.482,188.62c-15.106,0-27.396,12.29-27.396,27.395c0,15.108,12.29,27.4,27.396,27.4   c15.105,0,27.395-12.292,27.395-27.4C132.877,200.91,120.588,188.62,105.482,188.62z M105.482,228.415   c-6.835,0-12.396-5.563-12.396-12.4c0-6.835,5.561-12.395,12.396-12.395c6.834,0,12.395,5.561,12.395,12.395   C117.877,222.853,112.317,228.415,105.482,228.415z"/>
    <path d="M203.512,188.62c-15.104,0-27.392,12.29-27.392,27.395c0,15.108,12.288,27.4,27.392,27.4   c15.107,0,27.396-12.292,27.396-27.4C230.908,200.91,218.618,188.62,203.512,188.62z M203.512,228.415   c-6.833,0-12.392-5.563-12.392-12.4c0-6.835,5.559-12.395,12.392-12.395c6.836,0,12.396,5.561,12.396,12.395   C215.908,222.853,210.347,228.415,203.512,228.415z"/>
</g>

</svg>
                            THÊM VÀO GIỎ</a>
                        <?php if ($device == "desktop") { ?>
                        <a href="<?php echo HTTP_SERVER . $relatedProductsList[$i]['seourl']?>.html"
                           class="product__viewdetail">
                            <svg fill="white" viewBox="0 0 1792 1792"
                                 xmlns="http://www.w3.org/2000/svg">
                                <path d="M1216 832q0-185-131.5-316.5t-316.5-131.5-316.5 131.5-131.5 316.5 131.5 316.5 316.5 131.5 316.5-131.5 131.5-316.5zm512 832q0 52-38 90t-90 38q-54 0-90-38l-343-342q-179 124-399 124-143 0-273.5-55.5t-225-150-150-225-55.5-273.5 55.5-273.5 150-225 225-150 273.5-55.5 273.5 55.5 225 150 150 225 55.5 273.5q0 220-124 399l343 343q37 37 37 90z"/>
                            </svg>
                            XEM CHI TIẾT</a>
                        <?php } ?>
                    </div>
                    <div class="product__description">
                        <a href="<?php echo HTTP_SERVER . $relatedProductsList[$i]['categoryseourl'] . '.html' ?>"
                           class="product__category"><?php echo $relatedProductsList[$i]['categoryname'] ?></a>

                        <a href="<?php echo HTTP_SERVER . $relatedProductsList[$i]['seourl']?>.html"
                           style="<?php if($relatedProductsList[$i]['baseprice'] != $relatedProductsList[$i]['sellingprice']) echo 'margin-bottom: 0' ?>"
                           class="product__name"><?php echo $relatedProductsList[$i]['productname']?></a>

                        <?php if($relatedProductsList[$i]["baseprice"] !== $relatedProductsList[$i]["sellingprice"]) { ?>
                        <p class="product__price--old"><?php echo number_format($relatedProductsList[$i]["baseprice"], 0, ',', '.') . $relatedProductsData["currency"] ?>
                        </p><?php } ?>

                        <p class="product__price"><?php echo number_format(intval($relatedProductsList[$i]['sellingprice']),'0','.','.') . $relatedProductsData['currency'] . '/' . $relatedProductsList[$i]['unitname'] ?></p>
                    </div>
                    <div class="product__item__advancebutton--mobile">
                        <a style="cursor: pointer;" class="product__addtocart"
                           data-productsku="<?php echo $relatedProductsList[$i]['sku'] ?>"
                           data-cartcode="<?php echo $_SESSION['cartcode'] ?>" data-quantity="1">

                            <svg fill="white" xmlns="http://www.w3.org/2000/svg"
                                 xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Capa_1" x="0px"
                                 y="0px" viewBox="0 0 260.293 260.293"
                                 style="enable-background:new 0 0 260.293 260.293;" xml:space="preserve">
<g>
    <path d="M258.727,57.459c-1.42-1.837-3.612-2.913-5.934-2.913H62.004l-8.333-32.055c-0.859-3.306-3.843-5.613-7.259-5.613H7.5   c-4.142,0-7.5,3.358-7.5,7.5c0,4.142,3.358,7.5,7.5,7.5h33.112l8.333,32.055c0,0.001,0,0.001,0.001,0.002l29.381,112.969   c0.859,3.305,3.843,5.612,7.258,5.612h137.822c3.415,0,6.399-2.307,7.258-5.612l29.385-112.971   C260.636,61.687,260.147,59.295,258.727,57.459z M117.877,167.517H91.385l-5.892-22.652h32.384V167.517z M117.877,129.864H81.592   l-5.895-22.667h42.18V129.864z M117.877,92.197H71.795l-5.891-22.651h51.973V92.197z M176.119,167.517h-43.242v-22.652h43.242   V167.517z M176.119,129.864h-43.242v-22.667h43.242V129.864z M176.119,92.197h-43.242V69.546h43.242V92.197z M217.609,167.517   h-26.49v-22.652h32.382L217.609,167.517z M227.403,129.864h-36.284v-22.667h42.18L227.403,129.864z M237.201,92.197h-46.081V69.546   h51.974L237.201,92.197z"/>
    <path d="M105.482,188.62c-15.106,0-27.396,12.29-27.396,27.395c0,15.108,12.29,27.4,27.396,27.4   c15.105,0,27.395-12.292,27.395-27.4C132.877,200.91,120.588,188.62,105.482,188.62z M105.482,228.415   c-6.835,0-12.396-5.563-12.396-12.4c0-6.835,5.561-12.395,12.396-12.395c6.834,0,12.395,5.561,12.395,12.395   C117.877,222.853,112.317,228.415,105.482,228.415z"/>
    <path d="M203.512,188.62c-15.104,0-27.392,12.29-27.392,27.395c0,15.108,12.288,27.4,27.392,27.4   c15.107,0,27.396-12.292,27.396-27.4C230.908,200.91,218.618,188.62,203.512,188.62z M203.512,228.415   c-6.833,0-12.392-5.563-12.392-12.4c0-6.835,5.559-12.395,12.392-12.395c6.836,0,12.396,5.561,12.396,12.395   C215.908,222.853,210.347,228.415,203.512,228.415z"/>
</g>

</svg>
                            THÊM VÀO GIỎ</a>
                        <?php if ($device == "desktop") { ?>
                        <a href="<?php echo HTTP_SERVER . $relatedProductsList[$i]['seourl']?>.html"
                           class="product__viewdetail">
                            <svg fill="white" viewBox="0 0 1792 1792"
                                 xmlns="http://www.w3.org/2000/svg">
                                <path d="M1216 832q0-185-131.5-316.5t-316.5-131.5-316.5 131.5-131.5 316.5 131.5 316.5 316.5 131.5 316.5-131.5 131.5-316.5zm512 832q0 52-38 90t-90 38q-54 0-90-38l-343-342q-179 124-399 124-143 0-273.5-55.5t-225-150-150-225-55.5-273.5 55.5-273.5 150-225 225-150 273.5-55.5 273.5 55.5 225 150 150 225 55.5 273.5q0 220-124 399l343 343q37 37 37 90z"/>
                            </svg>
                            XEM CHI TIẾT</a>
                        <?php } ?>
                    </div>
                </div>
            </div>-->
            <div class="product__item col-6 col-lg-3">
                <div class="product__inner">
                    <div class="product__image">
                        <a class="d-inline-block"
                           href="<?php echo HTTP_SERVER . $relatedProductsList[$i]['seourl']?>.html">
                            <img width="246" height="246" class=""
                                 alt="<?php echo $relatedProductsList[$i]['productname']?>"
                                 srcset="<?php echo IMAGE_SERVER ?>resize-246x246/<?php echo $relatedProductsList[$i]['image1'] == '' ? '/assets/img/default.png' . '?v=' . IMAGE_VERSION : $relatedProductsList[$i]['image1'] . '?v=' . IMAGE_VERSION?> 1.25x,
                                             <?php echo IMAGE_SERVER ?>resize-246x246/<?php echo $relatedProductsList[$i]['image1'] == '' ? '/assets/img/default.png' . '?v=' . IMAGE_VERSION : $relatedProductsList[$i]['image1'] . '?v=' . IMAGE_VERSION?> 2x"
                                 src="<?php echo IMAGE_SERVER ?>resize-246x246/<?php echo $relatedProductsList[$i]['image1'] == '' ? '/assets/img/default.png' . '?v=' . IMAGE_VERSION : $relatedProductsList[$i]['image1'] . '?v=' . IMAGE_VERSION?>">
                        </a>
                    </div>

                    <?php if($relatedProductsList[$i]["baseprice"] !== $relatedProductsList[$i]["sellingprice"]) { ?>
                    <div class="product__sale">
                        <p>-<?php echo $relatedProductsList[$i]["discount"]?>%</p>
                    </div>
                    <?php } ?>

                    <div class="product__addcart">
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
                        <a href="<?php echo HTTP_SERVER . $relatedProductsList[$i]['seourl']?>.html"
                           class="product__viewdetail">
                            <svg fill="white" viewBox="0 0 1792 1792"
                                 xmlns="http://www.w3.org/2000/svg">
                                <path d="M1216 832q0-185-131.5-316.5t-316.5-131.5-316.5 131.5-131.5 316.5 131.5 316.5 316.5 131.5 316.5-131.5 131.5-316.5zm512 832q0 52-38 90t-90 38q-54 0-90-38l-343-342q-179 124-399 124-143 0-273.5-55.5t-225-150-150-225-55.5-273.5 55.5-273.5 150-225 225-150 273.5-55.5 273.5 55.5 225 150 150 225 55.5 273.5q0 220-124 399l343 343q37 37 37 90z"/>
                            </svg>
                            XEM CHI TIẾT</a>
                    </div>
                    <div class="product__description">
                        <a href="<?php echo HTTP_SERVER . $relatedProductsList[$i]['categoryseourl'] . '.html' ?>"
                           class="product__category"><?php echo $relatedProductsList[$i]['categoryname'] ?></a>

                        <a href="<?php echo HTTP_SERVER . $relatedProductsList[$i]['seourl']?>.html"
                           style="<?php if($product['baseprice'] != $product['sellingprice']) echo 'margin-bottom: 0' ?>"
                           class="product__name"><?php echo $relatedProductsList[$i]['productname']?></a>


                        <p class="product__price--old">
                            <?php if($relatedProductsList[$i]["baseprice"] !== $relatedProductsList[$i]["sellingprice"]) { ?>
                            <?php echo number_format($relatedProductsList[$i]["baseprice"], 0, ',', '.'); echo $relatedProductsData['currency'] ?>
                            <?php } ?>
                        </p>

                        <p class="product__price"><?php echo number_format(intval($relatedProductsList[$i]['sellingprice']),'0','.','.');echo $relatedProductsData['currency'] ?></p><span>/<?php echo $relatedProductsList[$i]['unitname'] ?></span>
                    </div>
                    <div class="product__item__advancebutton--mobile">
                        <a style="cursor: pointer;" class="product__addtocart"
                           data-productsku="<?php echo $relatedProductsList[$i]['sku'] ?>"
                           data-cartcode="<?php echo $_SESSION['cartcode'] ?>" data-quantity="1"
                           data-quantityinstock="<?php echo $relatedProductsList[$i]['quantity']?>">
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
                        <?php if ($device == "desktop") { ?>
                        <a href="<?php echo HTTP_SERVER . $relatedProductsList[$i]['seourl']?>.html"
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
        <div class="product__seemore">
            <a href="<?php echo HTTP_SERVER ?>san-pham.html"> Xem thêm </a>
        </div>
    </div>
</div>

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
    var url = "<?php echo HTTP_SERVER ?>ajax/<?php echo $_SESSION['cartcode']?'incProductOnCart':'addProductToCart' ?>.gbe";
    var error = document.getElementsByClassName("pd__description__purchase__error")[0];

    //    -------Xử lý chọn option sản phẩm-------
    var option_length = "<?php echo sizeof($productOptions) ?>";
    function load_option() {
        var option = [];
        var option__0 = document.getElementsByClassName("option__0__btn");
        option__0[0].classList.add("active");
        option[0] = option__0[0].getAttribute("data-optionname") + " : " + option__0[0].getAttribute("data-optionvalue");
        if (option_length == 2) {
            var option__1 = document.getElementsByClassName("option__1__btn");
            option__1[0].classList.add("active");
            option[1] = option__1[0].getAttribute("data-optionname") + " : " + option__1[0].getAttribute("data-optionvalue");
        }

        var optionFormat = JSON.parse(`<?php echo $productOptionFormats; ?>`);

        function updateOptions(index) { //  Ẩn những option không phù hợp với option đang được chọn
            if (option_length == 1) {
                if (document.querySelectorAll("button.active").length == 1) {
                    for (var i = 0; i < optionFormat.length; ++i) {
                        if (optionFormat[i].option == option[0]) {
                            if (document.getElementsByClassName("pd__description__price__old")[0])
                                document.getElementsByClassName("pd__description__price__old")[0].innerHTML = optionFormat[i].baseprice + optionFormat[i].currency;
                            document.getElementsByClassName("pd__description__price__current")[0].innerHTML = optionFormat[i].sellingprice + optionFormat[i].currency;
                            document.getElementsByClassName("pd__description__sku")[0].innerHTML = optionFormat[i].sku;
                            document.getElementsByClassName("purchase__shopping__cart")[0].setAttribute("data-productsku", optionFormat[i].sku);
                            document.getElementsByClassName("pd__description__quantity")[0].innerHTML = optionFormat[i].quantity;
                            break;
                        }
                    }
                }
                return;
            }
            if (index == 0) {
                for (var i = 0; i < option__1.length; i++) {
                    var tmp = option[0] + " | " + option__1[i].getAttribute("data-optionname") + " : " + option__1[i].getAttribute("data-optionvalue");
                    $check = 0;
                    for (var j = 0; j < optionFormat.length; ++j) {
                        if (optionFormat[j].option == tmp) {
                            $check = 1;
                            option__1[i].disabled = false;
                            break;
                        }
                    }
                    if (!$check) {
                        option__1[i].disabled = true;
                        option__1[i].classList.remove("active");
                    }
                }
            }
            if (document.querySelectorAll("button.active").length == option_length) {
                var optionnow = option[0] + " | " + option[1];
                for (var i = 0; i < optionFormat.length; ++i) {
                    if (optionFormat[i].option == optionnow) {
                        if (document.getElementsByClassName("pd__description__price__old")[0])
                            document.getElementsByClassName("pd__description__price__old")[0].innerHTML = optionFormat[i].baseprice + optionFormat[i].currency;
                        document.getElementsByClassName("pd__description__price__current")[0].innerHTML = optionFormat[i].sellingprice + optionFormat[i].currency;
                        document.getElementsByClassName("pd__description__sku")[0].innerHTML = optionFormat[i].sku;
                        document.getElementsByClassName("purchase__shopping__cart")[0].setAttribute("data-productsku", optionFormat[i].sku);
                        document.getElementsByClassName("pd__description__quantity")[0].innerHTML = optionFormat[i].quantity;
                        break;
                    }
                }
            }
        }


        updateOptions(0);
        //    Xử lý kiểm tra option đang chọn có đúng hay không
        for (var i = 0; i < option__0.length; i++) {
            option__0[i].addEventListener("click", function () {
                var current = document.querySelectorAll(".option__0__btn.active");
                if (current.length > 0)
                    current[0].classList.remove("active");
                this.classList.add("active");
                option[0] = this.getAttribute("data-optionname") + " : " + this.getAttribute("data-optionvalue");
                updateOptions(0);
            });
        }

        if (option_length == 2) {
            for (var i = 0; i < option__1.length; i++) {
                option__1[i].addEventListener("click", function () {
                    var current = document.querySelectorAll(".option__1__btn.active");
                    if (current.length > 0)
                        current[0].classList.remove("active");
                    this.classList.add("active");
                    option[1] = this.getAttribute("data-optionname") + " : " + this.getAttribute("data-optionvalue");
                    updateOptions(1);
                });
            }
        }


        function change_lable_option(e) {
            var parent = e.closest('div');
            var label = parent.querySelector('.option__value');
            label.innerHTML = e.getAttribute("data-optionvalue");
        }
    }
    if (option_length > 0) load_option();

    // -------Kết thúc xử lý chọn option sản phẩm-------
</script>