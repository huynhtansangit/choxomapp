$(document).ready(function () {

    $('#cardcity').change(function (e) {
        $provincecode = $(this).val();
        showLoading();
        $.get({
                url: main_http_server + "gbshop/ajax/updatedistrict.gbe?provincecode=" + $provincecode
            }, function (data, status) {
                $res = JSON.parse(data);
                $districtelement = $("#carddistrict");
                $districtelement.html("");
                $.each($res, function (index, value) {
                    $html = "<option value='" + index + "'>" + value + "</option>";
                    $("#carddistrict").append($html);
                });

                    $districtelement.trigger('change');

            }
        )
    });

    $('#carddistrict').change(function (e) {
        $provincecode = $('#cardcity').val();
        $districtcode = $(this).val();
        showLoading();
        $.get({
            url: main_http_server + "gbshop/ajax/updateward.gbe?provincecode=" + $provincecode + "&districtcode=" + $districtcode
        }, function (data, status) {
            $res = JSON.parse(data);
            $wardelement = $("#cardward");
            $wardelement.html("");
            $.each($res, function (index, value) {
                $html = "<option value='" + index + "'>" + value + "</option>";
                $("#cardward").append($html);
            });
            $wardelement.trigger('change');
        })
    });

    $('#cardward').change(function (e) {
        $provincecode = $('#cardcity').val();
        $districtcode = $('#carddistrict').val();
        $wardcode = $(this).val();
        showLoading();
        $.get({
            url: main_http_server + "gbshop/ajax/updateshippingmethodfee.gbe?provincecode=" + $provincecode + "&districtcode=" + $districtcode + "&wardcode=" + $wardcode
        }, function (data, status) {

            $res = JSON.parse(data);
            $data = $res.data;

            var shippingmethod = $(".shippingmethod__row.active").find("input[name=shippingmethod]").val();
            if (shippingmethod == undefined) shippingmethod = 'standard';

            var iscollect = $("input[name=iscollect]:checked").val();

            if (iscollect == 0) {
                setTimeout(function () {
                    var shippingfeeactive = $("#shippingfee-" + shippingmethod).html();
                    $("#ordershipprice").val(shippingfeeactive);

                    if(shippingfeeactive == "B??o gi?? sau"){
                        $("#shippingfee").html(shippingfeeactive );
                    } else {
                        $("#shippingfee").html(shippingfeeactive + " ");
                    }
                    var totallines = $("#shipping_totallines").html().slice(0, -1);

                    var promotionamount = "0";
                    if ($("#shipping__promotionamount").html() != null) {
                        promotionamount = $("#shipping__promotionamount").html().slice(0, -1).slice(1);
                    }
                    if( Number.isNaN(parseInt(shippingfeeactive.replaceAll(".", "")))){
                        shippingfeeactive = '0';
                    }
                    var totalprice = parseInt(totallines.replaceAll(".", "")) + parseInt(shippingfeeactive.replaceAll(".", "")) - parseInt(promotionamount.replaceAll(".", ""));

                    $("#shipping__totalprice").html(numberWithDot(totalprice) + " VND");
                }, 300);
            }
            $.each($data, function (index, value) {
                if (value.shippingfee == 0) {
                    $("#shippingfee-" + index).html("B??o gi?? sau");
                } else {
                    $("#shippingfee-" + index).html(value.shippingfee + " VND");
                }
            });
            endLoading();
        })
    });

    $("input[name='shippingmethod']").change(function () {
        value = $(this).val();
        $(".shippingmethod__row").removeClass("active");
        $("#" + value).parent().parent().addClass("active");

        var shippingmethod_row = $(this).closest(".shippingmethod__row");
        var shippingfee = document.querySelector("#shippingfee-" + value);

            if(shippingfee.innerHTML == "B??o gi?? sau"){
                $("#shippingfee").html(shippingfee.innerHTML );
            } else {
                $("#shippingfee").html(shippingfee.innerHTML + " ");
            }

        var shippingfeeactive = shippingfee.innerHTML;
        if( Number.isNaN(parseInt(shippingfeeactive.replaceAll(".", "")))){
            shippingfeeactive = '0';
        }
        var totallines = $("#shipping_totallines").html().slice(0, -1);

        var promotionamount = "0";
        if ($("#shipping__promotionamount").html() != null) {
            promotionamount = $("#shipping__promotionamount").html().slice(0, -1).slice(1);
        }

        var totalprice = parseInt(totallines.replaceAll(".", "")) + parseInt(shippingfeeactive.replaceAll(".", "")) - parseInt(promotionamount.replaceAll(".", ""));
        $("#shipping__totalprice").html(numberWithDot(totalprice) + " VND");

        $("input[name=ordershipprice]").val(parseInt(shippingfeeactive.replaceAll(".", "")));

    });

    //thay ?????i gi?? tr??? c???a checkbox "th??ng tin ng?????i mua l?? th??ng tin ng?????i nh???n"
    $("#buyer_thesameas_receiver").click(function () {
        if ($(this).val() == 1) {
            $(this).val(0);
            $(".shoppingcart__checkbox--off").removeClass("d-inline-block");
            $(".shoppingcart__checkbox--on").removeClass("d-none");

            $(".shoppingcart__checkbox--on").addClass("d-inline-block");
            $(".shoppingcart__checkbox--off").addClass("d-none");
        } else {
            $(this).val(1);
            $(".shoppingcart__checkbox--off").removeClass("d-none");
            $(".shoppingcart__checkbox--on").removeClass("d-inline-block");

            $(".shoppingcart__checkbox--off").addClass("d-inline-block");
            $(".shoppingcart__checkbox--on").addClass("d-none");

            $("#receiver__name").val($("#buyer__name").val());
            $("#receiver__email").val($("#buyer__email").val());
            $("#receiver__phone").val($("#buyer__phone").val());

            $("#cardcity").val($("#buyer_cardcity").val());
            $('#cardcity').trigger("change");

            setTimeout(function () {
                $("#carddistrict").val($("#buyer_carddistrict").val());
                $('#carddistrict').trigger("change");
            }, 250);

            setTimeout(function () {
                $("#cardward").val($("#buyer_cardward").val());
                console.log($("#cardward").val());
                $('#cardward').trigger("change");
            }, 500);


            $("#receiver__address").val($("#buyer__address").val());
        }
    });

    $("#buyer__name").on("keyup paste", function () {
        if ($("#buyer_thesameas_receiver").val() == 1) {
            $("#receiver__name").val($(this).val());
        }
    });

    $("#buyer__email").on("keyup paste", function () {
        if ($("#buyer_thesameas_receiver").val() == 1) {
            $("#receiver__email").val($(this).val());
        }
    });

    $("#buyer__phone").on("keyup paste", function () {
        if ($("#buyer_thesameas_receiver").val() == 1) {
            $("#receiver__phone").val($(this).val());
        }
    });

    $("#buyer_cardcity").on("change", function (e) {
        $provincecode = $(this).val();
        showLoading();
        $.get({
            url: main_http_server + "gbshop/ajax/updatedistrict.gbe?provincecode=" + $provincecode
        }, function (data, status) {
            $res = JSON.parse(data);
            $districtelement = $("#buyer_carddistrict");
            $districtelement.html("");
            $.each($res, function (index, value) {
                $html = "<option value='" + index + "'>" + value + "</option>";
                $("#buyer_carddistrict").append($html);
            });
            $districtelement.trigger('change');
        });

        if ($("#buyer_thesameas_receiver").val() == 1) {
            $("#cardcity").val($(this).val());
            $('#cardcity').trigger("change");
        }
    });

    $("#buyer_carddistrict").on("change", function (e) {
        $provincecode = $('#buyer_cardcity').val();
        $districtcode = $(this).val();
        showLoading();
        $.get({
            url: main_http_server + "gbshop/ajax/updateward.gbe?provincecode=" + $provincecode + "&districtcode=" + $districtcode
        }, function (data, status) {
            $res = JSON.parse(data);
            $wardelement = $("#buyer_cardward");
            $wardelement.html("");
            $.each($res, function (index, value) {
                $html = "<option value='" + index + "'>" + value + "</option>";
                $("#buyer_cardward").append($html);
            });
            $wardelement.trigger('change');
        });

        if ($("#buyer_thesameas_receiver").val() == 1 && e.originalEvent !== undefined) {
            $("#carddistrict").val($(this).val());
            $('#carddistrict').trigger("change");
        }
    });

    $("#buyer_cardward").on("change", function (e) {
        $provincecode = $('#buyer_cardcity').val();
        $districtcode = $('#buyer_carddistrict').val();
        $wardcode = $(this).val();
        showLoading();
        $.get({
            url: main_http_server + "gbshop/ajax/updateshippingmethodfee.gbe?provincecode=" + $provincecode + "&districtcode=" + $districtcode + "&wardcode=" + $wardcode
        }, function (data, status) {
            $res = JSON.parse(data);
            $data = $res.data;
        });

        if ($("#buyer_thesameas_receiver").val() == 1 && e.originalEvent !== undefined) {
            $("#cardward").val($(this).val());
            $('#cardward').trigger("change");
        }
        endLoading();
    });

    $("#buyer__address").on("keyup paste", function () {
        if ($("#buyer_thesameas_receiver").val() == 1) {
            $("#receiver__address").val($(this).val());
        }
    });

    //khi receiver keyup th?? uncheck thay d???i ?????ng b??? c???a buyer v?? receiver
    $("#receiver__name").on("keyup paste", function () {
        $("#buyer_thesameas_receiver").val(0);
        $(".shoppingcart__checkbox--off").removeClass("d-inline-block");
        $(".shoppingcart__checkbox--on").removeClass("d-none");

        $(".shoppingcart__checkbox--on").addClass("d-inline-block");
        $(".shoppingcart__checkbox--off").addClass("d-none");
    });

    $("#receiver__email").on("keyup paste", function () {
        $("#buyer_thesameas_receiver").val(0);
        $(".shoppingcart__checkbox--off").removeClass("d-inline-block");
        $(".shoppingcart__checkbox--on").removeClass("d-none");

        $(".shoppingcart__checkbox--on").addClass("d-inline-block");
        $(".shoppingcart__checkbox--off").addClass("d-none");
    });

    $("#receiver__phone").on("keyup paste", function () {
        $("#buyer_thesameas_receiver").val(0);
        $(".shoppingcart__checkbox--off").removeClass("d-inline-block");
        $(".shoppingcart__checkbox--on").removeClass("d-none");

        $(".shoppingcart__checkbox--on").addClass("d-inline-block");
        $(".shoppingcart__checkbox--off").addClass("d-none");
    });

    $("#receiver__address").on("keyup paste", function () {
        $("#buyer_thesameas_receiver").val(0);
        $(".shoppingcart__checkbox--off").removeClass("d-inline-block");
        $(".shoppingcart__checkbox--on").removeClass("d-none");

        $(".shoppingcart__checkbox--on").addClass("d-inline-block");
        $(".shoppingcart__checkbox--off").addClass("d-none");
    });

    $("#cardcity").on("focus", function () {
        $("#buyer_thesameas_receiver").val(0);
        $(".shoppingcart__checkbox--off").removeClass("d-inline-block");
        $(".shoppingcart__checkbox--on").removeClass("d-none");

        $(".shoppingcart__checkbox--on").addClass("d-inline-block");
        $(".shoppingcart__checkbox--off").addClass("d-none");
    });

    $("#carddistrict").on("focus", function () {
        $("#buyer_thesameas_receiver").val(0);
        $(".shoppingcart__checkbox--off").removeClass("d-inline-block");
        $(".shoppingcart__checkbox--on").removeClass("d-none");

        $(".shoppingcart__checkbox--on").addClass("d-inline-block");
        $(".shoppingcart__checkbox--off").addClass("d-none");
    });

    $("#cardward").on("focus", function () {
        $("#buyer_thesameas_receiver").val(0);
        $(".shoppingcart__checkbox--off").removeClass("d-inline-block");
        $(".shoppingcart__checkbox--on").removeClass("d-none");

        $(".shoppingcart__checkbox--on").addClass("d-inline-block");
        $(".shoppingcart__checkbox--off").addClass("d-none");
    });

    $("input[name=iscollect]").click(function () {
       $value = $(this).val();

        if($value == 1) {
            $(".shipping__receive__store").css("display", "block");
            $(".shipping__receive__byshipping").css("display", "none");
            //hide d??ng ph?? ship khi ch???n h??nh th???c nh???n h??ng l?? "giao h??ng t???n n??i" v?? t??nh to??n l???i t???ng ti???n
            $("#shippingfee__row").css("display", "none");
            //tr?????ng h???p tr??n n??y kh??ng g??n l???i gi?? tr??? c???a shipping b???ng 0 v?? API ???? x??? l?? ch??? n??y khi chuy???n tr???ng th??i ????n h??ng
            var totallines = $("#shipping_totallines").html().slice(0, -1);

            var promotionamount = "0";
            if($("#shipping__promotionamount").html() != null) {
                promotionamount = $("#shipping__promotionamount").html().slice(0, -1).slice(1);
            }

            var totalprice = parseInt(totallines.replaceAll(".", "")) - parseInt(promotionamount.replaceAll(".", ""));
            $("#shipping__totalprice").html(numberWithDot(totalprice) + " VND");
        } else {
            $(".shipping__receive__byshipping").css("display", "block");
            $(".shipping__receive__store").css("display", "none");

            //show d??ng ph?? ship khi ch???n h??nh th???c nh???n h??ng l?? "giao h??ng t???n n??i" v?? t??nh to??n l???i t???ng ti???n
            $("#shippingfee__row").css("display", "flex");

            var shippingfee = document.querySelector("#shippingfee").innerHTML.slice(0, -1);

            //g??n l???i gi?? ship b???ng c??ch t??m h??nh th???c giao h??ng ??ang ???????c active => l???y gi?? tr??? => g??n l???i ch??? shippingfee
            var shippingmethod = $(".shippingmethod__row.active").find("input[name=shippingmethod]").val();
            if (shippingmethod == undefined) shippingmethod = 'standard';

            var shippingfeeactive = $("#shippingfee-" + shippingmethod).html();

            $("#ordershipprice").val(shippingfeeactive);
            $("#shippingfee").html(shippingfeeactive + "");

            var totallines = $("#shipping_totallines").html().slice(0, -1);

            var promotionamount = "0";
            if($("#shipping__promotionamount").html() != null) {
                promotionamount = $("#shipping__promotionamount").html().slice(0, -1).slice(1);
            }
            if( Number.isNaN(parseInt(shippingfee.replaceAll(".", "")))){
                shippingfee = '0';
            }
            var totalprice = parseInt(totallines.replaceAll(".", "")) + parseInt(shippingfee.replaceAll(".", "")) - parseInt(promotionamount.replaceAll(".", ""));

            $("#shipping__totalprice").html(numberWithDot(totalprice) + " VND");
        }
    });

    $("#cardward").trigger("change");
});

