document.addEventListener("DOMContentLoaded", function () {
    // Click active animation
    function cartAnimate() {
        var cartButton = document.querySelector("#cartbutton");
        if (cartButton != null) {
            cartButton.innerHTML = '<svg fill="white" width="30" height="30" xmlns="http://www.w3.org/2000/svg" id="Capa_1" enable-background="new 0 0 512.007 512.007" viewBox="0 0 512.007 512.007"><g><path d="m449 375.169c6.883 0 12.883-4.685 14.552-11.362l48-192c2.368-9.473-4.812-18.638-14.552-18.638h-31.937l41.873-41.873c5.858-5.858 5.858-15.355 0-21.213l-84.85-84.85c-5.857-5.858-15.355-5.858-21.213 0l-81.667 81.668c-17.461-13.613-39.402-21.732-63.206-21.732-51.7 0-94.62 38.29-101.904 88h-61.504l-5.914-28.09c-1.461-6.941-7.585-11.91-14.678-11.91h-57c-8.284 0-15 6.716-15 15s6.716 15 15 15h44.829c59.285 281.605 54.799 260.296 58.419 277.492-17.139 7.018-29.248 23.871-29.248 43.508 0 25.916 21.084 47 47 47 32.991 0 55.764-33.292 43.805-64h201.39c-11.97 30.737 10.85 64 43.805 64 25.916 0 47-21.084 47-47 0-25.921-21.216-47.353-47.666-46.983-1.172-.026-271.534-.017-276.164-.017l-8.842-42zm-336.619-128h45.578l5.667 34h-44.087zm75.993 0h43.158l2.833 34h-40.325zm-10.667-64h48.491l2.833 34h-45.658zm275.582 98h-40.915l5.667-34h43.748zm-71.329 0h-40.324l2.833-34h43.158zm-45.658 64 2.833-34h37.824l-5.667 34zm-66.5 0-2.833-34h42.062l-2.833 34zm-5.333-64-2.833-34h52.729l-2.833 34zm82.5-64 2.833-34h48.491l-5.667 34zm-30.104 0h-57.729l-2.833-34h63.396zm-80 94 2.833 34h-34.991l-5.667-34zm164.842 34 5.667-34h38.415l-8.5 34zm67.582-128h-46.249l5.667-34h49.082zm-46.652-64h-42.414l73.687-73.687 21.207 21.207zm-11.157-116.117 21.217 21.217-78.573 78.573c-3.265-10.203-8.074-19.722-14.161-28.273zm-155.48 58.117c35.113 0 64.515 24.918 71.451 58h-142.902c6.936-33.082 36.338-58 71.451-58zm-108.707 88 5.667 34h-46.894l-7.158-34zm5.707 281c0 9.374-7.626 17-17 17s-17-7.626-17-17 7.626-17 17-17 17 7.626 17 17zm272 17c-9.374 0-17-7.626-17-17s7.626-17 17-17 17 7.626 17 17-7.626 17-17 17zm-299.145-170h42.771l5.667 34h-41.28z"/></g></svg>';
            cartButton.classList.add('animate__tada');

            setTimeout(function () {
                cartButton.classList.remove('animate__tada');
            }, 1000);
        }
    }

    //hàm kiểm tra số lượng tồn kho để cho phép thêm vào giỏ hàng ở trang danh sách sản phẩm
    //số lượng sản phẩm ở danh sách sản phẩm mỗi lần thêm vào giỏ hàng luôn là 1.
    function checkQuantityInStockAtProductList(e) {
        var quantityInStock = parseInt(e.getAttribute("data-quantityinstock"));
        var productname = e.closest(".product__inner").querySelector(".product__name").innerText;

        if((quantityInStock == null) || (isNaN(quantityInStock))) {
            quantityInStock = 0;
        }

        var quantityOfPurchasedProduct = 1;
        if (quantityOfPurchasedProduct > quantityInStock) {
            document.querySelector("#modal__message .modal__message__content").innerHTML = 'Xin lỗi, ' + productname+ ' còn <strong class="text-danger">' + quantityInStock + ' sản phẩm</strong>!';
            document.querySelector("#modal__message").style.display = "flex";
            return false;
        }
        return true;
    }

    $('.product__addtocart').on('click', function () {
        if(!checkQuantityInStockAtProductList(this)) {
            //xử lý lỗi hiển thị trong hàm kiểm tra
        } else {
            var number__of__product = document.getElementsByClassName("number_of_product")[0];
            if (number__of__product != null) {
                number__of__product.innerHTML = parseInt(number__of__product.innerHTML) + 1;
            }

            var icon__shoppincart__number = document.getElementsByClassName("icon__shoppincart__number")[0];
            if (icon__shoppincart__number != null) {
                document.getElementsByClassName("icon__shoppincart__number")[0].innerHTML = parseInt(document.getElementsByClassName("icon__shoppincart__number")[0].innerHTML) + 1;
            }

            var formData = new FormData();
            var sku = this.getAttribute("data-productsku");
            formData.append('productsku', sku);
            formData.append('quantity', "1");
            cartAnimate();

            xhr(main_http_server + "gbshop/ajax/addMoreProductToCart.gbe", formData, function (res) {
                var response = JSON.parse(res);

                if(response["error"] != "") {
                    document.querySelector("#modal__message .modal__message__content").innerHTML = response["error"];
                } else {
                    var data = response['data'];
                    if (response.status != 'failed') {
                        var btn__cart = document.getElementById("btn__cart");
                        var cartbutton = document.getElementById("cartbutton");
                        if (btn__cart != null) {
                            btn__cart.setAttribute("href", main_http_server + "gbshop/shoppingcart/cart.gbe");
                        }

                        if (cartbutton != null) {
                            cartbutton.setAttribute("href", main_http_server + "gbshop/shoppingcart/cart.gbe");
                        }
                    }
                }

            });

            //hiệu ứng hình ảnh sản phẩm bay vào icon giỏ hàng góc phải dưới
            var cart = $('#cartbutton');

            if (isMobile == false) {
                var imgtodrag = $(this).parent('.product__addcart').parent('.product__inner').find("img").eq(0);
            } else {
                var imgtodrag = $(this).parent('.product__item__advancebutton--mobile').parent('.product__inner').find("img").eq(0);
            }

            if (imgtodrag) {
                var imgclone = imgtodrag.clone()
                    .offset({
                        top: imgtodrag.offset().top,
                        left: imgtodrag.offset().left
                    })
                    .css({
                        'opacity': '0.5',
                        'position': 'absolute',
                        'height': '100px',
                        'width': '100px',
                        'z-index': '100'
                    })
                    .appendTo($('body'))
                    .animate({
                        'top': cart.offset().top - 10,
                        'left': cart.offset().left - 10,
                        'width': 75,
                        'height': 75
                    }, 1000, 'easeInOutExpo');

                imgclone.animate({
                    'width': 0,
                    'height': 0
                }, function () {
                    $(this).detach()
                });
            }
        }

    });

});

