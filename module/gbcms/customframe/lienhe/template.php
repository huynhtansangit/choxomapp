<link rel="stylesheet" href="<?php echo HTTP_SERVER ?>module/gbcms/customframe/lienhe/style.css">
<!--<script src="<?php /*echo HTTP_SERVER */?>module/gbcms/customframe/dangtoathuoc/script.js"></script>-->

<section id="contact">
    <div class="contact__banner">
        <img width="100%" height="465"
             srcset="<?php echo HTTP_SERVER ?>module/gbcms/customframe/lienhe/img/contact_banner.jpg?v=<?php echo IMAGE_VERSION ?> 1.25x,
                <?php echo HTTP_SERVER ?>module/gbcms/customframe/lienhe/img/contact_banner.jpg?v=<?php echo IMAGE_VERSION ?> 2x"
             src="<?php echo HTTP_SERVER ?>module/gbcms/customframe/lienhe/img/contact_banner.jpg?v=<?php echo IMAGE_VERSION ?>" alt="contact banner">
    </div>
    <div class="contact__content__wrapper container">
        <div class="contact__content">
            <div class="contact__content__row row">
                <div class="contact__1col col-lg-1"></div>
                <div class="contact__description col-lg-4">
                    <h1>GOODPHARMA - G.P NGỌC TUYẾT</h1>
                    <?php if(!empty($webconfig['address'])) { ?><div class="contact__description__location"><?php echo $webconfig['address'] ?></div><?php } ?>
                    <div class="contact__descripton__info contact__description__hotline">
                        <p>Hotline đặt hàng và chăm sóc khách hàng</p>
                        <div>
                            <?php if(!empty($webconfig['hotline'])) { ?>
                            <a href="tel:<?php echo $webconfig['hotline']?>">
                                <img width="14" height="14"
                                     srcset="<?php echo HTTP_SERVER ?>module/gbcms/customframe/lienhe/img/phone.png?v=<?php echo IMAGE_VERSION?> 1.25x,
                                            <?php echo HTTP_SERVER ?>module/gbcms/customframe/lienhe/img/phone.png?v=<?php echo IMAGE_VERSION?> 2x"
                                     src="<?php echo HTTP_SERVER ?>module/gbcms/customframe/lienhe/img/phone.png?v=<?php echo IMAGE_VERSION?>" alt="phone icon">
                                <?php echo $webconfig['hotline']?></a>
                            <?php } ?>
                            <?php if(!empty($webconfig['hotline2'])) { ?>
                            <a href="tel:<?php echo $webconfig['hotline2']?>">
                                <img width="14" height="14"
                                     srcset="<?php echo HTTP_SERVER ?>module/gbcms/customframe/lienhe/img/phone.png?v=<?php echo IMAGE_VERSION?> 1.25x,
                                            <?php echo HTTP_SERVER ?>module/gbcms/customframe/lienhe/img/phone.png?v=<?php echo IMAGE_VERSION?> 2x"
                                     src="<?php echo HTTP_SERVER ?>module/gbcms/customframe/lienhe/img/phone.png?v=<?php echo IMAGE_VERSION?>" alt="phone icon">
                                <?php echo $webconfig['hotline2']?>
                            </a>
                            <?php } ?>
                        </div>
                    </div>
                    <?php if(!empty($webconfig['zaloviber'])) { ?>
                    <div class="contact__descripton__info">
                        <p>Nhắn tin đặt hàng qua Zalo hoặc Viber</p>
                        <div class="other__hotline">
                            <img width="24" height="24"
                                 srcset="<?php echo HTTP_SERVER ?>module/gbcms/customframe/lienhe/img/zalo.png?v=<?php echo IMAGE_VERSION?> 1.25x,
                                            <?php echo HTTP_SERVER ?>module/gbcms/customframe/lienhe/img/zalo.png?v=<?php echo IMAGE_VERSION?> 2x"
                                 src="<?php echo HTTP_SERVER ?>module/gbcms/customframe/lienhe/img/zalo.png?v=<?php echo IMAGE_VERSION?>" alt="zalo icon">
                            <img width="26" height="26"
                                 srcset="<?php echo HTTP_SERVER ?>module/gbcms/customframe/lienhe/img/viber.png?v=<?php echo IMAGE_VERSION?> 1.25x,
                                            <?php echo HTTP_SERVER ?>module/gbcms/customframe/lienhe/img/viber.png?v=<?php echo IMAGE_VERSION?> 2x"
                                 src="<?php echo HTTP_SERVER ?>module/gbcms/customframe/lienhe/img/viber.png?v=<?php echo IMAGE_VERSION?>" alt="viber icon">
                            <?php echo $webconfig['zaloviber'] ?>
                        </div>
                    </div>
                    <?php } ?>
                    <?php if(!empty($webconfig['email'])) { ?>
                    <div class="contact__descripton__info">
                        <p>Email đặt hàng và chăm sóc khách hàng</p>
                        <div class="infomail">
                            <a href="mailto:<?php echo $webconfig['email'] ?>">
                                <img width="22" height="20"
                                     srcset="<?php echo HTTP_SERVER ?>module/gbcms/customframe/lienhe/img/mail.png?v=<?php echo IMAGE_VERSION?> 1.25x,
                                            <?php echo HTTP_SERVER ?>module/gbcms/customframe/lienhe/img/mail.png?v=<?php echo IMAGE_VERSION?> 2x"
                                     src="<?php echo HTTP_SERVER ?>module/gbcms/customframe/lienhe/img/mail.png?v=<?php echo IMAGE_VERSION?>" alt="mail icon"><?php echo $webconfig['email'] ?></a>
                        </div>
                    </div>
                    <?php } ?>
                </div>
                <div class="contact__form col-lg-6">
                    <!--Template--><!--Example <div gbfid="F1045fb4ddbda008b"></div> -->
                    <div gbfid="F1295fe4868636863">
                        <div>
                            <form id="F1295fe4868636863" action="https://demo.gbotweb.com/golead/ajax/submitForm.gbe">
                                <input type="hidden" name="formcode" value="F1295fe4868636863">
                                <div class="gol-row gol-form-group">
                                    <div id="fullname-wrapper" class="gol-col-12 gol-col-md-6 mb-3 mb-md-0">
                                        <label for="registertype">Họ tên:<span class="gol-text-danger">*</span></label>
                                        <input id="fullname" name="fullname" type="text" class="gol-form-control" required="">
                                    </div>

                                    <div id="phone-wrapper" class="gol-col-12 gol-col-md-6 phone-wrapper">
                                        <label for="phone">Điện thoại:<span class="gol-text-danger">*</span></label>
                                        <input id="phone" name="phone" type="text" class="gol-form-control">
                                    </div>
                                </div>

                                <div id="email-wrapper" class="gol-form-group">
                                    <label for="email">Email<span class="text-danger">*</span></label>
                                    <input type="email" class="gol-form-control" id="email" name="email" required="">
                                </div>

                                <div id="title-wrapper" class="gol-form-group">
                                    <label for="title">Tiêu đề<span class="text-danger">*</span></label>
                                    <input type="text" class="gol-form-control" id="title" name="title" required="">
                                </div>

                                <div id="message-wrapper" class="gol-form-group">
                                    <label for="message">Lời nhắn<span class="text-danger">*</span></label>
                                    <textarea id="message" name="message" class="gol-form-control" rows="6" aria-label="With textarea"></textarea>
                                </div>

                                <div>
                                    <a href="javascript:void(0)" id="btn-submit-F1295fe4868636863" class="gol-btn-success">
                                        Gửi yêu cầu
                                    </a>
                                </div>
                            </form>
                        </div>
                        <div id="mydialog" class="gol-mydialog">
                            <div class="gol-mydialog_container">
                                <div class="gol-mydialog_header"><i class="fa"></i>&nbsp; <span>Thông báo</span></div>
                                <div class="gol-mydialog_body"></div>
                                <div class="gol-mydialog_footer">
                                    <button type="button" autofocus="" class="btnok btn gol-btn-primary">OK</button>
                                    <button type="button" class="btncancel btn gol-btn-light">Cancel</button>
                                    <button type="button" autofocus="" class="btnagreedelete btn gol-btn-danger">Agree</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="contact__1col col-lg-1"></div>
            </div>
        </div>
    </div>
</section>