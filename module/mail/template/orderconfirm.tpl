<?php
//$data['customername'] = 'Hưng Phạm';
//$data['ordercode'] = 'HD0001';
//$data['orderurl'] = '#';
//
//$data['ordercreateddate'] = '15/12/2020';
//$data['cardname'] = 'Tran Thien';
//$data['cardmail'] = 'thienmenh199@gmail.com';
//$data['cardphone'] = '0988123456';
//$data['status'] = 'Đã tiếp nhận';
//$data['productlist'] ;
?>

<!doctype html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml"
      xmlns:o="urn:schemas-microsoft-com:office:office">
<head>
    <title>
    </title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style type="text/css">
        #outlook a {
            padding: 0;
        }

        .ReadMsgBody {
            width: 100%;
        }

        .ExternalClass {
            width: 100%;
        }

        .ExternalClass * {
            line-height: 100%;
        }

        body {
            margin: 0;
            padding: 0;
            -webkit-text-size-adjust: 100%;
            -ms-text-size-adjust: 100%;
        }

        table,
        td {
            border-collapse: collapse;
            mso-table-lspace: 0pt;
            mso-table-rspace: 0pt;
        }

        img {
            border: 0;
            height: auto;
            line-height: 100%;
            outline: none;
            text-decoration: none;
            -ms-interpolation-mode: bicubic;
        }

        p {
            display: block;
            margin: 13px 0;
        }
    </style>
    <style type="text/css">
        @media only screen and (max-width: 480px) {
            @-ms-viewport {
                width: 320px;
            }
            @viewport {
                width: 320px;
            }
        }
    </style>
    <style type="text/css">
        @media only screen and (min-width: 480px) {
            .mj-column-per-100 {
                width: 100% !important;
            }
        }
    </style>
    <style type="text/css">
    </style>
