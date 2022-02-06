<div class="cart__login__login">
    <div class="cart__login__title">
        <h2>Bạn đã đăng ký khách hàng tại GoodPharma?</h2>
    </div>
    <form id="login__form">
        <div class="cart__login__input">
            <input name="username" type="text" placeholder="Nhập email...">
            <input name="password" type="password" placeholder="Nhập mật khẩu">
        </div>
        <div class="text-danger">
            <span class="login__error"></span>
        </div>
        <div class="cart__login__button--login">
            <button type="submit" class="button__login">
                Đăng nhập
            </button>
        </div>
    </form>

    <div class="cart__login__loginwith">
        <p>Hoặc đăng nhập bằng</p>
    </div>
    <div class="cart__login__social">
        <a class="button__google" href="<?php echo $loginGoogleURL?>">
            Google
        </a>
        <a class="button__facebook" href="javascript:void(0)" onclick="createPopupWin('<?php echo $loginUrl?>','Facebook login', 800, 600);" target="popup">
            Facebook
        </a>
        <a class="button__zalo" href="<?php echo $loginZaloURL?>">
            Zalo
        </a>
    </div>
    <div class="cart__login__footer">
        <a href="<?php echo HTTP_SERVER ?>gbuser/login.gbe?type=register">Đăng ký tài khoản mới</a>
        <a href="<?php echo HTTP_SERVER ?>/gbuser/forgotpassword.gbe">Quên mật khẩu</a>
    </div>
</div>