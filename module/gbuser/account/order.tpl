<style>
    .account__sidebar__order{
        background-color: #E2E2E2;
    }
</style>
<div class="order">
    <div class="order__container container">
        <nav class="account__breadcrumb">
            <a class="breadbrum__active" href="<?php echo HTTP_SERVER ?>">Trang chủ</a>
            <span>/</span>
            <a class="breadbrum__noactive"> Đơn hàng của tôi</a>
        </nav>
        <div class="order__row row">
            <div class="order__col-md-3 col-md-3">
                <div class="order__sidebar">
                    <?php include("account_sidebar.php")?>
                </div>
            </div>

            <div class="order__col-md-9 col-md-9">
                <div class="order__content">
                    <p class="order__content__heading">Đơn hàng của tôi</p>
                    <div class="order__content__table">
                        <table>
                            <thead>
                            <tr>
                                <th style="width:15%;min-width:136px">Ngày đặt hàng</th>
                                <th style="width:25%;min-width:132px">Hóa đơn</th>
                                <th style="width:18%;min-width:140px">Tổng</th>
                                <th style="width:22%;min-width:108px">Trạng thái</th>
                                <th style="width:25%;min-width:276px">Giao hàng tới</th>
                            </tr>
                            </thead>
                            <tbody>
                            <?php if (!empty($orderList)) { ?>
                            <?php foreach($orderList as $key => $order){ ?>
                            <tr>
                                <td style="text-align: center">
                                    <span><?php echo $order['ordercreateddate'] ?></span>
                                </td>
                                <td style="text-align: center">
                                    <a target="_blank" href="<?php echo HTTP_SERVER?>gbuser/account/orderdetail.gbe?ordercode=<?php echo $key ?>"><?php echo $key?></a>
                                </td>
                                <td style="text-align: center">
                                    <span><?php echo number_format($order['totalorder'],0,',','.')?>&nbsp;VND</span>
                                </td>
                                <td style="text-align: center"><span><strong><?php echo $order['orderstatus'] ?></strong></span></td>
                                <td>
                                    <?php if ($order['iscollect'] == 1) { ?>
                                    Đến nơi nhận hàng: <br>
                                    <?php echo $webconfig['address']; ?>
                                    <?php } else { ?>
                                    <span><?php echo $order['shipaddress'] ?></span><br>
                                    <span><?php echo $order['wardtext'] ?></span><br>
                                    <span><?php echo $order['districttext'] ?></span><br>
                                    <span><?php echo $order['citytext'] ?></span><br>
                                    <?php } ?>

                                </td>
                            </tr>
                            <?php } ?>
                            <?php } ?>
                            </tbody>
                        </table>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>