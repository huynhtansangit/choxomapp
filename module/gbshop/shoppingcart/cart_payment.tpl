<?php
// GET dữ liệu 1 giỏ hàng bình thường
if (!empty($_SESSION["cartcode"])) {
    $crypto = new Crypto();
    $carttoken = $crypto->encrypt_tripledes($_SESSION['cartid'] . '..' . $_SESSION['cartcode']);
$params = array(
"carttoken" => $carttoken
);
$jsontext = callAPI("gbshop", "cart_getShoppingCartDetailsByToken.api", $params, array());
$cartData = json_decode($jsontext, true);
}
?>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<section class="shoppingcart">
    <div class="shoppingcart__container container">
        <div class="shoppingcart__row row">
            <div class="shoppingcart__content col-lg-9">
                <div class="cart__content__heading d-flex" style="justify-content: space-between;">
                    <div class="d-flex">
                        <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                             x="0px" y="0px"
                             width="30px" height="30px" viewBox="0 0 203.26 203.26" enable-background="new 0 0 203.26 203.26"
                             xml:space="preserve">
<g>
    <path fill-rule="evenodd" clip-rule="evenodd" fill="#FFFFFF" d="M190.986,74.153c-48.377,0-95.849,0-143.929,0
		c2.306,5.242,4.201,10.009,6.545,14.542c0.556,1.075,2.622,1.935,3.997,1.938c40.96,0.102,81.92,0.101,122.881-0.001
		c1.367-0.004,3.424-0.875,3.98-1.952C186.798,84.15,188.687,79.388,190.986,74.153z M178.8,101.448c-40.221,0-79.68,0-119.543,0
		c2.036,4.697,3.645,9.059,5.84,13.102c0.734,1.352,2.966,2.672,4.52,2.678c32.986,0.154,65.975,0.135,98.961,0.051
		c1.268-0.004,3.203-0.637,3.686-1.568C174.597,111.198,176.542,106.483,178.8,101.448z M151.755,152.062
		c-8.736-0.059-15.156,5.912-15.268,14.201c-0.108,8.145,6.594,14.857,14.876,14.896c8.248,0.039,15.011-6.613,14.997-14.754
		C166.347,158.198,160.158,152.12,151.755,152.062z M67.889,152.062c-8.872-0.021-14.947,5.838-14.933,14.4
		c0.014,8.299,6.555,14.736,14.925,14.693c8.258-0.041,14.454-6.203,14.534-14.455C82.501,157.749,76.88,152.083,67.889,152.062z"/>
    <path fill-rule="evenodd" clip-rule="evenodd" d="M11.595,22.01c2.25,2,3.731,5.242,4.988,8.167
		c13.565,31.565,27.04,63.168,40.319,94.854c1.282,3.059,3.176,2.809,5.465,2.809c34.302,0.002,68.603-0.006,102.905,0.01
		c5.764,0.004,8.554,2.027,9.061,6.396c0.548,4.719-2.344,8.506-7.545,8.525c-37.465,0.148-74.931,0.145-112.395,0.004
		c-4.668-0.018-7.854-2.846-9.729-7.328c-8.968-21.43-18.047-42.813-27.136-64.193C11.826,57.836,6.037,44.456,0.287,31.058
		c-0.941-4.298,0.639-6.173,1.684-7.798C4.154,20.875,8.03,20.085,11.595,22.01z"/>
    <path fill-rule="evenodd" clip-rule="evenodd" d="M203.261,48.056c-1.695,3.321-3.852,6.496-4.969,10.002
		c-1.386,4.354-3.952,5.114-8.133,5.066c-19.66-0.226-39.322-0.101-58.984-0.101c-27.827,0-55.654-0.109-83.479,0.114
		c-4.369,0.035-6.732-1.297-8.095-5.32c-1.16-3.423-2.746-6.702-4.443-10.762c56.357,0,112.229,0,168.103,0
		C203.261,47.39,203.261,47.723,203.261,48.056z"/>
    <path fill-rule="evenodd" clip-rule="evenodd" d="M190.986,74.153c-2.299,5.235-4.188,9.997-6.525,14.527
		c-0.557,1.077-2.613,1.948-3.98,1.952c-40.961,0.102-81.921,0.103-122.881,0.001c-1.375-0.003-3.44-0.862-3.997-1.938
		c-2.345-4.534-4.24-9.3-6.545-14.542C95.137,74.153,142.609,74.153,190.986,74.153z"/>
    <path fill-rule="evenodd" clip-rule="evenodd" d="M178.8,101.448c-2.258,5.035-4.203,9.75-6.537,14.262
		c-0.482,0.932-2.418,1.564-3.686,1.568c-32.986,0.084-65.975,0.104-98.961-0.051c-1.554-0.006-3.786-1.326-4.52-2.678
		c-2.195-4.043-3.804-8.404-5.84-13.102C99.121,101.448,138.58,101.448,178.8,101.448z"/>
    <path fill-rule="evenodd" clip-rule="evenodd" d="M151.755,152.062c8.402,0.059,14.592,6.137,14.605,14.344
		c0.014,8.141-6.749,14.793-14.997,14.754c-8.282-0.039-14.984-6.752-14.876-14.896
		C136.599,157.974,143.019,152.003,151.755,152.062z"/>
    <path fill-rule="evenodd" clip-rule="evenodd" d="M67.889,152.062c8.991,0.021,14.612,5.688,14.526,14.639
		c-0.08,8.252-6.275,14.414-14.534,14.455c-8.37,0.043-14.911-6.395-14.925-14.693C52.942,157.899,59.018,152.04,67.889,152.062z"/>
