<section id="activeaccount" class="container">
    <div class="activeaccount__container">
        <h3>
            <?php if($activeAccountData['status'] != 'failed') { ?>
            Xác thực tài khoản thành công!
            <?php } else { ?>
            Xác thực tài khoản không thành công!
            <?php } ?>
        </h3>

        <div>
            <a class="activeaccount__btn activeaccount__btn--continueshopping" href="<?php echo HTTP_SERVER ?>san-pham.html">Tiếp tục mua hàng</a>
            <?php if($activeAccountData['status'] != 'failed') { ?>
            <a class="activeaccount__btn activeaccount__btn--login" href="<?php echo HTTP_SERVER ?>gbuser/login.gbe">Đăng nhập</a>
            <?php } ?>
        </div>
    </div>
</section>