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

// Show modal
var modalCloseBtn = document.querySelector(".modal__close");
var modalMessage = document.querySelector("#modal__message");
if(modalCloseBtn != null) {
    modalCloseBtn.addEventListener("click", function (e) {
        modalMessage.style.display = "none";
    });
}

if (modalMessage != null) {
    setInterval(function () {
        modalMessage.style.display = "none";
    }, 8000);
}