</g>
</svg>
                        <span>GoodPharma</span>
                    </div>
                    <a href="<?php echo HTTP_SERVER ?>san-pham.html">Tiếp tục mua sắm</a>
                </div>

                <div class="cart__content__progress">
                    <div class="cart__content__progress__inner checked">
                        <div class="cart__content__progress__bar">
                            <div class="cart__content__progress__text">
                                Giỏ hàng
                            </div>
                        </div>
                        <div class="cart__content__progress__circle">
                            <img width="13" height="10" alt="checked icon"
                                 srcset="<?php echo HTTP_SERVER ?>module/gbshop/theme/images/checkicon@2x.png?v=<?php echo IMAGE_VERSION?> 1.25x,
                                         <?php echo HTTP_SERVER ?>module/gbshop/theme/images/checkicon@2x.png?v=<?php echo IMAGE_VERSION?> 2x"
                                 src="<?php echo HTTP_SERVER ?>module/gbshop/theme/images/checkicon.png?v=<?php echo IMAGE_VERSION?>">
                        </div>
                    </div>

                    <div class="cart__content__progress__inner checked">
                        <div class="cart__content__progress__bar">
                            <div class="cart__content__progress__text">
                                Giao hàng
                            </div>
                        </div>
                        <div class="cart__content__progress__circle">
                            <img width="13" height="10" alt="checked icon"
                                 srcset="<?php echo HTTP_SERVER ?>module/gbshop/theme/images/checkicon@2x.png?v=<?php echo IMAGE_VERSION?> 1.25x,
                                         <?php echo HTTP_SERVER ?>module/gbshop/theme/images/checkicon@2x.png?v=<?php echo IMAGE_VERSION?> 2x"
                                 src="<?php echo HTTP_SERVER ?>module/gbshop/theme/images/checkicon.png?v=<?php echo IMAGE_VERSION?>">
                        </div>
                    </div>
                    <div class="cart__content__progress__inner checked">
                        <div class="cart__content__progress__bar">
                            <div class="cart__content__progress__text">
                                Thanh toán
                            </div>
                        </div>
                        <div class="cart__content__progress__circle">
                            <img width="13" height="10" alt="checked icon"
                                 srcset="<?php echo HTTP_SERVER ?>module/gbshop/theme/images/checkicon@2x.png?v=<?php echo IMAGE_VERSION?> 1.25x,
                                         <?php echo HTTP_SERVER ?>module/gbshop/theme/images/checkicon@2x.png?v=<?php echo IMAGE_VERSION?> 2x"
                                 src="<?php echo HTTP_SERVER ?>module/gbshop/theme/images/checkicon.png?v=<?php echo IMAGE_VERSION?>">
                        </div>
                    </div>
                    <div class="cart__content__progress__inner">
                        <div class="cart__content__progress__bar">
                            <div class="cart__content__progress__text">
                                Hoàn tất
                            </div>
                        </div>
                        <div class="cart__content__progress__circle">
                            <img width="13" height="10" alt="checked icon"
                                 srcset="<?php echo HTTP_SERVER ?>module/gbshop/theme/images/checkicon@2x.png?v=<?php echo IMAGE_VERSION?> 1.25x,
                                         <?php echo HTTP_SERVER ?>module/gbshop/theme/images/checkicon@2x.png?v=<?php echo IMAGE_VERSION?> 2x"
                                 src="<?php echo HTTP_SERVER ?>module/gbshop/theme/images/checkicon.png?v=<?php echo IMAGE_VERSION?>">
                        </div>
                    </div>
                    <div class="cart__content__progress__circle2">
                        <!--<img width="13" height="10" alt="checked icon"
                             srcset="<?php echo HTTP_SERVER ?>module/gbshop/theme/images/checkicon@2x.png?v=<?php echo IMAGE_VERSION?> 1.25x,
                                         <?php echo HTTP_SERVER ?>module/gbshop/theme/images/checkicon@2x.png?v=<?php echo IMAGE_VERSION?> 2x"
                             src="<?php echo HTTP_SERVER ?>module/gbshop/theme/images/checkicon.png?v=<?php echo IMAGE_VERSION?>">-->
                    </div>
                </div>
                <form id="frm__payment" class="cart__payment row" method="post">
                    <div class="payment__buyer col-12 col-lg-6">
                        <h2 class="cart__payment__title">Người đặt hàng</h2>

                        <div class="payment__formgroup">
                            <label for="name__input" class="payment__formlabel">Họ tên</label>

                            <div class="payment__forminput">
                                <?php echo $cartData['data']['membername']?>
                            </div>
                        </div>
                        <div class="payment__formgroup">
                            <label for="name__input" class="payment__formlabel">Email</label>

                            <div class="payment__forminput">
                                <?php echo $cartData['data']['memberemail']?>
                            </div>
                        </div>
                        <div class="payment__formgroup">
                            <label for="name__input" class="payment__formlabel">Điện thoại</label>

                            <div class="payment__forminput">
                                <?php echo $cartData['data']['memberphone']?>
                            </div>
                        </div>
                        <div class="payment__formgroup">
                            <label for="name__input" class="payment__formlabel">Tỉnh/thành</label>

                            <div class="payment__forminput">
                                <?php echo $cartData['data']['membercitytext']?>
                            </div>
                        </div>
                        <div class="payment__formgroup">
                            <label for="name__input" class="payment__formlabel">Quận/huyện</label>

                            <div class="payment__forminput">
                                <?php echo $cartData['data']['memberdistricttext']?>
                            </div>
                        </div>
                        <div class="payment__formgroup">
                            <label for="name__input" class="payment__formlabel">Phường/xã</label>

                            <div class="payment__forminput">
                                <?php echo $cartData['data']['memberwardtext']?>
                            </div>
                        </div>
                        <div class="payment__formgroup">
                            <label for="name__input" class="payment__formlabel">Địa chỉ</label>

                            <div class="payment__forminput">
                                <?php echo $cartData['data']['memberaddress']?>
                            </div>
                        </div>
                        <div class="payment__formgroup">
                            <label for="name__input" class="payment__formlabel">Ghi chú</label>

                            <div class="payment__forminput">
                                <?php echo $cartData['data']['customercomment']?>
                            </div>
                        </div>
                    </div>

                    <div class="payment__receiver col-12 col-lg-6" style="<?php echo $cartData['data']['iscollect'] == 1 ? 'display: none' : '' ?>">
                        <h2 class="cart__payment__title">Người nhận hàng</h2>

                        <div class="payment__formgroup">
                            <label for="name__input" class="payment__formlabel">Họ tên</label>

                            <div class="payment__forminput">
                                <?php echo $cartData['data']['shipname']?>
                            </div>
                        </div>
                        <div class="payment__formgroup">
                            <label for="name__input" class="payment__formlabel">Email</label>

                            <div class="payment__forminput">
                                <?php echo $cartData['data']['shipemail']?>
                            </div>
                        </div>
                        <div class="payment__formgroup">
                            <label for="name__input" class="payment__formlabel">Điện thoại</label>

                            <div class="payment__forminput">
                                <?php echo $cartData['data']['shipphone']?>
                            </div>
                        </div>
                        <div class="payment__formgroup">
                            <label for="name__input" class="payment__formlabel">Tỉnh/thành</label>

                            <div class="payment__forminput">
                                <?php echo $cartData['data']['shipcitytext']?>
                            </div>
                        </div>
                        <div class="payment__formgroup">
                            <label for="name__input" class="payment__formlabel">Quận/huyện</label>

                            <div class="payment__forminput">
                                <?php echo $cartData['data']['shipdistricttext']?>
                            </div>
                        </div>
                        <div class="payment__formgroup">
                            <label for="name__input" class="payment__formlabel">Phường/xã</label>

                            <div class="payment__forminput">
                                <?php echo $cartData['data']['shipwardtext']?>
                            </div>
                        </div>
                        <div class="payment__formgroup">
                            <label for="name__input" class="payment__formlabel">Địa chỉ</label>

                            <div class="payment__forminput">
                                <?php echo $cartData['data']['shipaddress']?>
                            </div>
                        </div>

                    </div>

                    <div class="payment__receiver col-12 col-lg-6" style="<?php echo $cartData['data']['iscollect'] == 0 ? 'display: none' : '' ?>">
                        <h2 class="cart__payment__title">Đến nơi nhận hàng</h2>
                        <p>Nhà thuốc Good Pharma</p>
                        <p><strong>Địa chỉ:</strong> 35 Thuận Kiều, Phường 12, Quận 5, Thành phố Hồ Chí Minh</p>
                        <p><strong>Điện thoại:</strong> <a href="tel:090 636 62 09">090 636 62 09</a></p>
                        <p><strong>Giờ mở cửa:</strong> 7:30 - 21:00</p>
                    </div>
                    <div class="payment__option col-lg-6">
                        <h2 class="cart__payment__title">Phương thức thanh toán</h2>

                        <div class="payment__option__receiver">
                            <label>
                                <input type="radio" value="COD" name="paymentmethod" <?php echo ($cartData['data']['paymentmethod'] == 'cash') || ($cartData['data']['paymentmethod'] == '') ? 'checked': '' ?>>
                                <span class="payment__radiofake"></span>
                                <span class="label">
                                    <svg width="18" height="18" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                                         version="1.1" id="Capa_1" x="0px" y="0px" viewBox="0 0 512 512"
                                         style="enable-background:new 0 0 512 512;" xml:space="preserve">
