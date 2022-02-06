<style>
    .account__sidebar__profile{
        background-color: #E2E2E2;
    }
</style>
<div class="profile">
    <div class="profile__container container">
        <nav class="account__breadcrumb">
            <a class="breadbrum__active" href="<?php echo HTTP_SERVER ?>">Trang chủ</a>
            <span>/</span>
            <a class="breadbrum__noactive"> Tài khoản của tôi</a>
            <?php echo $breadcrumb ?>
        </nav>
        <div class="profile__row row">
            <div class="profile__col-md-3 col-md-3">
                <div class="profile__sidebar">
                    <?php include("account_sidebar.php")?>
                </div>
            </div>

            <div class="profile__col-md-9 col-md-9">
                <div class="profile__content">
                    <p class="profile__content__heading">Thông tin tài khoản</p>
                    <table class="table">
                        <tbody>
                        <tr>
                            <td style="width:25%;">Tên tài khoản</td>
                            <td class="profile__content__membername"><?php echo $account['membername'] ?></td>
                        </tr>
                        <tr>
                            <td>Số điện thoại</td>
                            <td class="profile__content__memberphone"><?php echo $account['memberphone'] ?></td>
                        </tr>
                        <tr>
                            <td>Email</td>
                            <td><?php echo $account['memberemail'] ?></td>
                        </tr>
                        <!--
                        <tr>
                            <td>Sinh nhật</td>
                            <td><?php echo explode(" ",$account['birthday'])[0] ?></td>
                        </tr>
                        -->
                        <tr>
                            <td>Ngày đăng ký</td>
                            <td><?php echo explode(" ",$account['registerdate'])[0] ?></td>
                        </tr>
                        <!--
                        <tr>
                            <td>Giới tính</td>
                            <td><?php echo ucfirst($account['gender']) ?></td>
                        </tr>
                        -->
                        <tr>
                            <td>Tổng số tiền đã mua</td>
                            <td><?php echo number_format($account['totaldeposits'],0,',','.') ?>&nbsp;VND</td>
                        </tr>
                        <!--<tr>
                            <td>Đã tham gia đấu giá</td>
                            <td>11 phiên</td>
                        </tr>
                        <tr>
                            <td>Ví điểm</td>
                            <td>Hiện có: 320 điểm | Đã dùng: 2188 điểm</td>
                        </tr>
                        <tr>
                            <td>Ví tiền mặt</td>
                            <td>Hiện có: 0đ | Đã rút: 0đ</td>
                        </tr>
                        <tr>
                            <td>Ví tích lũy</td>
                            <td>Hiện có: 0đ | Đã chuyển: 0đ</td>
                        </tr>-->
                        </tbody>
                    </table>
                </div>
            </div>

        </div>
    </div>
</div>