document.addEventListener("DOMContentLoaded", function() {
// Get the button that opens the modal
    var gbbtn_class = document.getElementsByClassName("gbBtn");

// Get the <span> element that closes the modal
    var gbspans = document.querySelectorAll(".gbclose");

    for(var i = 0 ; i < gbbtn_class.length ; i++){
        gbbtn_class[i].addEventListener("click", function(){
            //custom
            var productsku = this.getAttribute("data-productsku");
            var cartcode = this.getAttribute("data-cartcode");
            if((productsku != "") && (productsku != null) && (cartcode != "") && (cartcode != null)) {
                document.querySelector("#frm__delete").innerHTML += `
                <input type="hidden" name="cartcode" value="`+ cartcode +`">
                <input type="hidden" name="sku" value="`+ productsku +`">
                `;
            }

            var modalid = this.getAttribute("data-target");
            var gbmodal = document.querySelector("#" + modalid);
            if(gbmodal != null) {
                gbmodal.style.display = "flex";
            }

        });
    }
// When the user clicks on <span> (x), close the modal
    gbspans.forEach(function(gbspan) {
        gbspan.addEventListener("click", function() {
            var gbmodal = this.closest(".gbmodal");
            gbmodal.style.display = "none";
        });
    });

// When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if ((!event.target.closest(".gbmodal__inner") && !event.target.closest(".gbBtn")) || event.target.closest(".gbclose")) {
            var gbmodals = document.querySelectorAll(".gbmodal");
            gbmodals.forEach(function(gbmodal) {
                gbmodal.style.display = "none";
            });
        }
    };
});
