var validatorForgotPassword = $( "#forgotpassword__form" ).validate({
    errorClass: "help-block with-errors",
    errorElement: "div",
    rules: {
        memberemail: {
            required: true,
            email: true
        }
    },
    messages: {
        memberemail: {
            required: "Vui lòng nhập email của bạn",
            email: "Email không hợp lệ"
        }
    }
});

$("#forgotpassword__form").submit(function(e) {
    e.preventDefault(); // avoid to execute the actual submit of the form.
    if(validatorForgotPassword.valid()) {
        showLoading();
        var form = $(this);
        $.ajax({
            type: "POST",
            url: main_http_server + "gbuser/ajax/forgotPassword.gbe",
            data: form.serialize(), // serializes the form's elements.
            success: function(res)
            {
                endLoading();
                var data = JSON.parse(res);
                if(data["status"] == 'failed') {
                    document.querySelector("#modal__annoucement .gbmodal__content").innerHTML = data["error"];
                    document.getElementById("modal__annoucement").style.display = "flex";

                    document.getElementById("modal__announcemnet__close").addEventListener("click", function() {
                        location.reload();
                    });
                } else {
                    document.querySelector("#modal__annoucement .gbmodal__content").innerHTML = data["message"];
                    document.getElementById("modal__annoucement").style.display = "flex";

                    document.getElementById("modal__announcemnet__close").addEventListener("click", function() {
                        location.href = main_http_server + 'gbuser/login.gbe';
                    });

                }
            }
        });
    }
});