<g>
    <g>
        <path d="M172.55,391.902c-0.13-0.64-0.32-1.27-0.57-1.88c-0.25-0.6-0.56-1.18-0.92-1.72c-0.36-0.55-0.78-1.06-1.24-1.52    c-0.46-0.46-0.97-0.88-1.52-1.24c-0.54-0.36-1.12-0.67-1.73-0.92c-0.6-0.25-1.23-0.45-1.87-0.57c-1.29-0.26-2.62-0.26-3.9,0    c-0.64,0.12-1.27,0.32-1.88,0.57c-0.6,0.25-1.18,0.56-1.72,0.92c-0.55,0.36-1.06,0.78-1.52,1.24c-0.46,0.46-0.88,0.97-1.24,1.52    c-0.37,0.54-0.67,1.12-0.92,1.72c-0.25,0.61-0.45,1.24-0.57,1.88c-0.13,0.64-0.2,1.3-0.2,1.95c0,0.65,0.07,1.31,0.2,1.95    c0.12,0.64,0.32,1.27,0.57,1.87c0.25,0.61,0.55,1.19,0.92,1.73c0.36,0.55,0.78,1.06,1.24,1.52c0.46,0.46,0.97,0.88,1.52,1.24    c0.54,0.361,1.12,0.671,1.72,0.921c0.61,0.25,1.24,0.45,1.88,0.57c0.64,0.13,1.3,0.2,1.95,0.2c0.65,0,1.31-0.07,1.95-0.2    c0.64-0.12,1.27-0.32,1.87-0.57c0.61-0.25,1.19-0.561,1.73-0.921c0.55-0.36,1.06-0.78,1.52-1.24c0.46-0.46,0.88-0.97,1.24-1.52    c0.36-0.54,0.67-1.12,0.92-1.73c0.25-0.6,0.44-1.23,0.57-1.87s0.2-1.3,0.2-1.95S172.68,392.542,172.55,391.902z"/>
    </g>
