
<div class="cart__login__content">
    <div class="cart__login__username">
        <h2>Chào <b><?php echo $_SESSION["loginmembername"] ?></b></h2>
    </div>
    <div class="cart__login__icon">
        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Layer_1"
             x="0px" y="0px" width="148px" height="114px" viewBox="0 0 203.26 203.26"
             enable-background="new 0 0 203.26 203.26" xml:space="preserve">
<g>
    <path fill-rule="evenodd" clip-rule="evenodd" fill="#FFFFFF"
          d="M190.986,74.153c-48.377,0-95.849,0-143.929,0   c2.306,5.242,4.201,10.009,6.545,14.542c0.556,1.075,2.622,1.935,3.997,1.938c40.96,0.102,81.92,0.101,122.881-0.001   c1.367-0.004,3.424-0.875,3.98-1.952C186.798,84.15,188.687,79.388,190.986,74.153z M178.8,101.448c-40.221,0-79.68,0-119.543,0   c2.036,4.697,3.645,9.059,5.84,13.102c0.734,1.352,2.966,2.672,4.52,2.678c32.986,0.154,65.975,0.135,98.961,0.051   c1.268-0.004,3.203-0.637,3.686-1.568C174.597,111.198,176.542,106.483,178.8,101.448z M151.755,152.062   c-8.736-0.059-15.156,5.912-15.268,14.201c-0.108,8.145,6.594,14.857,14.876,14.896c8.248,0.039,15.011-6.613,14.997-14.754   C166.347,158.198,160.158,152.12,151.755,152.062z M67.889,152.062c-8.872-0.021-14.947,5.838-14.933,14.4   c0.014,8.299,6.555,14.736,14.925,14.693c8.258-0.041,14.454-6.203,14.534-14.455C82.501,157.749,76.88,152.083,67.889,152.062z"/>
    <path fill-rule="evenodd" clip-rule="evenodd"
          d="M11.595,22.01c2.25,2,3.731,5.242,4.988,8.167   c13.565,31.565,27.04,63.168,40.319,94.854c1.282,3.059,3.176,2.809,5.465,2.809c34.302,0.002,68.603-0.006,102.905,0.01   c5.764,0.004,8.554,2.027,9.061,6.396c0.548,4.719-2.344,8.506-7.545,8.525c-37.465,0.148-74.931,0.145-112.395,0.004   c-4.668-0.018-7.854-2.846-9.729-7.328c-8.968-21.43-18.047-42.813-27.136-64.193C11.826,57.836,6.037,44.456,0.287,31.058   c-0.941-4.298,0.639-6.173,1.684-7.798C4.154,20.875,8.03,20.085,11.595,22.01z"/>
    <path fill-rule="evenodd" clip-rule="evenodd"
          d="M203.261,48.056c-1.695,3.321-3.852,6.496-4.969,10.002   c-1.386,4.354-3.952,5.114-8.133,5.066c-19.66-0.226-39.322-0.101-58.984-0.101c-27.827,0-55.654-0.109-83.479,0.114   c-4.369,0.035-6.732-1.297-8.095-5.32c-1.16-3.423-2.746-6.702-4.443-10.762c56.357,0,112.229,0,168.103,0   C203.261,47.39,203.261,47.723,203.261,48.056z"/>
    <path fill-rule="evenodd" clip-rule="evenodd"
          d="M190.986,74.153c-2.299,5.235-4.188,9.997-6.525,14.527   c-0.557,1.077-2.613,1.948-3.98,1.952c-40.961,0.102-81.921,0.103-122.881,0.001c-1.375-0.003-3.44-0.862-3.997-1.938   c-2.345-4.534-4.24-9.3-6.545-14.542C95.137,74.153,142.609,74.153,190.986,74.153z"/>
    <path fill-rule="evenodd" clip-rule="evenodd"
          d="M178.8,101.448c-2.258,5.035-4.203,9.75-6.537,14.262   c-0.482,0.932-2.418,1.564-3.686,1.568c-32.986,0.084-65.975,0.104-98.961-0.051c-1.554-0.006-3.786-1.326-4.52-2.678   c-2.195-4.043-3.804-8.404-5.84-13.102C99.121,101.448,138.58,101.448,178.8,101.448z"/>
    <path fill-rule="evenodd" clip-rule="evenodd"
          d="M151.755,152.062c8.402,0.059,14.592,6.137,14.605,14.344   c0.014,8.141-6.749,14.793-14.997,14.754c-8.282-0.039-14.984-6.752-14.876-14.896   C136.599,157.974,143.019,152.003,151.755,152.062z"/>
    <path fill-rule="evenodd" clip-rule="evenodd"
          d="M67.889,152.062c8.991,0.021,14.612,5.688,14.526,14.639   c-0.08,8.252-6.275,14.414-14.534,14.455c-8.37,0.043-14.911-6.395-14.925-14.693C52.942,157.899,59.018,152.04,67.889,152.062z"/>
</g>
    </svg>
    </div>
    <?php if($cartData['data']['countquantityproductincart']) { ?>
    <div class="cart__login__text">
        <p>
            Bạn có thể lưu giỏ hàng này để mua sắm sau hoặc chia sẻ cho bạn bè giỏ hàng này của bạn.
        </p>
    </div>

    <div class="cart__login__button">
        <a id="btn_savecart" class="cart__button--savecart">
            Lưu giỏ hàng này
        </a>
        <a id="btn_sharecart" class="cart__button--sharecart">
            Chia sẻ giỏ hàng
        </a>
    </div>
    <?php } ?>
    <div class="cart__login__viewcart">
        <a href="<?php echo HTTP_SERVER ?>gbuser/account/carts.gbe" target="_blank">Xem giỏ hàng đã lưu</a>
    </div>
