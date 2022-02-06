<div class="orderdetail">
    <div class="orderdetail__container container">

        <div class="orderdetail__progress">
            <div class="line"></div>
            <span class="dot__start"></span>

            <div class="orderdetail__progress__block <?php echo $orderDetailData['data']['orderstatus']=='pending'?active:'' ?>">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                    <!-- Font Awesome Free 5.15.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free (Icons: CC BY 4.0, Fonts: SIL OFL 1.1, Code: MIT License) -->
                    <path d="M256,8C119,8,8,119,8,256S119,504,256,504,504,393,504,256,393,8,256,8Zm92.49,313h0l-20,25a16,16,0,0,1-22.49,2.5h0l-67-49.72a40,40,0,0,1-15-31.23V112a16,16,0,0,1,16-16h32a16,16,0,0,1,16,16V256l58,42.5A16,16,0,0,1,348.49,321Z"/>
                </svg>
                &nbsp;<span>Chờ xác nhận</span>
            </div>
            <div class="orderdetail__progress__block <?php echo $orderDetailData['data']['orderstatus']=='rejected'?active:'' ?>">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 352 512">
                    <!-- Font Awesome Free 5.15.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free (Icons: CC BY 4.0, Fonts: SIL OFL 1.1, Code: MIT License) -->
                    <path d="M242.72 256l100.07-100.07c12.28-12.28 12.28-32.19 0-44.48l-22.24-22.24c-12.28-12.28-32.19-12.28-44.48 0L176 189.28 75.93 89.21c-12.28-12.28-32.19-12.28-44.48 0L9.21 111.45c-12.28 12.28-12.28 32.19 0 44.48L109.28 256 9.21 356.07c-12.28 12.28-12.28 32.19 0 44.48l22.24 22.24c12.28 12.28 32.2 12.28 44.48 0L176 322.72l100.07 100.07c12.28 12.28 32.2 12.28 44.48 0l22.24-22.24c12.28-12.28 12.28-32.19 0-44.48L242.72 256z"/>
                </svg>
                &nbsp;<span>Từ chối</span>
            </div>
            <div class="orderdetail__progress__block <?php echo $orderDetailData['data']['orderstatus']=='canceled'?active:'' ?>">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 352 512">
                    <!-- Font Awesome Free 5.15.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free (Icons: CC BY 4.0, Fonts: SIL OFL 1.1, Code: MIT License) -->
                    <path d="M242.72 256l100.07-100.07c12.28-12.28 12.28-32.19 0-44.48l-22.24-22.24c-12.28-12.28-32.19-12.28-44.48 0L176 189.28 75.93 89.21c-12.28-12.28-32.19-12.28-44.48 0L9.21 111.45c-12.28 12.28-12.28 32.19 0 44.48L109.28 256 9.21 356.07c-12.28 12.28-12.28 32.19 0 44.48l22.24 22.24c12.28 12.28 32.2 12.28 44.48 0L176 322.72l100.07 100.07c12.28 12.28 32.2 12.28 44.48 0l22.24-22.24c12.28-12.28 12.28-32.19 0-44.48L242.72 256z"/>
                </svg>
                &nbsp;<span>Hủy đơn</span>
            </div>
            <div class="orderdetail__progress__block <?php echo $orderDetailData['data']['orderstatus']=='confirmed'?active:'' ?>">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                    <!-- Font Awesome Free 5.15.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free (Icons: CC BY 4.0, Fonts: SIL OFL 1.1, Code: MIT License) -->
                    <path d="M173.898 439.404l-166.4-166.4c-9.997-9.997-9.997-26.206 0-36.204l36.203-36.204c9.997-9.998 26.207-9.998 36.204 0L192 312.69 432.095 72.596c9.997-9.997 26.207-9.997 36.204 0l36.203 36.204c9.997 9.997 9.997 26.206 0 36.204l-294.4 294.401c-9.998 9.997-26.207 9.997-36.204-.001z"/>
                </svg>
                &nbsp;<span>Đã xác nhận</span>
            </div>
            <div class="orderdetail__progress__block <?php echo $orderDetailData['data']['orderstatus']=='shipping'?active:'' ?>">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512">
                    <!-- Font Awesome Free 5.15.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free (Icons: CC BY 4.0, Fonts: SIL OFL 1.1, Code: MIT License) -->
                    <path d="M621.3 237.3l-58.5-58.5c-12-12-28.3-18.7-45.3-18.7H480V64c0-17.7-14.3-32-32-32H32C14.3 32 0 46.3 0 64v336c0 44.2 35.8 80 80 80 26.3 0 49.4-12.9 64-32.4 14.6 19.6 37.7 32.4 64 32.4 44.2 0 80-35.8 80-80 0-5.5-.6-10.8-1.6-16h163.2c-1.1 5.2-1.6 10.5-1.6 16 0 44.2 35.8 80 80 80s80-35.8 80-80c0-5.5-.6-10.8-1.6-16H624c8.8 0 16-7.2 16-16v-85.5c0-17-6.7-33.2-18.7-45.2zM80 432c-17.6 0-32-14.4-32-32s14.4-32 32-32 32 14.4 32 32-14.4 32-32 32zm128 0c-17.6 0-32-14.4-32-32s14.4-32 32-32 32 14.4 32 32-14.4 32-32 32zm272-224h37.5c4.3 0 8.3 1.7 11.3 4.7l43.3 43.3H480v-48zm48 224c-17.6 0-32-14.4-32-32s14.4-32 32-32 32 14.4 32 32-14.4 32-32 32z"/>
                </svg>
                &nbsp;<span>Đang giao hàng</span>
            </div>
            <div class="orderdetail__progress__block <?php echo $orderDetailData['data']['orderstatus']=='finished'?active:'' ?>">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                    <!-- Font Awesome Free 5.15.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free (Icons: CC BY 4.0, Fonts: SIL OFL 1.1, Code: MIT License) -->
                    <path d="M505 174.8l-39.6-39.6c-9.4-9.4-24.6-9.4-33.9 0L192 374.7 80.6 263.2c-9.4-9.4-24.6-9.4-33.9 0L7 302.9c-9.4 9.4-9.4 24.6 0 34L175 505c9.4 9.4 24.6 9.4 33.9 0l296-296.2c9.4-9.5 9.4-24.7.1-34zm-324.3 106c6.2 6.3 16.4 6.3 22.6 0l208-208.2c6.2-6.3 6.2-16.4 0-22.6L366.1 4.7c-6.2-6.3-16.4-6.3-22.6 0L192 156.2l-55.4-55.5c-6.2-6.3-16.4-6.3-22.6 0L68.7 146c-6.2 6.3-6.2 16.4 0 22.6l112 112.2z"/>
                </svg>
                &nbsp;<span>Hoàn tất đơn</span>
            </div>
        </div>

        <div class="orderdetail__info">
            <div class="row">
                <div class="orderdetail__info__column col-lg-2 pr-xl-0">
                    <div class="orderdetail__info__ordercode"><?php echo $orderDetailData["data"]["ordercode"] ?></div>
                    <p>Ngày: <?php echo $orderDetailData["data"]["ordercreateddate"] ?></p>

                    <p>Hình thức thanh toán: <?php echo $orderDetailData["data"]["paymentmethod"] ?></p>
                    <p>Ngân hàng Techcombank</p>
                    <p>Số tài khoản: <strong>123456789</strong></p>
                    <p>Nội dung chuyển khoản: </p>
                    <p><strong> <?php echo $orderDetailData["data"]["memberphone"] ?> Mua hàng</strong></p>
                    <p>Ngân hàng Techcombank</p>
                    <p>Số tài khoản: <strong>123456789</strong></p>
                    <p>Nội dung chuyển khoản: </p>
                    <p><strong> <?php echo $orderDetailData["data"]["memberphone"] ?> <?php echo $orderDetailData["data"]["ordercode"] ?></strong></p>

                    <p>Loại giao hàng: <?php echo $orderDetailData["data"]["shippingmethodtext"] ?></p>
                    <p>Ghi chú: <?php echo $orderDetailData["data"]["comment"] ?></p>
                </div>
                <div class="orderdetail__info__column col-lg-5 pr-xl-0 mb-4 mb-xl-0">
                    <p class="orderdetail__info__column__title">Người đặt:</p>

                    <div class="orderdetail__info__block">
                        <p>Họ tên: <?php echo $orderDetailData["data"]["membername"] ?></p>

                        <p>Địa chỉ: <?php echo $orderDetailData["data"]["memberaddress"]?>
                            , <?php echo $orderDetailData["data"]["memberwardtext"] ?>
                            , <?php echo $orderDetailData["data"]["memberdistricttext"] ?>
                            , <?php echo $orderDetailData["data"]["membercitytext"] ?>
                        </p>

                        <p>Số điện thoại: <?php echo $orderDetailData["data"]["memberphone"] ?></p>

                        <p>Email: <?php echo $orderDetailData["data"]["memberemail"] ?></p>
                    </div>

                </div>

                <div class="orderdetail__info__column col-lg-5">
                    <p class="orderdetail__info__column__title">Người nhận:</p>

                    <div class="orderdetail__info__block">
                        <p>Họ tên: <?php echo $orderDetailData["data"]["shipname"] ?></p>

                        <p>Địa chỉ: <?php echo $orderDetailData["data"]["shipaddress"] ?>
                            , <?php echo $orderDetailData["data"]["wardtext"] ?>
                            , <?php echo $orderDetailData["data"]["districttext"] ?>
                            , <?php echo $orderDetailData["data"]["citytext"] ?></p>

                        <p>Số điện thoại: <?php echo $orderDetailData["data"]["shipphone"] ?></p>

                        <p>Email: <?php echo $orderDetailData["data"]["shipemail"] ?></p>
                    </div>
                </div>
            </div>
        </div>


        <div class="orderdetail__products">
            <div class="orderdetail__products__table">
                <table>
                    <thead>
                    <tr>
                        <th class="text-left" style="width: 10%">Loại</th>
                        <th style="width: 50%">Sản phẩm</th>
                        <th class="text-right">Số lượng</th>
                        <th class="text-right">Giá tiền</th>
                        <th class="text-right">Thành tiền</th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php if($orderDetailData["data"]["products"]) foreach($orderDetailData["data"]["products"] as $product){ ?>
                    <tr>
                        <td class="text--center"><?php echo $product["type"] ?></td>
                        <td>
                            <div class="orderdetail__products__product">

                                <img width="80" height="80" class="" alt=""
                                     srcset="<?php echo IMAGE_SERVER.'resize-80x80/'.$product['image'] . '?v=' . IMAGE_VERSION ?> 1.25x, <?php echo IMAGE_SERVER.'resize-80x80/'.$product['image'] . '?v=' . IMAGE_VERSION ?> 2x"
                                     src="<?php echo IMAGE_SERVER.'resize-80x80/'.$product['image'] . '?v=' . IMAGE_VERSION ?>">

                                <div class="orderdetail__products__info">
                                    <div class="orderdetail__products__name">
                                        <?php echo $product["productname"]; ?>
                                    </div>
                                    <div class="orderdetail__products__option">
                                        <?php if(!empty($product["optionvalue"])) { ?>
                                        <?php foreach($product["optionvalue"] as $key => $option ){ ?>
                                        <div>
                                            <?php echo $key.": ".$option ?>
                                        </div>
                                        <?php } ?>
                                        <?php } ?>
                                    </div>
                                </div>
                            </div>
                        </td>
                        <td class="text-right">
                            <?php echo $product["quantity"] ?>
                        </td>
                        <td class="text-right">
                            <?php if ($product['baseprice'] != $product['sellingprice'] ||
                                 ($product['baseprice'] != $product['sellingprice'] - ($product['discountamount']/$product['quantity']))) { ?>
                            <p class="mb-0"><span
                                        style="text-decoration: line-through;font-size:85%"><?php echo number_format($product['baseprice'],0,',','.') . $webconfig['currency']; ?></span>
                            </p>
                            <?php } ?>

                            <p class="mb-0" style="font-weight:bold"><?php echo number_format($product['sellingprice'] - ($product['discountamount']/$product['quantity']), 0, ',', '.') . $webconfig['currency']; ?></p>

                            <p><span style="text-decoration: underline;"><?php echo $product['promotioncode']; ?></span></p>
                        </td>
                        <td class="text-right" style="font-weight: 700">
                            <?php echo number_format($product["subtotal"],0,',','.') . $webconfig['currency'] ?>
                        </td>
                    </tr>
                    <?php } ?>
                    <tr>
                        <td class="border--none"></td>
                        <td class="border--none"></td>
                        <td class="border--none"></td>
                        <td class="bg--gray text-right">Tổng tạm tính</td>
                        <td class="bg--gray text-right"><?php echo number_format($orderDetailData["data"]["totallines"],0,',','.') . $webconfig['currency'] ?></td>
                    </tr>

                    <tr>
                        <td class="border--none"></td>
                        <td class="border--none"></td>
                        <td class="border--none"></td>
                        <td class="bg--gray text-right">Giảm giá</td>
                        <td class="bg--gray text-right">
                            <?php if($orderDetailData["data"]["discountamount"] != 0) { ?>
                            <?php echo $orderDetailData["data"]["promotioncode"] . ' (-' . number_format($orderDetailData["data"]["discountamount"],0,',','.') . $webconfig['currency'] . ')' ?>
                            <?php } else { ?>
                            0
                            <?php } ?>
                        </td>
                    </tr>

                    <tr>
                        <td class="border--none"></td>
                        <td class="border--none"></td>
                        <td class="border--none"></td>
                        <td class="bg--gray text-right">Phí ship</td>
                        <td class="bg--gray text-right">
                            <?php
                                if(empty($orderDetailData["data"]["shipcost"])){
                                    echo 'Báo giá sau';
                                } else {
                                    echo number_format($orderDetailData["data"]["shipcost"],0,',','.') . $webconfig['currency'];
                                }
                            ?>
                        </td>
                    </tr>
                    <tr>
                        <td class="border--none"></td>
                        <td class="border--none"></td>
                        <td class="border--none"></td>
                        <td class="bg--black text-right">Tổng đơn hàng</td>
                        <td class="bg--black text-right"><?php echo number_format($orderDetailData["data"]["totalorder"],0,',','.') . $webconfig['currency'] ?></td>
                    </tr>
                    </tbody>
                </table>
            </div>

        </div>
    </div>
</div>