</g>
                                        <g>
                                            <g>
                                                <path d="M459.993,394.982c-0.039-0.1-0.079-0.199-0.121-0.297c-9.204-21.537-30.79-29.497-56.336-20.772l-69.668,19.266    c-4.028-12.198-14.075-22.578-28.281-27.85c-0.088-0.032-0.176-0.064-0.265-0.094l-76.581-25.992    c-6.374-8.239-26.34-29.321-63.723-29.321c-26.125,0-49.236,17.922-62.458,37.457H10c-5.523,0-10,4.477-10,10v126.077    c0,5.523,4.477,10,10,10h59.457c5.523,0,10-4.477,10-10v-8.634h27.883c5.523,0,10-4.477,10-10v-2.878    c16.254,1.418,21.6,4.501,36.528,13.109c11.48,6.62,28.831,16.625,60.077,30.674c0.145,0.065,0.292,0.127,0.439,0.185    c5.997,2.359,17.72,6.065,32.173,6.065c10.06,0,21.445-1.797,33.131-7.094l153.991-55.136c0.274-0.098,0.544-0.208,0.808-0.33    C449.204,442.646,471.135,423.563,459.993,394.982z M59.457,473.455H20V367.378h39.457V473.455z M97.34,454.821H79.457v-87.443    H97.34V454.821z M426.496,431.074l-153.922,55.111c-0.135,0.048-0.318,0.12-0.451,0.174c-0.135,0.055-0.27,0.113-0.403,0.174    c-21.437,9.852-41.814,3.954-49.8,0.849c-30.182-13.581-46.291-22.87-58.061-29.657c-16.364-9.436-24.249-13.984-46.519-15.823    V361.36c9.479-15.536,27.861-31.439,47.679-31.439c33.986,0,48.387,22.105,48.953,22.997c1.221,1.986,3.098,3.483,5.305,4.232    l79.475,26.974c12.693,4.764,19.401,15.634,16.318,26.474c-1.423,5.006-4.711,9.158-9.257,11.691    c-4.507,2.511-9.717,3.132-14.683,1.758l-89.593-28.392c-5.268-1.669-10.886,1.247-12.554,6.512    c-1.669,5.265,1.247,10.885,6.512,12.554l89.749,28.441c0.095,0.03,0.19,0.059,0.286,0.086c3.583,1.019,7.231,1.523,10.857,1.523    c6.638,0,13.203-1.691,19.161-5.011c9.213-5.133,15.875-13.547,18.759-23.692c0.23-0.81,0.434-1.62,0.611-2.43l75.083-20.8    c10.844-3.704,25.079-5.039,31.417,9.558C447.978,419.533,430.928,428.96,426.496,431.074z"/>
                                            </g>
                                        </g>
                                        <g>
                                            <g>
                                                <path d="M359.06,131.543c-0.13-0.64-0.32-1.27-0.58-1.88c-0.25-0.6-0.55-1.18-0.92-1.72c-0.36-0.55-0.78-1.06-1.24-1.52    c-0.46-0.46-0.97-0.88-1.52-1.24c-0.54-0.36-1.12-0.67-1.72-0.92c-0.61-0.25-1.24-0.45-1.87-0.57c-1.29-0.26-2.62-0.26-3.91,0    c-0.64,0.12-1.27,0.32-1.87,0.57c-0.61,0.25-1.19,0.56-1.73,0.92c-0.55,0.36-1.06,0.78-1.52,1.24c-0.46,0.46-0.88,0.97-1.24,1.52    c-0.36,0.54-0.67,1.12-0.92,1.72c-0.25,0.61-0.45,1.24-0.57,1.88c-0.13,0.64-0.2,1.3-0.2,1.95c0,0.65,0.07,1.31,0.2,1.95    c0.12,0.64,0.32,1.27,0.57,1.87c0.25,0.61,0.56,1.19,0.92,1.73c0.36,0.55,0.78,1.06,1.24,1.52c0.46,0.46,0.97,0.88,1.52,1.24    c0.54,0.36,1.12,0.67,1.73,0.92c0.6,0.25,1.23,0.44,1.87,0.57s1.3,0.2,1.95,0.2c0.65,0,1.31-0.07,1.96-0.2    c0.63-0.13,1.26-0.32,1.87-0.57c0.6-0.25,1.18-0.56,1.72-0.92c0.55-0.36,1.06-0.78,1.52-1.24c0.46-0.46,0.88-0.97,1.24-1.52    c0.37-0.54,0.67-1.12,0.92-1.73c0.26-0.6,0.45-1.23,0.58-1.87c0.13-0.64,0.19-1.3,0.19-1.95    C359.25,132.843,359.19,132.183,359.06,131.543z"/>
                                            </g>
                                        </g>
                                        <g>
                                            <g>
                                                <path d="M502,33.891h-59.457c-5.523,0-10,4.477-10,10v8.634H404.66c-5.523,0-10,4.477-10,10v2.878    c-16.254-1.419-21.6-4.501-36.527-13.109c-11.48-6.62-28.831-16.625-60.078-30.674c-0.145-0.066-0.291-0.127-0.44-0.185    c-10.171-4.002-36.828-11.876-65.299,1.027l-40.24,14.408L158.157,2.952c-3.905-3.905-10.237-3.905-14.142,0L32.657,114.309    c-3.602,3.603-4.293,9.85,0,14.143l190.287,190.287c3.045,3.046,10.175,3.967,14.143,0l101.665-101.664    c2.643,0.228,5.386,0.351,8.229,0.351c26.126,0,49.236-17.922,62.457-37.456H502c5.523,0,10-4.477,10-10V43.891    C512,38.368,507.523,33.891,502,33.891z M151.085,24.165l22.792,22.792c-6.775,4.19-14.608,6.432-22.792,6.432    c-8.185,0-16.017-2.241-22.792-6.432L151.085,24.165z M76.663,144.173L53.871,121.38l22.792-22.792    c4.19,6.775,6.432,14.608,6.432,22.792C83.095,129.564,80.854,137.397,76.663,144.173z M230.016,297.525l-22.788-22.788    c13.913-8.586,31.661-8.586,45.575,0L230.016,297.525z M267.211,260.331c-22.098-16.03-52.292-16.03-74.39,0L91.07,158.579    c7.809-10.74,12.025-23.641,12.025-37.199c0-13.559-4.215-26.459-12.025-37.199l22.817-22.816    c10.74,7.809,23.64,12.025,37.199,12.025c13.559,0,26.459-4.216,37.199-12.025l21.629,21.629    c-4.667,0.689-9.218,2.227-13.462,4.592c-7.168,3.994-12.792,9.975-16.294,17.211c-11.28,2.089-21.723,7.55-29.915,15.741    c-22.225,22.226-22.225,58.389,0.001,80.615c11.112,11.112,25.709,16.669,40.307,16.669c14.597,0,29.195-5.556,40.308-16.669    c7.23-7.23,12.295-16.116,14.832-25.8l33.764,11.459c-3.801,17.608,0.092,36.132,10.593,50.682L267.211,260.331z M206.413,162.018    c0.088,0.032,0.176,0.064,0.265,0.094l19.996,6.787c-1.51,6.815-4.927,13.081-9.957,18.112c-14.428,14.426-37.904,14.428-52.33,0    c-14.428-14.427-14.428-37.902,0-52.33c3.48-3.482,7.587-6.203,12.062-8.048C178.295,141.995,189.356,155.688,206.413,162.018z     M304.457,223.084c-3.86-6.29-6.044-13.469-6.389-20.796c4.79,3.463,10.644,6.856,17.636,9.549L304.457,223.084z M394.659,165.983    c-9.478,15.538-27.86,31.441-47.678,31.441c-3.708,0-7.183-0.264-10.432-0.734c-0.013-0.002-0.026-0.004-0.039-0.006    c-21.596-3.137-33.213-15.411-37.042-20.271c-0.204-0.3-1.073-1.437-1.202-1.626c-1.165-2.082-3.075-3.756-5.511-4.583    l-79.508-26.985c-12.688-4.762-19.395-15.627-16.321-26.463c0.002-0.007,0.004-0.014,0.006-0.021    c0.003-0.008,0.005-0.017,0.007-0.025c1.429-4.99,4.711-9.129,9.247-11.656c4.506-2.511,9.715-3.134,14.683-1.757l89.593,28.391    c5.266,1.671,10.886-1.247,12.554-6.512c1.668-5.265-1.247-10.885-6.512-12.554l-71.255-22.58l-0.622-0.622    c-0.006-0.006-0.012-0.013-0.019-0.019l-36.89-36.89l31.708-11.354c0.107-0.039,0.239-0.088,0.345-0.131    c0.027-0.011,0.079-0.031,0.105-0.042c0.136-0.055,0.27-0.113,0.403-0.174c21.436-9.852,41.812-3.955,49.799-0.849    c30.183,13.581,46.293,22.87,58.063,29.657c16.364,9.437,24.249,13.984,46.518,15.823V165.983z M432.543,159.968H414.66V72.525    h17.883V159.968z M492,159.968h-39.457V53.891H492V159.968z"/>
                                            </g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
