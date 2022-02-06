<?php if(!empty($userid)) { ?>
<div id="modal__updateaccount">
    <div class="modal__updateaccount__content">
        <a href="javascript:void(0)" id="modal__updateaccount__close" class="modal__updateaccount__close">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 352 512">
                <path d="M242.72 256l100.07-100.07c12.28-12.28 12.28-32.19 0-44.48l-22.24-22.24c-12.28-12.28-32.19-12.28-44.48 0L176 189.28 75.93 89.21c-12.28-12.28-32.19-12.28-44.48 0L9.21 111.45c-12.28 12.28-12.28 32.19 0 44.48L109.28 256 9.21 356.07c-12.28 12.28-12.28 32.19 0 44.48l22.24 22.24c12.28 12.28 32.2 12.28 44.48 0L176 322.72l100.07 100.07c12.28 12.28 32.2 12.28 44.48 0l22.24-22.24c12.28-12.28 12.28-32.19 0-44.48L242.72 256z"/>
            </svg>
        </a>
        <div class="updateaccount__avatar">
            <span><?php echo @$_GET['avatar']?></span>
        </div>
        <form id="frm_updateaccount">
            <div id="updateaccount__error" class="help-block with-errors"></div>
            <input type="hidden" name="userid" value="<?php echo $userid?>">
            <input type="hidden" name="type" value="<?php echo @$_GET['type']?>">
            <div class="updateaccount__row">
                <label for="updateaccount__fullname">Họ tên: </label>
                <input id="updateaccount__fullname" name="name" type="text" value="<?php echo @$_GET['name']?>">
            </div>
            <div class="updateaccount__row">
                <label for="updateaccount__email">Email: </label>
                <input id="updateaccount__email" name="email" type="text" value="<?php echo @$_GET['email']?>">
            </div>
            <div class="updateaccount__row">
                <label for="updateaccount__phone">Phone: </label>
                <input id="updateaccount__phone" name="phone" type="text" value="<?php echo @$_GET['phone']?>">
            </div>
            <div class="updateaccount__row">
                <button type="submit">Xác nhận</button>
            </div>
        </form>
    </div>
</div>
<?php } ?>
<div class="login__option__tab">
    <div id="login_tab" class="nav__item <?php echo @$_GET['type'] != 'register' ? 'active' : '' ?>" onclick="show_element('register','login','register_tab','login_tab')">Đăng nhập</div>
    <div id="register_tab" class="nav__item <?php echo @$_GET['type'] == 'register' ? 'active' : '' ?>" onclick="show_element('login','register','login_tab','register_tab')">Tạo tài khoản</div>
</div>

