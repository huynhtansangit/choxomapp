<script src="/assets/plugins/jquery-3.4.1/jquery-3.4.1.min.js"></script>
<script src="/assets/plugins/swiper-5.4.5/js/swiper.min.js"></script>
<link rel="stylesheet" href="<?php echo HTTP_SERVER ?>module/gbcms/customframe/dangtoathuoc/style.css">
<script src="<?php echo HTTP_SERVER ?>module/gbcms/customframe/dangtoathuoc/script.js"></script>

<section id="prescription" class="pb-5">

    <div class="prescription__banner mb-4 mb-lg-0">

        <div class="swiper-container prescription__banner__container">
            <div class="swiper-wrapper">
                <div class="swiper-slide" style="background-color: #f3f3f3;">
                    <div class="prescription__banner__item container">
                        <div class="row">
                            <div class="col-12">
                                <h1>Bạn có toa thuốc?</h1>
                                <p>GoodPharma sẽ tư vấn tận tâm theo toa thuốc đã kê cho bạn. Chỉ cần làm theo hướng dẫn bên dưới, dược sĩ của GoodPharma sẽ liên hệ với bạn ngay.</p>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="swiper-pagination prescription__pagination"></div>
        </div>

    </div>

    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="prescription__guide text-left">
                    <h2>Chỉ với 2 bước</h2>

                    <h3>Tư vấn thuốc theo toa trực tuyến tại GoodPharma</h3>

                    <p>Đến với Good Pharma, chỉ cần 2 bước đơn giản bạn có thể mua được đúng đơn thuốc bác sĩ đã kê cho
                        mình.</p>

                    <div class="prescription__guide__content mt-4">
                        <h4>Bước 1: Đăng toa thuốc</h4>
                        <ol>
                            <li>Bạn chỉ cần đăng hình ảnh toa thuốc lên hệ thống bằng nút "Đăng toa thuốc"</li>
                            <li>Điền tên và số điện thoại để đội ngũ tư vấn GoodPharma liên hệ với bạn</li>
                            <li>Sau đó click vào nút "Gửi đi" để hoàn tất việc đăng toa thuốc</li>
                            <li>Khi đăng tải thành công, màn hình sẽ hiển thị thông báo xác nhận</li>
                        </ol>
                        <h4 class="mt-4">Bước 2: Nhận tư vấn</h4>
                        <ol>
                            <li>Trong vòng 1 tiếng, đội ngũ tư vấn sẽ kiểm tra đơn thuốc của bạn</li>
                            <li>Bạn sẽ được đội ngũ dược sĩ chuyên nghiệp liên hệ và tư vấn</li>
                        </ol>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 mb-4 mb-md-0 pt-lg-5 pt-xl-0">
                <div class="prescription__form__wrapper">

                    <!--<div class="prescription__form" gbfid="F1305ffd1f7e2323c"></div>-->
                    <div class="prescription__form" gbfid="F13460093b5d291e5">

                        <div>
                            <form class="" action="https://demo.gbotweb.com/golead/ajax/submitForm.gbe" id="F13460093b5d291e5">
                                <input type="hidden" name="formcode" value="F13460093b5d291e5">
                                <div id="attachments-wrapper">
                                    <div class="gol-dangtoathuoc">
                                        <input id="golead-attachments" name="attachments" type="hidden" value="">
                                        <a class="gol-dangtoathuoc-upload" data-toggle="tooltip" title="Attach files"
                                            onclick="triggerInputImage()">
                                            <img id="gol-image-preview-upload" width="716" height="478" srcset="https://demo.gbotweb.com/golead/data/templateform/formdangtoathuoc/upload@2x.png 1.25x,
                                https://demo.gbotweb.com/golead/data/templateform/formdangtoathuoc/upload@2x.png 2x" src="https://demo.gbotweb.com/golead/data/templateform/formdangtoathuoc/upload@2x.png" alt="upload image">
                                        </a>
                                    </div>
                                    <div class="attachments-showinfo">
                                        <span id="show-imagename"></span>
                                        <span id="error-message-image" class="text-danger"></span>
                                    </div>
                                    <input id="imageToUpload" type="file" multiple name="fileToUpload[]" value="" style="display: none;"
                                           onchange="uploadImage()"/>
                                </div>

                                <div class="gol-d-flex gol-justify-content-between gol-upload-information-form">
                                    <div class="dangtoathuoc-leftcol">
                                        <div id="fullname-wrapper" class="gol-d-inline-block">
                                            <input class="gol-dangtoathuoc-input" id="fullname" name="fullname" type="text" placeholder="Tên của bạn" required>
                                        </div>
                                        <div id="phone-wrapper" class="gol-d-inline-block">
                                            <input class="gol-dangtoathuoc-input" id="phone" name="phone" type="text" placeholder="Số điện thoại" required="">
                                        </div>
                                    </div>
                                    <div>
                                        <a id="btn-submit-F13460093b5d291e5" href="javascript:void(0)" class="gol-button-dangtoathuoc gol-d-inline-block">
                                            Gửi đi
                                        </a>
                                    </div>
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
                <!--<div class="prescription__form__image">
                    <img src="<?php /*echo HTTP_SERVER; */?>module/gbcms/customframe/dangtoathuoc/medicalbanner.jpg" alt="">
                </div>-->
            </div>

        </div>
    </div>

</section>