</svg>
                                    Thanh toán khi nhận hàng
                                </span>
                            </label>
                            <!--<label>
                                <input type="radio" value="visa" name="paymentmethod" <?php echo $cartData['data']['paymentmethod'] == 'visa' ? 'checked': '' ?>>
                                <span class="payment__radiofake"></span>
                                <span class="label">
                                    <svg width="18" height="18" viewBox="0 0 2304 1792" xmlns="http://www.w3.org/2000/svg"><path d="M1975 990h-138q14-37 66-179l3-9q4-10 10-26t9-26l12 55zm-1444-65l-58-295q-11-54-75-54h-268l-2 13q311 79 403 336zm179-349l-162 438-17-89q-26-70-85-129.5t-131-88.5l135 510h175l261-641h-176zm139 642h166l104-642h-166zm768-626q-69-27-149-27-123 0-201 59t-79 153q-1 102 145 174 48 23 67 41t19 39q0 30-30 46t-69 16q-86 0-156-33l-22-11-23 144q74 34 185 34 130 1 208.5-59t80.5-160q0-106-140-174-49-25-71-42t-22-38q0-22 24.5-38.5t70.5-16.5q70-1 124 24l15 8zm425-16h-128q-65 0-87 54l-246 588h174l35-96h212q5 22 20 96h154zm262-320v1280q0 52-38 90t-90 38h-2048q-52 0-90-38t-38-90v-1280q0-52 38-90t90-38h2048q52 0 90 38t38 90z"/></svg>
                                    Thanh toán qua thẻ quốc tế Visa,Mastercard,JCB
                                </span>
                            </label>-->
                            <label>
                                <input id="atmBanking" type="radio" value="BANK" name="paymentmethod"  <?php echo $cartData['data']['paymentmethod'] == 'BANK' ? 'checked': '' ?>>
                                <span class="payment__radiofake"></span>
                                <span class="label">
                                    <svg width="18" height="18" viewBox="0 0 2048 1792" xmlns="http://www.w3.org/2000/svg"><path d="M1824 128q66 0 113 47t47 113v1216q0 66-47 113t-113 47h-1600q-66 0-113-47t-47-113v-1216q0-66 47-113t113-47h1600zm-1600 128q-13 0-22.5 9.5t-9.5 22.5v224h1664v-224q0-13-9.5-22.5t-22.5-9.5h-1600zm1600 1280q13 0 22.5-9.5t9.5-22.5v-608h-1664v608q0 13 9.5 22.5t22.5 9.5h1600zm-1504-128v-128h256v128h-256zm384 0v-128h384v128h-384z"/></svg>
                                    Thanh toán bằng hình thức chuyển khoản
                                </span>
                                <div id="bankPayment" style="display: none;">
                                    <div  class="bank__payment">
                                        <img width="150"  alt="receive at store"
                                             srcset="<?php echo HTTP_SERVER ?>module/gbshop/theme/images/vi-momo.jpg?v=<?php echo IMAGE_VERSION?> 1.25x,
                                         <?php echo HTTP_SERVER ?>module/gbshop/theme/images/techcombank-logo.png?v=<?php echo IMAGE_VERSION?> 2x"
                                             src="<?php echo HTTP_SERVER ?>module/gbshop/theme/images/techcombank-logo.png?v=<?php echo IMAGE_VERSION?>">
                                        <div class="bank__payment__content">
                                            <p class="bank__name">Techcombank</p>
                                            <p>Tên: GoodPharma</p>
                                            <p>Số tài khoản: </p>
                                            <p>Chi nhánh: Thành phố Hồ Chí Minh</p>
                                        </div>
                                    </div>
                                </div>
                                
                            </label>

                            <!--<label>
                                <input type="radio" value="momo" name="paymentmethod" <?php echo $cartData['data']['paymentmethod'] == 'momo' ? 'checked': '' ?>>
                                <span class="payment__radiofake"></span>
                                <span class="label">
                                    <img width="18" height="18" alt="receive at st>e"
                                         srcset="<?php echo HTTP_SERVER ?>module/gbshop/theme/images/vi-momo.jpg?v=<?php echo IMAGE_VERSION?> 1.25x,
                                         <?php echo HTTP_SERVER ?>module/gbshop/theme/images/vi-momo.jpg?v=<?php echo IMAGE_VERSION?> 2x"
                                         src="<?php echo HTTP_SERVER ?>module/gbshop/theme/images/vi-momo.jpg?v=<?php echo IMAGE_VERSION?>">
                                    Thanh toán qua MoMo
                                </span>
                            </label>-->
                            <!--<label>
                                <input type="radio" value="zalopay" name="paymentmethod" <?php echo $cartData['data']['paymentmethod'] == 'zalopay' ? 'checked': '' ?>>
                                <span class="payment__radiofake"></span>
                                <span class="label">
                                    <img width="18" height="18" alt="receive at store"
                                         srcset="<?php echo HTTP_SERVER ?>module/gbshop/theme/images/zalo.png?v=<?php echo IMAGE_VERSION?> 1.25x,
                                         <?php echo HTTP_SERVER ?>module/gbshop/theme/images/zalo.png?v=<?php echo IMAGE_VERSION?> 2x"
                                         src="<?php echo HTTP_SERVER ?>module/gbshop/theme/images/zalo.png?v=<?php echo IMAGE_VERSION?>">
                                    Thanh toán qua ZaloPay
                                </span>
                            </label>-->
                        </div>
                    </div>
                    <div class="cart__payment__button col-12">
                        <a id="btn__backtoshipping" class="button__back" href="javascript:void(0)">Trở về</a>
                        <button type="submit" class="button__confirm">Xác nhận</button>
                    </div>
                </form>

            </div>
            <div class="shoppingcart__invoice col-lg-3">
                <?php include('shoppingcart_invoice.tpl')?>
            </div>
        </div>
    </div>
</section>