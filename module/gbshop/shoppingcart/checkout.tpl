<!--
    <div class="checkout__progressbar">
        <ul class="checkout__timeline" id="timeline">
            <li class="checkout__li--complete">
                <div class="checkout__timestamp">
                    <span class="checkout__author">Đăng nhập</span>
                </div>
                <div class="checkout__status">
                </div>
            </li>

            <li class="checkout__li--complete">
                <div class="checkout__timestamp">
                    <span class="checkout__author">Địa chỉ giao hàng</span>
                </div>
                <div class="checkout__status">
                </div>
            </li>
            <li class="checkout__li">
                <div class="checkout__timestamp">
                    <span class="checkout__author">Thanh toán & Đặt mua</span>
                </div>
                <div class="checkout__status">
                </div>
            </li>
        </ul>
    </div>

    <div class="checkout__cart__nav">
        <svg width="16" height="16" viewBox="0 0 1792 1792" xmlns="http://www.w3.org/2000/svg">
            <path d="M1203 544q0 13-10 23l-393 393 393 393q10 10 10 23t-10 23l-50 50q-10 10-23 10t-23-10l-466-466q-10-10-10-23t10-23l466-466q10-10 23-10t23 10l50 50q10 10 10 23z"></path>
        </svg>
        <a href="https://demo.webe.vn/themade/vi-vn/cart.html" class="align-middle">&nbsp;Trở về giỏ hàng</a></div>
-->
<!--
    <form id="checkoutForm" name="checkoutForm">
        <div class="checkout__row">
            <div class="checkout__col--6">

                <h5 class="checkout__form__title">Thông tin người mua</h5>

                <div class="checkout__form">
                    <div class="checkout__row">
                        <div class="checkout__col--4">
                            <label for="name">Họ tên:<span>*</span></label>
                        </div>
                        <div class="checkout__col--8">
                            <input type="text" id="name" name="name" value="">
                        </div>
                    </div>
                    <div class="checkout__row">
                        <div class="checkout__col--4">
                            <label for="email">Email:<span>*</span></label>
                        </div>
                        <div class="checkout__col--8">
                            <input type="text" id="email" name="email" value="">
                        </div>
                    </div>
                    <div class="checkout__row">
                        <div class="checkout__col--4">
                            <label for="phone">Điện thoại:<span>*</span></label>
                        </div>
                        <div class="checkout__col--8">
                            <input type="text" id="phone" name="phone" value="">
                        </div>
                    </div>
                    <div class="checkout__row">
                        <div class="checkout__col--4">
                            <label for="address">Địa chỉ:<span>*</span></label>
                        </div>
                        <div class="checkout__col--8">
                            <input type="text" id="address" name="address" value="">
                        </div>
                    </div>
                    <div class="checkout__row">
                        <div class="checkout__col--4">
                            <label for="card-province">Tỉnh/Thành:<span>*</span></label>
                        </div>
                        <div class="checkout__col--8">
                            <select id="card-province" name="card-province">
                                <option value="">Chọn tỉnh/thành</option>
                            </select>
                        </div>
                    </div>
                    <div class="checkout__row">
                        <div class="checkout__col--4">
                            <label class="form-label" for="card-district">Quận/Huyện:<span>*</span></label>
                        </div>
                        <div class="checkout__col--8">
                            <select type="text" class="form-control" id="card-district" name="card-district">
                                <option value="">Chọn quận/huyện</option>
                            </select>
                        </div>
                    </div>
                    <div class="checkout__row">
                        <div class="checkout__col--4">
                            <label for="card-ward">Phường/Xã:<span>*</span></label>
                        </div>
                        <div class="checkout__col--8">
                            <select type="text" id="card-ward" name="card-ward">
                                <option value="">Chọn phường/xã</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>

            <!-- ********************** Địa chỉ giao hàng **********************

            <div class="checkout__col--6">
                <div class="checkout__shippingaddress__header">
                    <h5 >Địa chỉ giao hàng</h5>
                    <a href="javascript:void(0)">Thêm địa chỉ mới</a>
                </div>

                <div class="checkout__form">
                    <div class="checkout__address__item">
                        <div class="checkout__address__item__row">
                            <span><strong>Hung Pham</strong> - 0972127371</span>
                            <a href="javascript:void(0)">
                                <svg width="20" height="20" viewBox="0 0 1792 1792" xmlns="http://www.w3.org/2000/svg"><path d="M1490 1322q0 40-28 68l-136 136q-28 28-68 28t-68-28l-294-294-294 294q-28 28-68 28t-68-28l-136-136q-28-28-28-68t28-68l294-294-294-294q-28-28-28-68t28-68l136-136q28-28 68-28t68 28l294 294 294-294q28-28 68-28t68 28l136 136q28 28 28 68t-28 68l-294 294 294 294q28 28 28 68z"/></svg>
                            </a>
                        </div>
                        <div>28 Mai Chí Thọ Phường An Lạc, Quận 2.</div>
                        <div class="checkout__address__item__row"><a href="javascript:void(0)">Sửa</a></div>
                    </div>
                    <div class="checkout__address__item">
                        <div class="checkout__address__item__row">
                            <span><strong>Hung Pham</strong> - 0972127371</span>
                            <a href="javascript:void(0)">
                                <svg width="20" height="20" viewBox="0 0 1792 1792" xmlns="http://www.w3.org/2000/svg"><path d="M1490 1322q0 40-28 68l-136 136q-28 28-68 28t-68-28l-294-294-294 294q-28 28-68 28t-68-28l-136-136q-28-28-28-68t28-68l294-294-294-294q-28-28-28-68t28-68l136-136q28-28 68-28t68 28l294 294 294-294q28-28 68-28t68 28l136 136q28 28 28 68t-28 68l-294 294 294 294q28 28 28 68z"/></svg>
                            </a>
                        </div>
                        <div>28 Mai Chí Thọ Phường An Lạc, Quận 2.</div>
                        <div class="checkout__address__item__row"><a href="javascript:void(0)">Sửa</a></div>
                    </div>
                    <div class="checkout__address__item">
                        <div class="checkout__address__item__row">
                            <span><strong>Hung Pham</strong> - 0972127371</span>
                            <a href="javascript:void(0)">
                                <svg width="20" height="20" viewBox="0 0 1792 1792" xmlns="http://www.w3.org/2000/svg"><path d="M1490 1322q0 40-28 68l-136 136q-28 28-68 28t-68-28l-294-294-294 294q-28 28-68 28t-68-28l-136-136q-28-28-28-68t28-68l294-294-294-294q-28-28-28-68t28-68l136-136q28-28 68-28t68 28l294 294 294-294q28-28 68-28t68 28l136 136q28 28 28 68t-28 68l-294 294 294 294q28 28 28 68z"/></svg>
                            </a>
                        </div>
                        <div>28 Mai Chí Thọ Phường An Lạc, Quận 2.</div>
                        <div class="checkout__address__item__row"><a href="javascript:void(0)">Sửa</a></div>
                    </div>
                    <div class="checkout__address__item">
                        <div class="checkout__address__item__row">
                            <span><strong>Hung Pham</strong> - 0972127371</span>
                            <a href="javascript:void(0)">
                                <svg width="20" height="20" viewBox="0 0 1792 1792" xmlns="http://www.w3.org/2000/svg"><path d="M1490 1322q0 40-28 68l-136 136q-28 28-68 28t-68-28l-294-294-294 294q-28 28-68 28t-68-28l-136-136q-28-28-28-68t28-68l294-294-294-294q-28-28-28-68t28-68l136-136q28-28 68-28t68 28l294 294 294-294q28-28 68-28t68 28l136 136q28 28 28 68t-28 68l-294 294 294 294q28 28 28 68z"/></svg>
                            </a>
                        </div>
                        <div>28 Mai Chí Thọ Phường An Lạc, Quận 2.</div>
                        <div class="checkout__address__item__row"><a href="javascript:void(0)">Sửa</a></div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <div class="checkout__btntocheckout">
        <a onclick="validateInputData()">Tiến hành thanh toán</a>
    </div>
    -->
