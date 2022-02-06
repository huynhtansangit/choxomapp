window.addEventListener('DOMContentLoaded', (event) => {
/*    var prescriptionSwiper = new Swiper('.prescription__banner__container', {
        // If we need pagination
        pagination: {
            el: '.prescription__pagination',
            clickable: true
        }
    });*/
});

var triggerInputImage = function () {
    document.getElementById("imageToUpload").click();
};

var uploadImage = function () {
    showLoading();
    var xhr = new XMLHttpRequest();
    xhr.open('POST', main_http_server + 'uploadimage.php');
    xhr.onload = function () {
        if (xhr.status == 200) {
            result = JSON.parse(xhr.response);
            if(result[0] != null) {
                if(result[0].status == 'failed') {
                    $("input[name=attachments]").val("");
                    $("#gol-image-preview-upload").attr("src", "https://demo.gbotweb.com/golead/data/templateform/formdangtoathuoc/upload.png");
                    $("#gol-image-preview-upload").attr("srcset", "https://demo.gbotweb.com/golead/data/templateform/formdangtoathuoc/upload@2x.png 1.25x, https://demo.gbotweb.com/golead/data/templateform/formdangtoathuoc/upload@2x.png 2x");
                    $("#show-imagename").html("");
                    $("#error-message-image").html(result[0].message);
                } else if(result[0].status == 'sucess') {
                    $("#error-message-image").html("");
                    $("#show-imagename").html(result[0].filename);

                    $("#gol-image-preview-upload").attr("src", main_http_server + result[0].url);
                    $("#gol-image-preview-upload").attr("srcset", main_http_server + result[0].url);
                    $("input[name=attachments]").val( main_http_server + result[0].url );

                    $("input[id=imagepath]").val(result[0].filename);
                }
            }

            endLoading();
            //console.log(result[0].filename);
        } else {
            console.log('Có lỗi rồi');
            endLoading();
        }
    };

    var form_data = new FormData();
    var attachment_data = document.getElementById("imageToUpload").files;
    //console.log(attachment_data);
    var totalfiles = attachment_data.length;
    for (var index = 0; index < totalfiles; index++) {
        form_data.append("imagepath[]", attachment_data[index]);
    }
    xhr.send(form_data);

};