var inputLeft = document.getElementById("input-left");
var inputRight = document.getElementById("input-right");

var thumbLeft = document.querySelector(".slider > .thumb.left");
var thumbRight = document.querySelector(".slider > .thumb.right");
var range = document.querySelector(".slider > .range");

function showBar(ele){
    ele.style.display = ele.style.display === "none" ? "block" : "none";
}

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function setLeftValue() {
    var _this = inputLeft,
        min = parseInt(_this.min),
        max = parseInt(_this.max);

    _this.value = Math.min(parseInt(_this.value), parseInt(inputRight.value) - 1);

    var percent = ((_this.value - min) / (max - min)) * 100;

    thumbLeft.style.left = percent + "%";
    range.style.left = percent + "%";
}
setLeftValue();

function setRightValue() {
    var _this = inputRight,
        min = parseInt(_this.min),
        max = parseInt(_this.max);

    _this.value = Math.max(parseInt(_this.value), parseInt(inputLeft.value) + 1);

    var percent = ((_this.value - min) / (max - min)) * 100;

    thumbRight.style.right = (100 - percent) + "%";
    range.style.right = (100 - percent) + "%";
}
setRightValue();

inputLeft.addEventListener("input", setLeftValue);
inputRight.addEventListener("input", setRightValue);

inputLeft.addEventListener("mouseover", function() {
    thumbLeft.classList.add("hover");
});

inputLeft.addEventListener("mouseout", function() {
    thumbLeft.classList.remove("hover");
});
inputLeft.addEventListener("mousedown touchstart dragstart", function() {
    thumbLeft.classList.add("active");
});
inputLeft.addEventListener("mouseup touchend dragend", function() {
    thumbLeft.classList.remove("active");
});

inputRight.addEventListener("mouseover", function() {
    thumbRight.classList.add("hover");
});
inputRight.addEventListener("mouseout", function() {
    thumbRight.classList.remove("hover");
});
inputRight.addEventListener("mousedown touchstart dragstart", function() {
    thumbRight.classList.add("active");
});
inputRight.addEventListener("mouseup touchend dragend", function() {
    thumbRight.classList.remove("active");
});

//CUSTOM SELECT
var x, i, j, l, ll, selElmnt, a, b, c;
/* Look for any elements with the class "custom-select": */
x = document.getElementsByClassName("productlist__rank__select");
l = x.length;
for (i = 0; i < l; i++) {
    selElmnt = x[i].getElementsByTagName("select")[0];
    ll = selElmnt.length;
    /* For each element, create a new DIV that will act as the selected item: */
    a = document.createElement("DIV");
    a.setAttribute("class", "select-selected");
    a.innerHTML = selElmnt.options[selElmnt.selectedIndex].innerHTML;
    x[i].appendChild(a);
    /* For each element, create a new DIV that will contain the option list: */
    b = document.createElement("DIV");
    b.setAttribute("class", "select-items select-hide");
    for (j = 0; j < ll; j++) {
        /* For each option in the original select element,
         create a new DIV that will act as an option item: */
        c = document.createElement("DIV");
        c.innerHTML = selElmnt.options[j].innerHTML;
        c.addEventListener("click", function(e) {
            /* When an item is clicked, update the original select box,
             and the selected item: */
            var y, i, k, s, h, sl, yl;
            s = this.parentNode.parentNode.getElementsByTagName("select")[0];
            sl = s.length;
            h = this.parentNode.previousSibling;
            for (i = 0; i < sl; i++) {
                if (s.options[i].innerHTML == this.innerHTML) {
                    s.selectedIndex = i;
                    h.innerHTML = this.innerHTML;
                    y = this.parentNode.getElementsByClassName("same-as-selected");
                    yl = y.length;
                    for (k = 0; k < yl; k++) {
                        y[k].removeAttribute("class");
                    }
                    this.setAttribute("class", "same-as-selected");
                    break;
                }
            }
            h.click();
        });
        b.appendChild(c);
    }
    x[i].appendChild(b);
    a.addEventListener("click", function(e) {
        /* When the select box is clicked, close any other select boxes,
         and open/close the current select box: */
        e.stopPropagation();
        closeAllSelect(this);
        this.nextSibling.classList.toggle("select-hide");
        this.classList.toggle("select-arrow-active");
    });
}

