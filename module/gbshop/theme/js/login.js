function show_element(close_detail, open_detail, unselect_item, select_item){
    document.getElementById(close_detail).style.display = "none";
    document.getElementById(open_detail).style.display = "block";

    document.getElementById(unselect_item).classList.remove("active");
    document.getElementById(select_item).classList.add("active");
}

/****INPUT NUMBER ONLY*****/
// Restricts input for the given textbox to the given inputFilter function.
function setInputFilter(textbox, inputFilter) {
    if(textbox != null) {
        ["input", "keydown", "keyup", "mousedown", "mouseup", "select", "contextmenu", "drop", "paste"].forEach(function (event) {
            textbox.addEventListener(event, function () {
                if (inputFilter(this.value)) {
                    this.oldValue = this.value;
                    this.oldSelectionStart = this.selectionStart;
                    this.oldSelectionEnd = this.selectionEnd;
                } else if (this.hasOwnProperty("oldValue")) {
                    this.value = this.oldValue;
                    this.setSelectionRange(this.oldSelectionStart, this.oldSelectionEnd);
                } else {
                    this.value = "";
                }
            });
        });
    }
}

//use example
//setInputFilter(document.getElementById("memberphone"), function(value) {
//    return /^\d*$/.test(value); // Allow digits and '.' only, using a RegExp
//});

setInputFilter(document.getElementById("memberphone"), function(value) {
    return /^\d*$/.test(value); // Allow digits and '.' only, using a RegExp
});

var validatorRegister = $( "#register__form" ).validate({
    errorClass: "help-block with-errors",
    errorElement: "div",
    rules: {
        membername: {
            required: true
        },
        memberphone: {
            minlength: 10,
            maxlength: 10,
            required: true
        },
        memberemail: {
            required: true,
            email: true
        },
        password : {
            required: true,
            minlength: 6
        },
        confirmpassword: {
            equalTo : "#register__password"
        },
        address: {
            required: true
        }
    },
    messages: {
        membername: {
            required: "Vui lòng nhập Họ và Tên"
        },
        memberphone: {
            minlength: "Số điện thoại không hợp lệ, tối thiểu 10 số",
            maxlength: "Số điện thoại không hợp lệ, tối đa 10 số",
            required: "Vui lòng nhập số điện thoại",
        },
        memberemail: {
            required: "Vui lòng nhập email của bạn",
            email: "Email không hợp lệ"
        },
        password : {
            required: "Vui lòng nhập mật khẩu",
            minlength: "Mật khẩu tối thiểu 6 ký tự"
        },
        confirmpassword: {
            equalTo : "Mật khẩu không trùng khớp"
        },
        address: {
            required: "Vui lòng nhập địa chỉ"
        }
    }
});

$("#register__form").submit(function(e) {
    e.preventDefault(); // avoid to execute the actual submit of the form.
    if(validatorRegister.valid()) {
        showLoading();
        var form = $(this);
        $.ajax({
            type: "POST",
            url: main_http_server + "/ajax/register.gbe",
            data: form.serialize(), // serializes the form's elements.
            success: function(data)
            {
                endLoading();
                data = JSON.parse(data);
                if(data["error"])
                    document.getElementsByClassName("register__error")[0].innerHTML = data["error"];
                else {
                    document.querySelector("#modal__annoucement .gbmodal__content").innerHTML = data.status;
                    document.querySelector("#modal__annoucement").style.display = "flex";
                    document.querySelector("#modal__annoucement .modal__announcemnet__close").addEventListener("click", function() {
                        location.reload();
                    });
                }
            }
        });
    }
});

var validatorLogin = $( "#login__form" ).validate({
    errorClass: "help-block with-errors",
    errorElement: "div",
    rules: {
        memberemail: {
            required: true,
            email: true
        },
        password : {
            required: true,
            minlength: 6
        }
    },
    messages: {
        memberemail: {
            required: "Vui lòng nhập email của bạn",
            email: "Email không hợp lệ"
        },
        password : {
            required: "Vui lòng nhập mật khẩu",
            minlength: "Mật khẩu tối thiểu 6 ký tự"
        }
    }
});

$("#login__form").submit(function(e) {
    e.preventDefault(); // avoid to execute the actual submit of the form.
    if(validatorLogin.valid()) {
        var form = $(this);
        $.ajax({
            type: "POST",
            url: "../ajax/login.gbe",
            data: form.serialize(), // serializes the form's elements.
            success: function(data)
            {
                data = JSON.parse(data);
                if(data["error"])
                    document.getElementsByClassName("login__error")[0].innerHTML = data["error"];
                else {
                    location.reload();
                }
            }
        });
    }
});

$("#modal__updateaccount__close").click(function() {
   $("#modal__updateaccount").css("display", "none");
});

/********LOGIN BY FACEBOOK ACCOUNT************/
function createPopupWin(pageURL, pageTitle,
                        popupWinWidth, popupWinHeight) {
    var left = (screen.width - popupWinWidth) / 2;
    var top = (screen.height - popupWinHeight) / 4;

    var myWindow = window.open(pageURL, pageTitle,
        'resizable=yes, width=' + popupWinWidth
        + ', height=' + popupWinHeight + ', top='
        + top + ', left=' + left);
}
/********END: LOGIN BY FACEBOOK ACCOUNT************/