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

                    if(shippingfeeactive == "Báo giá sau"){
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
                    $("#shippingfee-" + index).html("Báo giá sau");
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

            if(shippingfee.innerHTML == "Báo giá sau"){
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

    //thay đổi giá trị của checkbox "thông tin người mua là thông tin người nhận"
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

    //khi receiver keyup thì uncheck thay dổi đồng bộ của buyer và receiver
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
            //hide dòng phí ship khi chọn hình thức nhận hàng là "giao hàng tận nơi" và tính toán lại tổng tiền
            $("#shippingfee__row").css("display", "none");
            //trường hợp trên này không gán lại giá trị của shipping bằng 0 vì API đã xử lý chỗ này khi chuyển trạng thái đơn hàng
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

            //show dòng phí ship khi chọn hình thức nhận hàng là "giao hàng tận nơi" và tính toán lại tổng tiền
            $("#shippingfee__row").css("display", "flex");

            var shippingfee = document.querySelector("#shippingfee").innerHTML.slice(0, -1);

            //gán lại giá ship bằng cách tìm hình thức giao hàng đang được active => lấy giá trị => gán lại chỗ shippingfee
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
            required: "Vui lòng nhập tên người mua"
        },
        memberemail: {
            required: "Vui lòng nhập email người mua",
            email: "Định dạng email chưa đúng"
        },
        memberphone: {
            required: "Vui lòng nhập số điện thoại người mua"
        },
        memberaddress : {
            required: "Vui lòng nhập địa chỉ người mua"
        },
        shipname: {
            required: "Vui lòng nhập địa chỉ người nhận"
        },
        shipemail: {
            required: "Vui lòng nhập địa chỉ người nhận",
            email: "Định dạng email chưa đúng"
        },
        shipphone: {
            required: "Vui lòng nhập địa chỉ người nhận"
        },
        shipaddress : {
            required: "Vui lòng nhập địa chỉ người nhận"
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
            // Set type = editcart để đánh dấu việc ấn nút "Sửa", nếu ấn nút sửa thì shipcost sẽ = 0 để tiền tính ở trang danh sách sản phẩm chạy đúng
            location.href = main_http_server + "gbshop/shoppingcart/cart.gbe";
        }, "post");
    });
});