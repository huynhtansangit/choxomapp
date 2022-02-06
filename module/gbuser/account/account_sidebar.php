<div class="account__info__member">
    <div class="account__avatar">
        <!--<img width="40" height="40" class="" alt="Avatar of user"
             srcset="<?php echo HTTP_SERVER ?>assets/img/avatar-3.png 1.25x, <?php echo HTTP_SERVER ?>assets/img/avatar-3.png 2x"
             src="<?php echo HTTP_SERVER ?>assets/img/avatar-3.png">-->
        <div style="width: 40px; height: 40px; background-color: #008D3F; border-radius: 50%; color: #fff; display: flex; justify-content: center; align-items: center;">
            <?php echo $_SESSION['loginmembername'][0]; ?>
        </div>
        
    </div>
    <div class="account__name"><?php echo $_SESSION['loginmembername'] ?></div>
    <div class="account__phone"><?php echo $_SESSION['loginmemberphone'] ?></div>
</div>
<div class="account__sidebar__group" style="padding-left: 20px; padding-right: 20px;">
    <div class="quick__search">
        <p>Tìm kiếm:</p>

        <form action="" id="quick__search__form">
            <input name="cartCode" type="text" placeholder="Nhập mã đơn hàng">
            <button type="submit" class="submit__form">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                    <!-- Font Awesome Free 5.15.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free (Icons: CC BY 4.0, Fonts: SIL OFL 1.1, Code: MIT License) -->
                    <path
                        d="M505 442.7L405.3 343c-4.5-4.5-10.6-7-17-7H372c27.6-35.3 44-79.7 44-128C416 93.1 322.9 0 208 0S0 93.1 0 208s93.1 208 208 208c48.3 0 92.7-16.4 128-44v16.3c0 6.4 2.5 12.5 7 17l99.7 99.7c9.4 9.4 24.6 9.4 33.9 0l28.3-28.3c9.4-9.4 9.4-24.6.1-34zM208 336c-70.7 0-128-57.2-128-128 0-70.7 57.2-128 128-128 70.7 0 128 57.2 128 128 0 70.7-57.2 128-128 128z"/>
                </svg>
            </button>
        </form>
        <div id="quick__search__error"></div>
    </div>

</div>
<ul class="account__sidebar__group">
    <li class="account__sidebar__order">
        <a href="<?php echo HTTP_SERVER ?>gbuser/account/order.gbe">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                <!-- Font Awesome Free 5.15.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free (Icons: CC BY 4.0, Fonts: SIL OFL 1.1, Code: MIT License) -->
                <path
                    d="M80 368H16a16 16 0 0 0-16 16v64a16 16 0 0 0 16 16h64a16 16 0 0 0 16-16v-64a16 16 0 0 0-16-16zm0-320H16A16 16 0 0 0 0 64v64a16 16 0 0 0 16 16h64a16 16 0 0 0 16-16V64a16 16 0 0 0-16-16zm0 160H16a16 16 0 0 0-16 16v64a16 16 0 0 0 16 16h64a16 16 0 0 0 16-16v-64a16 16 0 0 0-16-16zm416 176H176a16 16 0 0 0-16 16v32a16 16 0 0 0 16 16h320a16 16 0 0 0 16-16v-32a16 16 0 0 0-16-16zm0-320H176a16 16 0 0 0-16 16v32a16 16 0 0 0 16 16h320a16 16 0 0 0 16-16V80a16 16 0 0 0-16-16zm0 160H176a16 16 0 0 0-16 16v32a16 16 0 0 0 16 16h320a16 16 0 0 0 16-16v-32a16 16 0 0 0-16-16z"/>
            </svg>
            Đơn hàng của tôi
        </a>
    </li>
    <li class="account__sidebar__carts">
        <a href="<?php echo HTTP_SERVER ?>gbuser/account/carts.gbe">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512">
                <!-- Font Awesome Free 5.15.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free (Icons: CC BY 4.0, Fonts: SIL OFL 1.1, Code: MIT License) -->
                <path
                    d="M504.717 320H211.572l6.545 32h268.418c15.401 0 26.816 14.301 23.403 29.319l-5.517 24.276C523.112 414.668 536 433.828 536 456c0 31.202-25.519 56.444-56.824 55.994-29.823-.429-54.35-24.631-55.155-54.447-.44-16.287 6.085-31.049 16.803-41.548H231.176C241.553 426.165 248 440.326 248 456c0 31.813-26.528 57.431-58.67 55.938-28.54-1.325-51.751-24.385-53.251-52.917-1.158-22.034 10.436-41.455 28.051-51.586L93.883 64H24C10.745 64 0 53.255 0 40V24C0 10.745 10.745 0 24 0h102.529c11.401 0 21.228 8.021 23.513 19.19L159.208 64H551.99c15.401 0 26.816 14.301 23.403 29.319l-47.273 208C525.637 312.246 515.923 320 504.717 320zM408 168h-48v-40c0-8.837-7.163-16-16-16h-16c-8.837 0-16 7.163-16 16v40h-48c-8.837 0-16 7.163-16 16v16c0 8.837 7.163 16 16 16h48v40c0 8.837 7.163 16 16 16h16c8.837 0 16-7.163 16-16v-40h48c8.837 0 16-7.163 16-16v-16c0-8.837-7.163-16-16-16z"></path>
            </svg>
            Giỏ hàng của tôi
        </a>
    </li>
    <li class="account__sidebar__profile">
        <a href="<?php echo HTTP_SERVER ?>gbuser/account/profile.gbe">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">
                <!-- Font Awesome Free 5.15.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free (Icons: CC BY 4.0, Fonts: SIL OFL 1.1, Code: MIT License) -->
                <path
                    d="M224 256c70.7 0 128-57.3 128-128S294.7 0 224 0 96 57.3 96 128s57.3 128 128 128zm89.6 32h-16.7c-22.2 10.2-46.9 16-72.9 16s-50.6-5.8-72.9-16h-16.7C60.2 288 0 348.2 0 422.4V464c0 26.5 21.5 48 48 48h352c26.5 0 48-21.5 48-48v-41.6c0-74.2-60.2-134.4-134.4-134.4z"/>
            </svg>
            Tài khoản của tôi
        </a>
    </li>