var jShippingForm = document.getElementById("frm__shipping");

var validatorShipping = $( "#frm__shipping" ).validate({
    errorClass: "help-block with-errors",
    errorElement: "div",
    rules: {
        membername: {
            required: true
        },
        memberemail: {
            required: true,
            email: true
        },
        memberphone: {
            required: true
        },
        memberaddress : {
            required: true
        },
        shipname: {
            required: true
        },
        shipemail: {
            required: true,
            email: true
        },
        shipphone: {
            required: true
        },
        shipaddress : {
            required: true
        }
    },
    messages: {
        membername: {
            required: "Vui l??ng nh???p t??n ng?????i mua"
        },
        memberemail: {
            required: "Vui l??ng nh???p email ng?????i mua",
            email: "?????nh d???ng email ch??a ????ng"
        },
        memberphone: {
            required: "Vui l??ng nh???p s??? ??i???n tho???i ng?????i mua"
        },
        memberaddress : {
            required: "Vui l??ng nh???p ?????a ch??? ng?????i mua"
        },
        shipname: {
            required: "Vui l??ng nh???p ?????a ch??? ng?????i nh???n"
        },
        shipemail: {
            required: "Vui l??ng nh???p ?????a ch??? ng?????i nh???n",
            email: "?????nh d???ng email ch??a ????ng"
        },
        shipphone: {
            required: "Vui l??ng nh???p ?????a ch??? ng?????i nh???n"
        },
        shipaddress : {
            required: "Vui l??ng nh???p ?????a ch??? ng?????i nh???n"
        }
    }
});

