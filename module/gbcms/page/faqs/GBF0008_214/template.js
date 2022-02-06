/*
document.addEventListener('DOMContentLoaded', (event) => {
    var coll = document.getElementsByClassName("faq-collapsible");
    var i;

    for (i = 0; i < coll.length; i++) {
        coll[i].addEventListener("click", function () {
            this.classList.toggle("active");
            var content = this.nextElementSibling;
            console.log(content);
            console.log(content.style.maxHeight);
            if (content.style.maxHeight == 0) {
                content.style.maxHeight = content.scrollHeight + "px";
            } else {
                content.style.maxHeight = 0;
            }
        });
    }
});*/