<div class="checkout">
    <h2 class="checkout__title">Thông tin người mua</h2>
    <div class="checkout__row">
        <div class="checkout__col--8">
            <form class="checkout__buyerinfo">
                <div class="checkout__formgroup">
                    <label for="name">Họ tên:</label>
                    <input type="text" id="name">
                </div>
                <div class="checkout__formgroup">
                    <label for="email">Email:</label>
                    <input type="text" id="email">
                </div>
                <div class="checkout__formgroup">
                    <label for="phone">Điện thoại:</label>
                    <input type="text" id="phone">
                </div>
                <div class="checkout__formgroup">
                    <label for="address">Địa chỉ:</label>
                    <input type="text" id="address">
                </div>
                <div class="checkout__formgroup">
                    <label for="city">Tỉnh/Thành:</label>
                    <select id="city">
                        <option value="">Chọn Tỉnh/Thành</option>
                    </select>
                </div>
                <div class="checkout__formgroup">
                    <label for="district">Quận/Huyện:</label>
                    <select id="district">
                        <option value="">Chọn Quận/Huyện</option>
                    </select>
                </div>
                <div class="checkout__formgroup">
                    <label for="ward">Phường/Xã:</label>
                    <select id="ward">
                        <option value="">Chọn Phường/Xã</option>
                    </select>
                </div>
            </form>
            <div class="checkout__btntopayment">
                <button type="button">TIẾN HÀNH THANH TOÁN</button>
            </div>
        </div>
        <div class="checkout__col--4">
            <div class="checkout__rightcol__item">
                <div class="checkout__rightcol__item__title">
                    <span>Địa chỉ giao hàng</span>
                    <a href="javascript:void(0)">Sửa</a>
                </div>
                <div class="checkout__shippingaddress">
                    <span class="checkout__shippingaddress__name">Đặng Khiết Nghi</span>
                    <span>28 Mai Chí Thọ, Phường An Phú, Quận 2, Hồ Chí Minh Việt Nam</span>
                    <span>Điện thoại: 0962763499</span>
                </div>
            </div>
        </div>


    </div>
</div>