jShippingForm.addEventListener("submit", function(e) {
    e.preventDefault();
    if(validatorShipping.valid()) {
        $id = $("input[name=id]").val();
        $.ajax({
            type: "POST",
            url: main_http_server + "gbshop/ajax/submitFormShipping.gbe",
            data: $(this).serialize(),
            success: function( res ) {

                var data = JSON.parse(res);

                if(data.status == 'failed') {
                    $("input[name=" + data.error_field + "]" ).focus();

                    $("#modal__shippingerror").css("display", "flex");
                } else {
                    location.href = main_http_server + "gbshop/shoppingcart/cart_payment.gbe";
                }
            }
        });
    }
});

var shipping_backtocarts = document.querySelectorAll(".shipping__backtocart");

shipping_backtocarts.forEach(function(shippingbacktocart) {
    shippingbacktocart.addEventListener("click", function() {
        var formData = new FormData(jShippingForm);
        xhr(main_http_server + "gbshop/ajax/submitFormShipping.gbe?type=editcart", formData, function(res) {
            // Set type = editcart ????? ????nh d???u vi???c ???n n??t "S???a", n???u ???n n??t s???a th?? shipcost s??? = 0 ????? ti???n t??nh ??? trang danh s??ch s???n ph???m ch???y ????ng
            location.href = main_http_server + "gbshop/shoppingcart/cart.gbe";
        }, "post");
    });
});