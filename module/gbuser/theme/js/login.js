function show_element(close_detail, open_detail, unselect_item, select_item){
    document.getElementById(close_detail).style.display = "none";
    document.getElementById(open_detail).style.display = "block";

    document.getElementById(unselect_item).classList.remove("active");
    document.getElementById(select_item).classList.add("active");
}

document.querySelectorAll(".login__option__tab .nav__item").forEach((logintab) => {
   if(logintab.classList.contains("active")) {
       logintab.click();
   }
});

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
        }
        /*address: {
            required: true
        }*/
    },
    messages: {
        membername: {
            required: "Vui l??ng nh???p H??? v?? T??n c???a b???n"
        },
        memberphone: {
            minlength: "S??? ??i???n tho???i kh??ng h???p l???, t???i thi???u 10 s???",
            maxlength: "S??? ??i???n tho???i kh??ng h???p l???, t???i ??a 10 s???",
            required: "Vui l??ng nh???p s??? ??i???n tho???i c???a b???n",
        },
        memberemail: {
            required: "Vui l??ng nh???p email c???a b???n",
            email: "Email kh??ng h???p l???"
        },
        password : {
            required: "Vui l??ng nh???p m???t kh???u c???a b???n",
            minlength: "M???t kh???u t???i thi???u 6 k?? t???"
        },
        confirmpassword: {
            equalTo : "M???t kh???u kh??ng tr??ng kh???p"
        }
        /*address: {
            required: "Vui l??ng nh???p ?????a ch??? c???a b???n"
        }*/
    }
});

$("#register__form").submit(function(e) {
    e.preventDefault(); // avoid to execute the actual submit of the form.
    if(validatorRegister.valid()) {
        showLoading();
        var form = $(this);
        $.ajax({
            type: "POST",
            url: main_http_server + "gbuser/ajax/register.gbe",
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
        username: {
            required: true,
            email: true
        },
        password : {
            required: true,
            minlength: 6
        }
    },
    messages: {
        username: {
            required: "Vui l??ng nh???p email c???a b???n",
            email: "Email kh??ng h???p l???"
        },
        password : {
            required: "Vui l??ng nh???p m???t kh???u",
            minlength: "M???t kh???u t???i thi???u 6 k?? t???"
        }
    }
});

$("#login__form").submit(function(e) {
    e.preventDefault(); // avoid to execute the actual submit of the form.
    if(validatorLogin.valid()) {
        var form = $(this);
        $.ajax({
            type: "POST",
            url: main_http_server + "gbuser/ajax/login.gbe",
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

var validatorUpdateAccount = $( "#frm_updateaccount" ).validate({
    errorClass: "help-block with-errors",
    errorElement: "div",
    rules: {
        name: {
            required: true
        },
        email: {
            required: true,
            email: true
        },
        phone : {
            required: true
        }
    },
    messages: {
        name: {
            required: "Vui l??ng nh???p h??? v?? t??n c???a b???n"
        },
        email: {
            required: "Vui l??ng nh???p email c???a b???n",
            email: "Email kh??ng h???p l???"
        },
        phone : {
            required: "Vui l??ng nh???p s??? ??i???n tho???i c???a b???n"
        }
    }
});

$("#frm_updateaccount").submit(function(e) {
    e.preventDefault(); // avoid to execute the actual submit of the form.
    if(validatorUpdateAccount.valid()) {
        var form = $(this).serialize();
        $.ajax({
            type: "POST",
            url: main_http_server + "gbuser/ajax/addMember.gbe",
            data: form, // serializes the form's elements.
            success: function(res)
            {
                var data = JSON.parse(res);
                if(data.status == 'done' ) {
                    location.href = main_http_server;
                } else {
                    $("#updateaccount__error").html(data.error);
                    $("#updateaccount__error").css("display", "block");
                }
            }
        });
    }
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