function closeAllSelect(elmnt) {
    /* A function that will close all select boxes in the document,
     except the current select box: */
    var x, y, i, xl, yl, arrNo = [];
    x = document.getElementsByClassName("select-items");
    y = document.getElementsByClassName("select-selected");
    xl = x.length;
    yl = y.length;
    for (i = 0; i < yl; i++) {
        if (elmnt == y[i]) {
            arrNo.push(i)
        } else {
            y[i].classList.remove("select-arrow-active");
        }
    }
    for (i = 0; i < xl; i++) {
        if (arrNo.indexOf(i)) {
            x[i].classList.add("select-hide");
        }
    }
}

/* If the user clicks anywhere outside the select box,
 then close all select boxes: */
document.addEventListener("click", closeAllSelect);

//var manufacturercodes = document.querySelectorAll('input[name^="manufacturercodes"]');
//
//manufacturercodes.forEach(manufacturercode => {
//    var label_manufacturecode = manufacturercode.closest("label");
//    label_manufacturecode.addEventListener("click", function() {
//       console.log("hello");
//    });
//});

//SUBMIT FILTER
document.querySelectorAll(".category__link").forEach(function(e) {
    e.addEventListener("click", function() {
        document.querySelector("input[name=categorycode]").value = e.getAttribute("data-categorycode");
        document.getElementById("frm__products").submit(function() {
            location.reload();
        });
    });
});

document.querySelectorAll(".select-items div").forEach(function(e) {
    e.addEventListener("click", function() {
        document.getElementById("frm__products").submit(function() {
            location.reload();
        });
    });
});

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
/*********NAV FILTER PRODUCTS ON MOBILE**********/
function openFilterProductList() {
    var header__menu = document.getElementById("productlist__filter__mobile");
    if(header__menu != null) {
        header__menu.style.width = "100%";
    }
}

/* Close when someone clicks on the "x" symbol inside the overlay */
function closeFilterProductList() {
    var header__menu = document.getElementById("productlist__filter__mobile");
    if(header__menu != null) {
        header__menu.style.width = "0%";
    }
}

window.addEventListener("click", function(event) {
    if ((!event.target.closest(".header__overlay__content")) && (!event.target.closest("#navBarMenu__icon"))) {
        closeFilterProductList();
    }
});


/*
 Add to cart fly effect with jQuery. - May 05, 2013
 (c) 2013 @ElmahdiMahmoud - fikra-masri.by
 license: https://www.opensource.org/licenses/mit-license.php
 */

//xử lý hiệu ứng thêm sản phẩm vô giỏ hàng thì hình sản phẩm bay vô icon giỏ hàng bên góc phải dưới
/*
$('.product__addtocart').on('click', function () {
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
});*/

/**Open Category**/
var liIsInActive = document.querySelector(".product__categories li.active");
if(liIsInActive != null) {
    var ulWrapLiIsInActive = liIsInActive.closest(".children");

    if(ulWrapLiIsInActive != null) {
        var ulWrapperPreviousEl = ulWrapLiIsInActive.previousElementSibling;
        ulWrapperPreviousEl.classList.add("active");
        ulWrapLiIsInActive.style.maxHeight = ulWrapLiIsInActive.scrollHeight + "px";
    }

}

var liParentIsInActive = document.querySelector(".product__items.collapsible.active");

if(liParentIsInActive != null) {
    var ulNextSiblingWrapper = liParentIsInActive.nextElementSibling;
    if(ulNextSiblingWrapper != null) {
        if(ulNextSiblingWrapper.classList.contains("children")) {
            ulNextSiblingWrapper.classList.add("active");
            ulNextSiblingWrapper.style.maxHeight = ulNextSiblingWrapper.scrollHeight + "px";
        }
    }
}