</div>
<div id="modal__copytoclipboard" class="gbmodal">
    <!-- Modal content -->
    <div class="gbmodal__inner">
        <a class="gbclose" href="javascript:void(0)">
            <svg width="14" height="14" viewBox="0 0 1792 1792" xmlns="http://www.w3.org/2000/svg">
                <path
                        d="M1490 1322q0 40-28 68l-136 136q-28 28-68 28t-68-28l-294-294-294 294q-28 28-68 28t-68-28l-136-136q-28-28-28-68t28-68l294-294-294-294q-28-28-28-68t28-68l136-136q28-28 68-28t68 28l294 294 294-294q28-28 68-28t68 28l136 136q28 28 28 68t-28 68l-294 294 294 294q28 28 28 68z"/>
            </svg>
        </a>
        <div class="gbmodal__content">
            <p>Copy đường link này để chia sẻ với bạn bè của bạn !</p>
            <div class="bd__clipboard__wrapper">
                <div class="bd__clipboard">
                    <button type="button" id="bdmyBtn" class="btn__clipboard" title="" data-original-title="Copy to clipboard">Copy</button>

                    <!--
                    <div id="modal__copy__successful" class="gbmodal">
                        <div class="gbmodal__inner">
                            <span class="gbclose">
                                <svg width="14" height="14" viewBox="0 0 1792 1792" xmlns="http://www.w3.org/2000/svg">
                                    <path
                                            d="M1490 1322q0 40-28 68l-136 136q-28 28-68 28t-68-28l-294-294-294 294q-28 28-68 28t-68-28l-136-136q-28-28-28-68t28-68l294-294-294-294q-28-28-28-68t28-68l136-136q28-28 68-28t68 28l294 294 294-294q28-28 68-28t68 28l136 136q28 28 28 68t-28 68l-294 294 294 294q28 28 28 68z"/>
                                </svg>
                            </span>
                            <p>Copy thành công</p>
                        </div>
                    </div>
                    -->
                    <div id="modal__copy__successful">
                        Đã copy
                    </div>
                </div>
                <textarea id="snippetcode" class="highlight w-100" cols="30" rows="2" readonly>

                </textarea>
            </div>
        </div>
    </div>
</div>

<!--popup for saving cart-->
<div id="modal__message" style="display: none;">
    <div class="modal__close">
        <svg width="14" height="14" viewBox="0 0 1792 1792" xmlns="http://www.w3.org/2000/svg">
            <path
                    d="M1490 1322q0 40-28 68l-136 136q-28 28-68 28t-68-28l-294-294-294 294q-28 28-68 28t-68-28l-136-136q-28-28-28-68t28-68l294-294-294-294q-28-28-28-68t28-68l136-136q28-28 68-28t68 28l294 294 294-294q28-28 68-28t68 28l136 136q28 28 28 68t-28 68l-294 294 294 294q28 28 28 68z"/>
        </svg>
    </div>
    <div class="modal__message__content">

    </div>
</div>

<script>
    $(".btn__clipboard").click(function() {
        copyToClipboard(document.getElementById("snippetcode"));
// Get the modal
        var modal = document.getElementById("modal__copy__successful");

        // When the user clicks the button, open the modal
        modal.style.display = "inline-block";

        setTimeout(function() {
            modal.style.display = "none";
        }, 4000);
    });

    function copyToClipboard(elem) {
        // create hidden text element, if it doesn't already exist
        var targetId = "_hiddenCopyText_";
        var isInput = elem.tagName === "INPUT" || elem.tagName === "TEXTAREA";
        var origSelectionStart, origSelectionEnd;
        if (isInput) {
            // can just use the original source element for the selection and copy
            target = elem;
            origSelectionStart = elem.selectionStart;
            origSelectionEnd = elem.selectionEnd;
        } else {
            // must use a temporary form element for the selection and copy
            target = document.getElementById(targetId);
            if (!target) {
                var target = document.createElement("textarea");
                target.style.position = "absolute";
                target.style.left = "-9999px";
                target.style.top = "0";
                target.id = targetId;
                document.body.appendChild(target);
            }
            target.textContent = elem.textContent;
        }
        // select the content
        var currentFocus = document.activeElement;
        target.focus();
        target.setSelectionRange(0, target.value.length);

        // copy the selection
        var succeed;
        try {
            succeed = document.execCommand("copy");
        } catch (e) {
            succeed = false;
        }
        // restore original focus
        if (currentFocus && typeof currentFocus.focus === "function") {
            currentFocus.focus();
        }

        if (isInput) {
            // restore prior selection
            elem.setSelectionRange(origSelectionStart, origSelectionEnd);
        } else {
            // clear temporary content
            target.textContent = "";
        }
        return succeed;
    }

    document.querySelector("#btn_savecart").addEventListener("click", function() {
        showLoading();
        xhr(main_http_server + "gbshop/ajax/saveCart.gbe", new FormData(), function(res) {
            endLoading();
            document.querySelector("#modal__message .modal__message__content").innerHTML = 'Giỏ hàng đã được lưu thành công!';
            document.querySelector("#modal__message").style.display = "flex";
        });
    });

    document.querySelector("#btn_sharecart").addEventListener("click", function() {
        showLoading();
        xhr(main_http_server + "gbshop/ajax/shareCart.gbe", new FormData(), function(res) {
            endLoading();
            var data = (JSON).parse(res);
            console.log(data);
            document.querySelector("#snippetcode").innerHTML = data.shareurl;
            document.querySelector("#modal__copytoclipboard").style.display = "flex";

        });
    });
</script>
