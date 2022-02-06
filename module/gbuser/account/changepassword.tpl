<style>
    .account__sidebar__changepassword{
        background-color: #E2E2E2;
    }
</style>
<div class="changepassword">
    <div class="changepassword__container container">
        <nav class="account__breadcrumb">
            <a class="breadbrum__active" href="<?php echo HTTP_SERVER ?>">Trang chủ</a>
            <span>/</span>
            <a class="breadbrum__noactive"> Thay đổi mật khẩu</a>
        </nav>
        <div class="changepassword__row row">
            <div class="changepassword__col-md-3 col-md-3">
                <div class="changepassword__sidebar">
                    <?php include("account_sidebar.php")?>
                </div>
            </div>

            <div class="changepassword__col-md-9 col-md-9">
                <div class="changepassword__content">
                    <p class="changepassword__content__heading">Thay đổi mật khẩu</p>
                    <form id="changepassword__form">
                        <div class="mb--24">
                            <label for="current_password">Mật khẩu hiện tại: </label>
                            <input name="current_password" type="password" >
                        </div>
                        <div class="mb--24">
                            <label for="new_password">Mật khẩu muốn thay đổi: </label>
                            <input id="password" name="new_password" type="password" >
                        </div>
                        <div class="mb--24">
                            <label for="confirm_new_password">Xác nhận lại mật khẩu mới: </label>
                            <input id="confirm_password" name="confirm_new_password" type="password" >
                            <span id="confirm__password__form__error"></span>
                        </div>
                        <div class="mb--24">
                            <p id="changepassword__form__error"></p>
                        </div>
                        <button type="submit" class="submit__form">Xác nhận</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    document.getElementById("changepassword__form").addEventListener("submit", function(e){
        e.preventDefault();
        if(document.getElementById('password').value != document.getElementById('confirm_password').value){
            document.getElementById('confirm__password__form__error').innerHTML = "Mật khẩu chưa trùng khớp.";
        } else {
            document.getElementById('confirm__password__form__error').innerHTML = "";
            var formData = new FormData();
            var password = e.target.querySelector("input[name=current_password]").value, newpassword = e.target.querySelector("input[name=new_password]").value, confirmnewpassword = e.target.querySelector("input[name=confirm_new_password]").value;
            formData.append('password', password);
            formData.append('newpassword', newpassword);
            formData.append('confirmnewpassword', confirmnewpassword);

            xhr("<?php echo HTTP_SERVER ?>gbuser/ajax/changepassword.gbe", formData, function(res){
                var data = JSON.parse(res);
                if(data["error"]==''){
                    document.getElementById('changepassword__form__error').style.color = "green";
                    data["error"]="Mật khẩu của bạn đã được đổi thành công";
                    document.getElementById("changepassword__form").reset();
                } else {
                    document.getElementById('changepassword__form__error').style.color = "darkred";
                }
                document.getElementById('changepassword__form__error').innerHTML = data["error"];
            });
        }
    });
</script>