</ul>
<ul class="account__sidebar__group">
    <li class="account__sidebar__changepassword">
        <a href="<?php echo HTTP_SERVER ?>gbuser/account/changepassword.gbe">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">
                <!-- Font Awesome Free 5.15.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free (Icons: CC BY 4.0, Fonts: SIL OFL 1.1, Code: MIT License) -->
                <path
                    d="M400 256H152V152.9c0-39.6 31.7-72.5 71.3-72.9 40-.4 72.7 32.1 72.7 72v16c0 13.3 10.7 24 24 24h32c13.3 0 24-10.7 24-24v-16C376 68 307.5-.3 223.5 0 139.5.3 72 69.5 72 153.5V256H48c-26.5 0-48 21.5-48 48v160c0 26.5 21.5 48 48 48h352c26.5 0 48-21.5 48-48V304c0-26.5-21.5-48-48-48zM264 408c0 22.1-17.9 40-40 40s-40-17.9-40-40v-48c0-22.1 17.9-40 40-40s40 17.9 40 40v48z"/>
            </svg>
            Đổi mật khẩu
        </a>
    </li>
    <li>
        <a href="<?php echo HTTP_SERVER ?>gbuser/ajax/logout.gbe">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                <!-- Font Awesome Free 5.15.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free (Icons: CC BY 4.0, Fonts: SIL OFL 1.1, Code: MIT License) -->
                <path
                    d="M497 273L329 441c-15 15-41 4.5-41-17v-96H152c-13.3 0-24-10.7-24-24v-96c0-13.3 10.7-24 24-24h136V88c0-21.4 25.9-32 41-17l168 168c9.3 9.4 9.3 24.6 0 34zM192 436v-40c0-6.6-5.4-12-12-12H96c-17.7 0-32-14.3-32-32V160c0-17.7 14.3-32 32-32h84c6.6 0 12-5.4 12-12V76c0-6.6-5.4-12-12-12H96c-53 0-96 43-96 96v192c0 53 43 96 96 96h84c6.6 0 12-5.4 12-12z"/>
            </svg>
            Đăng xuất
        </a>
    </li>
</ul>

<script>
    document.getElementById("quick__search__form").addEventListener("submit", function (e) {
        e.preventDefault();
        var formData = new FormData(), ordercode = e.target.querySelector("input").value;
        formData.append('ordercode', ordercode);

        xhr("<?php echo HTTP_SERVER ?>gbshop/ajax/getOrderDetailByToken.gbe", formData, function (res) {
            var data = JSON.parse(res);
            if (data["error"])
                document.getElementById('quick__search__error').innerHTML = data["error"];
            else {
                var url = "<?php echo HTTP_SERVER?>gbuser/account/orderdetailbytoken.gbe?ordertoken=" + data["ordertoken"];
                document.getElementById('quick__search__error').innerHTML="";
                window.open(url, "_blank");
            }
        });
    });
</script>