<div id="login" class="login">
    <div class="login__container container">
        <div class="login__heading">Đăng nhập</div>
        <form id="login__form" method="POST">
            <div class="mb--24">
                <label for="username">Email: </label>
                <input name="username" type="text" placeholder="Nhập email...">
            </div>

            <div class="mb--24">
                <label for="password">Mật khẩu: </label>
                <input name="password" type="password" placeholder="Nhập mật khẩu">
            </div>
            <div class="mb--24">
                <span class="login__error"></span>
            </div>
            <div class="mb--24">
                <a class="login__forgotpassword" href="<?php echo HTTP_SERVER ?>gbuser/forgotpassword.gbe">Quên mật khẩu?</a>
            </div>

            <button class="login__btn--login">Đăng nhập</button>

            <a class="login__btn--facebook" href="javascript:void(0)"
               onclick="createPopupWin('<?php echo $loginUrl?>','Facebook login', 800, 600);" target="popup">
                <span>
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512">
                        <path d="M279.14 288l14.22-92.66h-88.91v-60.13c0-25.35 12.42-50.06 52.24-50.06h40.42V6.26S260.43 0 225.36 0c-73.22 0-121.08 44.38-121.08 124.72v70.62H22.89V288h81.39v224h100.17V288z"/>
                    </svg>
                </span>Đăng nhập bằng Facebook
            </a>


            <!--<a class="login__btn--facebook">
                <span>
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512">
                        <path d="M279.14 288l14.22-92.66h-88.91v-60.13c0-25.35 12.42-50.06 52.24-50.06h40.42V6.26S260.43 0 225.36 0c-73.22 0-121.08 44.38-121.08 124.72v70.62H22.89V288h81.39v224h100.17V288z"/>
                    </svg>
                </span>Đăng nhập bằng Facebook
            </a>-->


            <a class="login__btn--google" href="<?php echo $loginGoogleURL?>">
                <span>
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512">
                        <path d="M386.061 228.496c1.834 9.692 3.143 19.384 3.143 31.956C389.204 370.205 315.599 448 204.8 448c-106.084 0-192-85.915-192-192s85.916-192 192-192c51.864 0 95.083 18.859 128.611 50.292l-52.126 50.03c-14.145-13.621-39.028-29.599-76.485-29.599-65.484 0-118.92 54.221-118.92 121.277 0 67.056 53.436 121.277 118.92 121.277 75.961 0 104.513-54.745 108.965-82.773H204.8v-66.009h181.261zm185.406 6.437V179.2h-56.001v55.733h-55.733v56.001h55.733v55.733h56.001v-55.733H627.2v-56.001h-55.733z"/>
                    </svg>
                </span>Đăng nhập bằng Google
            </a>

            <!--<a class="login__btn--google">
                <span>
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512">
                        <path d="M386.061 228.496c1.834 9.692 3.143 19.384 3.143 31.956C389.204 370.205 315.599 448 204.8 448c-106.084 0-192-85.915-192-192s85.916-192 192-192c51.864 0 95.083 18.859 128.611 50.292l-52.126 50.03c-14.145-13.621-39.028-29.599-76.485-29.599-65.484 0-118.92 54.221-118.92 121.277 0 67.056 53.436 121.277 118.92 121.277 75.961 0 104.513-54.745 108.965-82.773H204.8v-66.009h181.261zm185.406 6.437V179.2h-56.001v55.733h-55.733v56.001h55.733v55.733h56.001v-55.733H627.2v-56.001h-55.733z"/>
                    </svg>
                </span>Đăng nhập bằng Google
            </a>-->

            <a class="login__btn--zalo" href="<?php echo $loginZaloURL?>">
                <span>
                    <img width="20" height="20"
                         src="<?php echo HTTP_SERVER?>module/gbuser/theme/images/zalo-logo.png" alt="zalo logo">
                </span>Đăng nhập bằng Zalo
            </a>
            <!--
            <a class="login__btn--zalo">
                <span>
                    <img width="20" height="20"
                         src="<?php echo HTTP_SERVER?>module/gbuser/theme/images/zalo-logo.png" alt="zalo logo">
                </span>Đăng nhập bằng Zalo
            </a>-->
        </form>
        <!-- /.End of Login -->
    </div>
</div>


<div id="register" class="register" style="display: none">
    <div class="register__container container">
        <div class="register__heading">Đăng ký</div>
        <form id="register__form">
            <div class="mb--24">
                <label for="membername">Tên(*): </label>
                <input name="membername" type="text" placeholder="Nhập tên">
            </div>
            <div class="mb--24">
                <label for="memberphone">SĐT(*): </label>
                <input id="memberphone" name="memberphone" type="tel" placeholder="Nhập số điện thoại">
            </div>
            <div class="mb--24">
                <label for="memberemail">Email(*): </label>
                <input name="memberemail" type="email" placeholder="Nhập email">
            </div>
            <div class="mb--24">
                <label for="password">Mật khẩu(*):</label>
                <input id="register__password" name="password" type="password" placeholder="Mật khẩu từ 6 đến 15 ký tự">
            </div>
            <div class="mb--24">
                <label for="confirmpassword">Nhập lại mật khẩu(*):</label>
                <input name="confirmpassword" type="password" placeholder="Mật khẩu từ 6 đến 15 ký tự">
            </div>
            <!--<div class="mb--24">
                <label for="address">Địa chỉ(*):</label>
                <input name="address" type="text" placeholder="Nhập địa chỉ">
            </div>-->
            <div class="mb--24">
                <span class="register__error help-block with-errors"></span>
            </div>
            <button class="register__btn--login">Đăng ký</button>

        </form>
        <!-- /.End of Login -->
    </div>
</div>

<div class="modalLoading"><!--Loading--></div>
<div id="modal__annoucement" class="gbmodal" style="display: none;">
    <!-- Modal content -->
    <div class="gbmodal__inner text-center">
        <div class="gbmodal__content mb-4"></div>
        <div class="gbFooter">
            <a class="modal__announcemnet__close btn btn-primary text-white">OK</a>
        </div>
    </div>
</div>

