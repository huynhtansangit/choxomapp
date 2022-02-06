<link rel="stylesheet" href="<?= HTTP_ROOTSERVER ?>module/contact/contact.css?v=<?= FILE_VERSION ?>" />  
<section class="contact">
    <div class="contact__container">
        <div class="container">
            <div class="row ">
                <div class="col-lg-7 col-12 col p-0 d-flex justify-content-center">
                    <div class="contact__picture-container">
                        <picture>
                            <img class="" src="/assets/img/contact/contact-img-1x.png" alt="contact-img">
                        </picture>
                    </div>
                </div>
                <div class="col-lg-5 col-12 --child-h-100 --p-22" gbfid="F142610974607641c">
                    <form id="F142610974607641c" action="https://demo.gbotweb.com/golead/ajax/submitForm.gbe">
                        <input type="hidden" name="formcode" value="F142610974607641c">
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
                        
                                
                                <div id="message-wrapper" class="gol-form-group">
                            <label for="message">Lời nhắn<span class="text-danger">*</span></label>
                            <textarea id="message" name="message" class="gol-form-control" rows="6" aria-label="With textarea"></textarea>
                        </div>
                        
                        <div>
                            <a href="javascript:void(0)" id="btn-submit-F142610974607641c" class="gol-btn-success">
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
    </div>
</section>
<script>
    
</script>
