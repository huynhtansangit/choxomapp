<div class="hamburger__bar">
    <div class="hamburger__bar__container">
        <div class="slide_bar" id="slideBar">
            <svg width="50" height="50" viewBox="0 0 1792 1792" xmlns="http://www.w3.org/2000/svg">
                <path
                        d="M1664 1344v128q0 26-19 45t-45 19h-1408q-26 0-45-19t-19-45v-128q0-26 19-45t45-19h1408q26 0 45 19t19 45zm0-512v128q0 26-19 45t-45 19h-1408q-26 0-45-19t-19-45v-128q0-26 19-45t45-19h1408q26 0 45 19t19 45zm0-512v128q0 26-19 45t-45 19h-1408q-26 0-45-19t-19-45v-128q0-26 19-45t45-19h1408q26 0 45 19t19 45z"/>
            </svg>
        </div>
        <div id="myModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <?php if(empty($_SESSION)) { ?>
                <a class="slidebar__login" target="_blank" href="<?php echo HTTP_SERVER ?>content/login.gbe">??NG
                    NH?P</a>
                <?php } ?>
                <span class="close">&times;</span>
            </div>

        </div>
        <form class="">
            <input type="text" placeholder="Find" aria-label="Search">
            <button type="submit">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                    <defs>
                        <style>
                            .cls-1 {
                                fill: #c1c1c1;
                            }
                        </style>
                    </defs>
                    <title>Asset 8</title>
                    <g id="Layer_2" data-name="Layer 2">
                        <g id="Navigator">
                            <path class="cls-1"
                                  d="M23.71,22.29l-6.83-6.82a9.52,9.52,0,1,0-1.41,1.41l6.82,6.83a1,1,0,0,0,1.42,0A1,1,0,0,0,23.71,22.29ZM9.5,17A7.5,7.5,0,1,1,17,9.5,7.5,7.5,0,0,1,9.5,17Z"/>
                        </g>
                    </g>
                </svg>
            </button>
        </form>

        <div class="hamburger__bar__shopping__cart">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512">
                <path
                        d="M504.717 320H211.572l6.545 32h268.418c15.401 0 26.816 14.301 23.403 29.319l-5.517 24.276C523.112 414.668 536 433.828 536 456c0 31.202-25.519 56.444-56.824 55.994-29.823-.429-54.35-24.631-55.155-54.447-.44-16.287 6.085-31.049 16.803-41.548H231.176C241.553 426.165 248 440.326 248 456c0 31.813-26.528 57.431-58.67 55.938-28.54-1.325-51.751-24.385-53.251-52.917-1.158-22.034 10.436-41.455 28.051-51.586L93.883 64H24C10.745 64 0 53.255 0 40V24C0 10.745 10.745 0 24 0h102.529c11.401 0 21.228 8.021 23.513 19.19L159.208 64H551.99c15.401 0 26.816 14.301 23.403 29.319l-47.273 208C525.637 312.246 515.923 320 504.717 320zM408 168h-48v-40c0-8.837-7.163-16-16-16h-16c-8.837 0-16 7.163-16 16v40h-48c-8.837 0-16 7.163-16 16v16c0 8.837 7.163 16 16 16h48v40c0 8.837 7.163 16 16 16h16c8.837 0 16-7.163 16-16v-40h48c8.837 0 16-7.163 16-16v-16c0-8.837-7.163-16-16-16z"/>
            </svg>
        </div>
    </div>
</div>
