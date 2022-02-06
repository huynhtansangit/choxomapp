$(document).ready(function () {
    $("#frm__payment").submit(function(e) {
        e.preventDefault();
        showLoading();
        $.ajax({
            type: "POST",
            url: main_http_server + "gbshop/ajax/createOrderByCart.gbe",
            data: $(this).serialize(),
            success: function( res ) {
                var data = JSON.parse(res)['data'];
                if(data.status != 'failed') {
                    location.href = main_http_server + "gbshop/shoppingcart/thankyou.gbe?ordertoken=" + data.token;
                }
            }
        });
    });

    $("#btn__backtoshipping").click(function() {
        $.ajax({
            type: "POST",
            url: main_http_server + "gbshop/ajax/updatePaymentMenthodInShippingCart.gbe",
            data: $("#frm__payment").serialize(),
            success: function( res ) {
                history.back(-1);
            }
        });
    });

    var shipping_backtocarts = document.querySelectorAll(".shipping__backtocart");

    shipping_backtocarts.forEach(function(shippingbacktocart) {
        shippingbacktocart.addEventListener("click", function() {
            var formData = new FormData();
            xhr(main_http_server + "gbshop/ajax/resetShipCost.gbe", formData, function(res) {
                //console.log(res);
                // Set type = editcart để đánh dấu việc ấn nút "Sửa", nếu ấn nút sửa thì shipcost sẽ = 0 để tiền tính ở trang danh sách sản phẩm chạy đúng
                location.href = main_http_server + "gbshop/shoppingcart/cart.gbe";
            }, "post");
        });
    });

    // display banking payment
    $('input:radio[name="paymentmethod"]').change(
        function(){
            if ($(this).is(':checked')) {
                if($(this).attr('id')=='atmBanking') {
                    $('#bankPayment').css('display', 'block');

                } else {
                    $('#bankPayment').css('display', 'none');

                }
            }
        });
});