</head>
<body style="background-color:#f9f9f9;">
<div style="background-color:#f9f9f9">
    <div style="background:#f9f9f9;background-color:#f9f9f9;Margin:0px auto;max-width:600px">
        <table align="center" border="0" cellpadding="0" cellspacing="0" role="presentation"
               style="background:#f9f9f9;background-color:#f9f9f9;width:100%">
            <tbody>
            <tr>
                <td style="border-bottom:#0182f9 solid 5px;direction:ltr;font-size:0px;padding:20px 0;text-align:center;vertical-align:top">
                </td>
            </tr>
            </tbody>
        </table>
    </div>
    <div style="background:#fff;background-color:#fff;Margin:0px auto;max-width:600px">
        <table align="center" border="0" cellpadding="0" cellspacing="0" role="presentation"
               style="background:#fff;background-color:#fff;width:100%">
            <tbody>
            <tr>
                <td style="border:#dddddd solid 1px;border-top:0px;direction:ltr;font-size:0px;padding:20px 0;text-align:center;vertical-align:top">

                    <div class="m_-2985700777964797137mj-column-per-100"
                         style="font-size:13px;text-align:left;direction:ltr;display:inline-block;vertical-align:bottom;width:100%">
                        <table border="0" cellpadding="0" cellspacing="0" role="presentation"
                               style="vertical-align:bottom" width="100%">
                            <tbody>
                            <tr>
                                <td align="center" style="font-size:0px;padding:10px 25px;word-break:break-word">
                                    <table align="center" border="0" cellpadding="0" cellspacing="0" role="presentation"
                                           style="border-collapse:collapse;border-spacing:0px">
                                        <tbody>
                                        <tr>
                                            <td style="text-align:center">
                                                <img src="<?php echo IMAGE_SERVER ?>fixsize-600x140/<?php echo $data['webconfig']['logodark']?>"
                                                     width="300" height="60" class="CToWUd">
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td align="center"
                                    style="font-size:0px;padding:10px 25px;padding-bottom:40px;word-break:break-word">

                                    <div
                                            style="font-family:'Helvetica Neue',Arial,sans-serif;font-size:32px;font-weight:bold;line-height:1;text-align:center;color:#555">
                                        Xác nhận đơn hàng #<?php echo $data['ordercode']; ?>
                                    </div>

                                </td>
                            </tr>
                            <tr>
                                <td align="center"
                                    style="font-size:0px;padding:10px 25px;padding-bottom:0;word-break:break-word">

                                    <div
                                            style="font-family:'Helvetica Neue',Arial,sans-serif;font-size:16px;line-height:22px;text-align:center;color:#555">
                                        Dear <?php echo $data['membername'] ?>,
                                    </div>

                                </td>
                            </tr>
                            <tr>
                                <td align="center" style="font-size:0px;padding:10px 25px;word-break:break-word">
                                    <div
                                            style="font-family:'Helvetica Neue',Arial,sans-serif;font-size:16px;line-height:22px;text-align:center;color:#555">
                                        Cảm ơn bạn đã quan tâm sản phẩm
                                        của <?php echo $data['webconfig']['businessname']; ?>. Đơn hàng
                                        <strong><?=$data['ordercode']?></strong> của bạn đã được chúng tôi
                                        tiếp nhận.
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td align="center"
                                    style="font-size:0px;padding:10px 25px;padding-bottom:20px;word-break:break-word">
                                    <div
                                            style="font-family:'Helvetica Neue',Arial,sans-serif;font-size:16px;line-height:22px;text-align:center;color:#555">
                                        Để xem chi tiết đơn hàng của mình
                                        tại <?php echo $data['webconfig']['domain']; ?>, bạn có thể <a
                                                href="<?php echo $data['orderurl']; ?>">nhấn
                                            vào đây</a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div style="font-family:'Helvetica Neue',Arial,sans-serif;font-size:16px;padding:10px 15px">
                                        <h4 style="color:#8083c5">THÔNG TIN ĐƠN HÀNG #<?=$data['ordercode']?> (Ngày
                                            đặt <?=$data['ordercreateddate']?>)</h4>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div style="font-family:'Helvetica Neue',Arial,sans-serif;font-size:16px;line-height:28px;padding:0px 15px">
                                        <div style="width:100%">
                                            <b>Thông tin thanh toán</b>
                                        </div>
                                        <table style="width:100%">
                                            <tbody>
                                            <tr>
                                                <td>
                                                    <b>Khách hàng: </b><?=$data['membername']?>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>Email: </b><a href="mailto:<?=$data['memberemail']?>"
                                                                     target="_blank"><?=$data['memberemail']?></a></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>Tình trạng: </b><?=$data['status']?>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>Số điện thoại: </b> <?=$data['memberphone']?>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div style="padding:10px 15px">
                                        <h4 style="font-family:'Helvetica Neue',Arial,sans-serif;font-size:16px;color:#8083c5">
                                            CHI TIẾT ĐƠN HÀNG</h4>
                                        <table style="font-family:'Helvetica Neue',Arial,sans-serif;font-size:13px;line-height:22px;width:100%;border-collapse:collapse">
                                            <thead style="color:#ffffff;background:#7376c0;text-align:left">
                                            <tr style="padding:8px">
                                                <th style="padding:8px">Sản phẩm</th>
                                                <th style="padding:8px;text-align:right">Giá</th>
                                                <th style="padding:8px;text-align:right">SL</th>
                                                <th style="padding:8px;text-align:right">Tổng</th>
                                            </tr>
                                            </thead>
                                            <tbody style="text-align:left">
                                            <?php foreach ($data[productlist] as $product) { ?>
                                            <tr style="background-color:#eaeaea;border-bottom:1px solid #d4d4d4">
                                                <td style="padding:8px;width:28%">
                                                    <?=$product['productname']?>
                                                </td>
                                                <td style="padding:8px;text-align:right;width:11%;white-space:nowrap">
                                                    <?php if ($product['baseprice'] != $product['sellingprice'] || ($product['baseprice'] != ($product['sellingprice'] - ($product['discountamount']/$product['quantity'])))) { ?>
                                                    <p style="margin-bottom: 0; margin-top: 0;">
                                                        <span style="text-decoration: line-through;font-size:85%"><?php echo number_format($product['baseprice'],0,',','.') . $data['webconfig']['currency']; ?></span>
                                                    </p>
                                                    <?php } ?>
                                                    <p style="font-weight:bold; margin-bottom: 0; margin-top: 0;">
                                                        <?php echo number_format(($product['sellingprice'] - ($product['discountamount']/$product['quantity'])),0,',','.') . $data['webconfig']['currency'];; ?>
                                                    </p>
                                                    <p style="margin-bottom: 0; margin-top: 0;">
                                                        <span style="text-decoration: underline;"><?php echo $product['promotioncode']; ?></span>
                                                    </p>
                                                </td>
                                                <td style="padding:8px;text-align:right;width:2%"><?=$product['quantity']?></td>
                                                <td style="padding:8px;text-align:right;width:12%;white-space:nowrap">
                                                    <?=number_format($product['subtotal'],0,',','.') . $data['webconfig']['currency'];?>
                                                </td>
                                            </tr>
                                            <?php } ?>
                                            <tr style="background-color:#eaeaea;border-bottom:1px solid #d4d4d4">
                                                <td></td>
                                                <td></td>
                                                <td style="padding:8px;text-align:right;width:11%;white-space:nowrap">
                                                    <b>Tạm tính</b>
                                                </td>
                                                <td style="padding:8px;text-align:right;width:11%;white-space:nowrap">
                                                    <?=number_format($data['totallines'],0,',','.') . $data['webconfig']['currency'];?>
                                                </td>

                                            </tr>
                                            <tr style="background-color:#eaeaea;border-bottom:1px solid #d4d4d4">
                                                <td></td>
                                                <td></td>
                                                <td style="padding:8px;text-align:right;width:11%;white-space:nowrap">
                                                    <b>Khuyến mãi</b>
                                                </td>
                                                <td style="padding:8px;text-align:right;width:11%;white-space:nowrap">
                                                    <?=number_format($data['discountamount'],0,',','.') . $data['webconfig']['currency'];?>
                                                </td>
                                            </tr>
                                            <tr style="background-color:#eaeaea;border-bottom:1px solid #d4d4d4">
                                                <td></td>
                                                <td></td>
                                                <td style="padding:8px;text-align:right;width:11%;white-space:nowrap">
                                                    <b>Phí giao hàng</b>
                                                </td>
                                                <td style="padding:8px;text-align:right;width:11%;white-space:nowrap">
                                                    <?php
                                                        if (empty($data['ordershipprice'])){
                                                            echo 'Báo giá sau';
                                                        } else {
                                                            echo number_format($data['shipcost'],0,',','.') . $data['webconfig']['currency'];
                                                        }
                                                    ?>
                                                </td>
                                            </tr>
                                            <tr style="background-color:#eaeaea;border-bottom:1px solid #d4d4d4">
                                                <td></td>
                                                <td></td>
                                                <td style="padding:8px;text-align:right;width:11%;white-space:nowrap">
                                                    <b>Thanh toán</b>
                                                </td>
                                                <td style="padding:8px;text-align:right;width:11%;white-space:nowrap">
                                                    <?=number_format($data['totalorder'],0,',','.') . $data['webconfig']['currency']; ?>
                                                </td>
                                            </tr>

                                            </tbody>
                                            <tfoot style="text-align:right">
                                            </tfoot>
                                        </table>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
    <div style="Margin:0px auto;max-width:600px">
        <table align="center" border="0" cellpadding="0" cellspacing="0" role="presentation" style="width:100%">
            <tbody>
            <tr>
                <td style="direction:ltr;font-size:0px;padding:20px 0;text-align:center;vertical-align:top">
                    <div class="m_-2985700777964797137mj-column-per-100"
                         style="font-size:13px;text-align:left;direction:ltr;display:inline-block;vertical-align:bottom;width:100%">
                        <table border="0" cellpadding="0" cellspacing="0" role="presentation" width="100%">
                            <tbody>
                            <tr>
                                <td style="vertical-align:bottom;padding:0">
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </td>
            </tr>
            </tbody>
        </table>
        <div class="yj6qo"></div>
        <div class="adL">
        </div>
    </div>
    <div class="adL">
    </div>
</div>
</body>
</html>