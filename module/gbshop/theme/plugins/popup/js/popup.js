document.addEventListener("DOMContentLoaded", function() {
// Get the button that opens the modal
    var gbbtn_class = document.getElementsByClassName("gbBtn");

    for(var i = 0 ; i < gbbtn_class.length ; i++){
        gbbtn_class[i].addEventListener("click", function(){
            //custom

            var productsku = this.getAttribute("data-productsku");
            var cartcode = this.getAttribute("data-cartcode");
            var modalid = this.getAttribute("data-target");
            var gbmodal = document.querySelector("#" + modalid);

            if(gbmodal != null) {
                if((productsku != "") && (productsku != null) && (cartcode != "") && (cartcode != null)) {
                    gbmodal.innerHTML += `
                        <input type="hidden" name="cartcode" value="`+ cartcode +`">
                        <input type="hidden" name="sku" value="`+ productsku +`">
                        `;

                    //html của modal này bị thay đổi sẽ làm những event đc add vào modal này trước đó sẽ không chạy
                    //trong trường hợp này là nút tắt modal
                    var gbclosesInDeletedModal = gbmodal.querySelectorAll(".gbclose");

                    gbclosesInDeletedModal.forEach(function (gbclose) {
                        gbclose.addEventListener("click", function () {
                            gbclose.closest(".gbmodal").style.display = "none";
                        });
                    });
                    document.querySelector("#frm__delete").addEventListener("submit", function (e) {
                        e.preventDefault();
                        showLoading();
                        //var formData = new FormData(document.querySelector("#frm__delete"));
                        var formData = new FormData();
                        formData.append("cartcode", cartcode);
                        formData.append("sku", productsku);
                        xhr(main_http_server + "gbshop/ajax/deleteProductInCart.gbe", formData, function (res) {
                            var data = JSON.parse(res);
                            if (data.status == 'done') {
                                location.reload();

                            } else {
                                e.target.style.display = "none";
                                alert(data.error);
                            }
                            endLoading();
                        });
                    });
                }
                gbmodal.style.display = "flex";
            }

        });
    }

    // Get the <span> element that closes the modal
    var gbcloses = document.querySelectorAll(".gbclose");

    gbcloses.forEach(function (gbclose) {
        gbclose.addEventListener("click", function () {
            gbclose.closest(".gbmodal").style.display = "none";
        });
    });


    var gbcloseandreload = document.querySelectorAll(".gbreload");
    gbcloseandreload.forEach(function(btn) {
        btn.addEventListener("click", function() {
            location.reload();
        });
    });

    // When the user clicks anywhere outside of the modal, close it
    /*window.onclick = function(event) {
        if ((!event.target.closest(".gbmodal__inner") && !event.target.closest(".gbBtn")) || !event.target.closest(".gbclose")
        || (!event.target.closest(".product__addtocart"))) {
            var gbmodals = document.querySelectorAll(".gbmodal");
            gbmodals.forEach(function(gbmodal) {
                gbmodal.style.display = "none";
            });
        }
    };*/
});
