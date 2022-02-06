/**
 * Created by DELL on 12/8/2020.
 */
if (isMobile == false) {
    $("#pd__illustration__thumbnail__image").elevateZoom({
        zoomWindowWidth: 400,
        zoomWindowHeight: 400,
        gallery: 'pd__illustration__review__images',
        cursor: 'pointer',
        galleryActiveClass: 'active',
    });
    document.getElementsByClassName("elevatezoom-gallery")[0].classList.add("active");
}

function gallery(link) {
    $("#pd__illustration__thumbnail__image").attr("srcset", $(link).data('image') + " 1.25x, " + $(link).data('image') + " 2x");
}

function incrementValue(e) {
    e.preventDefault();
    var fieldName = $(e.target).data('field');
    var parent = $(e.target).closest('div');
    var currentVal = parseInt(parent.find('input[name=' + fieldName + ']').val(), 10);

    if (!isNaN(currentVal)) {
        parent.find('input[name=' + fieldName + ']').val(currentVal + 1);
    } else {
        parent.find('input[name=' + fieldName + ']').val(0);
    }
}

function decrementValue(e) {
    e.preventDefault();
    var fieldName = $(e.target).data('field');
    var parent = $(e.target).closest('div');
    var currentVal = parseInt(parent.find('input[name=' + fieldName + ']').val(), 10);

    if (!isNaN(currentVal) && currentVal > 1) {
        parent.find('input[name=' + fieldName + ']').val(currentVal - 1);
    } else {
        parent.find('input[name=' + fieldName + ']').val(1);
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

//hàm kiểm tra số lượng tồn kho để cho phép thêm vào giỏ hàng ở product detail
function checkQuantityInStock() {
    var quantityInStock = parseInt(document.querySelector(".pd__description__quantity").innerText);

    if((quantityInStock == null) || (isNaN(quantityInStock))) {
        quantityInStock = 0;
    }

    var quantityOfPurchasedProduct = parseInt(document.querySelector("input[name=quantity]").value);
    if (quantityOfPurchasedProduct > quantityInStock) {
        document.querySelector(".pd__description__purchase__error").innerText = "Chỉ còn " + quantityInStock + " sản phẩm";
        document.querySelector("input[name=quantity]").value = quantityInStock;
        return false;
    }
    return true;
}

$('.pd__description__number__input').on('click', '.button-plus', function (e) {
    incrementValue(e);
});

$('.pd__description__number__input').on('click', '.button-minus', function (e) {
    decrementValue(e);
});

var quantityinputs = document.querySelectorAll("input[name=quantity]");
quantityinputs.forEach(function (quantityinput) {
    quantityinput.addEventListener("change", function (e) {
        var quanityvalue = parseInt(quantityinput.value);
        if(quanityvalue < 1) {
            quantityinput.value = 1;
        }
    });
});

function show_collapse($close_detail, $open_detail, $unselect_item, $select_item) {
    document.getElementById($close_detail).style.display = "none";
    document.getElementById($open_detail).style.display = "block";

    document.getElementById($unselect_item).classList.remove("active");
    document.getElementById($select_item).classList.add("active");
}

var products_description = document.querySelectorAll(".product__description__tab");
products_description.forEach((infor_div) => {
    if(infor_div.offsetHeight > 350) {
        //expand__btn.style.display = "inline-block";
        var content = infor_div.querySelector(".product__description__tab__content");
        content.classList.remove("active");
        infor_div.innerHTML += '<div class="text-center"><a class="pd__detail__expand" href="javascript:void(0)">Mở rộng</a></div>';
    }
});

var expand__btns = document.querySelectorAll(".pd__detail__expand");
expand__btns.forEach((expand__btn) => {
    expand__btn.addEventListener("click", function() {
        var tabdescription__parent = expand__btn.closest(".product__description__tab");

        var tabdescription__content = tabdescription__parent.querySelector(".product__description__tab__content");

        if(tabdescription__parent.offsetHeight > 390) {
            expand__btn.innerHTML = "Mở rộng";
            tabdescription__content.classList.remove("active");
        } else {
            expand__btn.innerHTML = "Thu gọn";
            tabdescription__content.classList.add("active");
        }
    });
});



/***SWIPER****/
var galleryImages = new Swiper('.productdetail__imagegallery', {
    direction: 'vertical',
    spaceBetween: 10,
    slidesPerView: 4
});

var galleryShow = new Swiper('.productdetail__imageshow', {
    spaceBetween: 30,
    slidesPerView: 1,
    navigation: {
        nextEl: '.productdetail__imageshow--btnnext',
        prevEl: '.productdetail__imageshow--btnprev'
    },
    thumbs: {
        swiper: galleryImages
    }
});

var product__addtocart = document.getElementsByClassName("purchase__shopping__cart")[0];
if(product__addtocart != null) {
    product__addtocart.addEventListener("click", function () {
        if (document.querySelectorAll("button.active").length!=option_length){
            error.innerHTML = "! Vui lòng chọn đầy đủ thuộc tính sản phẩm.";
        } else if (!checkQuantityInStock()) {
            //phần xử lý hiển thị lỗi nằm chung trong hàm kiểm tra này!
        } else {
            error.innerHTML = "";
            var formData = new FormData();
            var sku = this.getAttribute("data-productsku"), quantity = document.getElementsByClassName("quantity-field")[0].value;
            var cartcode = this.getAttribute("data-cartcode");

            var number_of_product = document.querySelector(".number_of_product");
            if(number_of_product != null) {
                number_of_product.innerHTML = parseInt(document.getElementsByClassName("number_of_product")[0].innerHTML)+ parseInt(quantity);
            }
            var icon__shoppincart__number = document.querySelector(".icon__shoppincart__number");
            if(icon__shoppincart__number != null) {
                icon__shoppincart__number.innerHTML = parseInt(icon__shoppincart__number.innerHTML) + parseInt(quantity);
            }

            formData.append('cartcode', cartcode);
            formData.append('productsku', sku);
            formData.append('quantity', quantity);
            cartAnimate();
            xhr(main_http_server + "gbshop/ajax/addMoreProductToCart.gbe", formData, function (res) {
                var response = JSON.parse(res);
                if(response['error'] != '') {
                    //số lượng sản phẩm tồn kho không đủ đáp ứng
                    document.querySelector(".pd__description__purchase__error").innerText = response['error'];
                } else {
                    var data = response['data'];
                    if(response.status != 'failed') {
                        document.getElementById("btn__cart").setAttribute("href", main_http_server + "gbshop/shoppingcart/cart.gbe");
                    }
                }
            });

            //xử lý hiệu ứng thêm sản phẩm vô giỏ hàng thì hình sản phẩm bay vô icon giỏ hàng bên góc phải dưới
            var cart = $('#cartbutton');
            //var imgtodrag = $(".elevatezoom-gallery.active img").eq(0);
            var imgtodrag = $("#pd__illustration__thumbnail__image").eq(0);
            if (imgtodrag) {
                var imgclone = imgtodrag.clone()
                    .offset({
                        top: imgtodrag.offset().top,
                        //left: imgtodrag.offset().left
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
}

var purchase__buy__now = document.querySelector(".purchase__buy__now");
if(purchase__buy__now != null) {
    purchase__buy__now.addEventListener("click", function () {
        if(!checkQuantityInStock()) {
            //phần xử lý hiển thị lỗi nằm chung trong hàm kiểm tra này!
        } else {
            var formData = new FormData();
            var sku = product__addtocart.getAttribute("data-productsku"), quantity = document.getElementsByClassName("quantity-field")[0].value;
            var cartcode = product__addtocart.getAttribute("data-cartcode");

            formData.append('cartcode', cartcode);
            formData.append('productsku', sku);
            formData.append('quantity', quantity);

            xhr(main_http_server + "gbshop/ajax/addMoreProductToCart.gbe", formData, function (res) {
                var response = JSON.parse(res);
                if(response["error"] != '') {
                    document.querySelector(".pd__description__purchase__error").innerText = response["error"];
                } else {
                    //console.log(res);
                    var data = response["data"];
                    location.href = main_http_server + "gbshop/shoppingcart/cart.gbe";
                }
            });
        }
    });
}

//đây là nút thêm giỏ hàng ở phần những sản phẩm liên quan
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
        });

        //xử lý hiệu ứng thêm sản phẩm vô giỏ hàng thì hình sản phẩm bay vô icon giỏ hàng bên góc phải dưới
        var cart = $('#cartbutton');
        var imgtodrag = $(this).parent('.product__addcart').parent('.product__inner').find("img").eq(0);
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
