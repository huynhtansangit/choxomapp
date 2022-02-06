<style>
    .blog-headder {
        height: 73px;
    }

    @media (max-width: 991px) {
        .blog-headder {
            height: 61px;
        }
    }
</style>
<section class="blog-detail">
    <div class="container">
        <div class="row">
            <div id="blog-content" class="col-12">
                <div id="thumbnail-0" class="pt-4 mb-30" style="display:none">
                    <div class="ed-container">
                        <h1 class="blog-title mb-50">
                            <?php echo($post["name"]) ?>
                        </h1>

                        <div class="d-flex mb-50">
                            <div class="mr-auto ed-categoryname">
                                <?php echo $post["categoryname"] ?>
                            </div>
                            <div class="clearfix" data-toggle="tooltip" data-placement="bottom"
                                title="This function is not completed." style="margin-right:15px">
                                <span class="mr-2 d-none d-sm-inline" style="font-size: 14px;">Share this:</span>
                                <a class="pointer logo-s"
                                    href="https://pinterest.com/pin/create/link/?url=<?php echo urlencode(HTTP_SERVER . $gbeSEOURL . '.html') ?>"
                                    target="_blank" style="background: #bd081c; text-decoration: none;"><i
                                        class="fab fa-pinterest-p text-white"></i></a>
                                <a class="pointer mr-2 logo-s"
                                    href="https://twitter.com/intent/tweet?url=<?php echo HTTP_SERVER ?>/<?php echo $gbeSEOURL?>.html"
                                    target="_blank" style="background: #55acee; text-decoration: none;"><i
                                        class="fab fa-twitter text-white"></i></a>
                                <a class="pointer mr-2 logo-s"
                                    href="https://www.facebook.com/sharer/sharer.php?u=<?php echo HTTP_SERVER ?>/<?php echo $gbeSEOURL?>.html"
                                    target="_blank" style="background: #3b5999;"><i
                                        class="fab fa-facebook-f text-white"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="position-relative text-center">
                        <img srcset="<?php echo(IMAGE_SERVER . 'fixsize-1000x600/' . $post['image']) ?> 1.25x, <?php echo(IMAGE_SERVER . 'fixsize-1000x600/' . $post['image']) ?> 2x"
                            src="<?php echo(IMAGE_SERVER . 'fixsize-1000x600/' . $post['image']) ?>"
                            class="blog-thumbnail border-radius-10" width="1000px" height="600px"
                            alt="Responsive image">
                    </div>
                </div>

                <div id="thumbnail-1" class="mb-50" style="display:none">
                    <div class="">
                        <div class="row pt-2">
                            <div class="col-md-6">
                                <div class="position-relative">
                                    <img srcset="<?php echo(IMAGE_SERVER . 'fixsize-1080x648/' . $post['image']) ?> 1.25x, <?php echo(IMAGE_SERVER . 'fixsize-1080x648/' . $post['image']) ?> 2x"
                                        src="<?php echo(IMAGE_SERVER . 'fixsize-540x324/' . $post['image']) ?>"
                                        class="border-radius-5 blog-thumbnail" width="100%" height="auto"
                                        alt="Responsive image">
                                </div>
                            </div>
                            <div class="col-md-6 pt-3 pb-3 d-flex align-items-start flex-column">
                                <div class="pb-2 ed-categoryname">
                                    <?php echo $post["categoryname"] ?>
                                </div>
                                <h1 class="blog-title mb-30">
                                    <?php echo($post["name"]) ?>
                                </h1>

                                <p class="blog-summary w-100">
                                    <?php echo strip_tags(htmlspecialchars_decode($post["summary"])) ?>
                                </p>

                                <div class="mt-auto">
                                    <span class="mr-2 d-none d-sm-inline" style="font-size: 14px;">Share this:</span>
                                    <a class="pointer logo-s"
                                        href="https://pinterest.com/pin/create/link/?url=<?php echo urlencode(HTTP_SERVER . $gbeSEOURL . '.html') ?>"
                                        target="_blank" style="background: #bd081c; text-decoration: none;"><i
                                            class="fab fa-pinterest-p text-white"></i></a>
                                    <a class="pointer mr-2 logo-s"
                                        href="https://twitter.com/intent/tweet?url=<?php echo HTTP_SERVER ?>/<?php echo $gbeSEOURL?>.html"
                                        target="_blank" style="background: #55acee; text-decoration: none;"><i
                                            class="fab fa-twitter text-white"></i></a>
                                    <a class="pointer mr-2 logo-s"
                                        href="https://www.facebook.com/sharer/sharer.php?u=<?php echo HTTP_SERVER ?>/<?php echo $gbeSEOURL?>.html"
                                        target="_blank" style="background: #3b5999;"><i
                                            class="fab fa-facebook-f text-white"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="thumbnail-2" style="display:none" class="mb-50">
                    <div class="position-relative">

                        <div class="ed-background-image text-center pb-80 pt-80"
                            style="background-image: url('<?php echo(IMAGE_SERVER . 'fixsize-1600x416/' . $post['image']) ?>');">
                            <div class="container">
                                <h1 class="blog-title text-white mb-50">
                                    <?php echo($post["name"]) ?>
                                </h1>

                                <p class="text-white">
                                    <?php echo $post["categoryname"] ?>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="thumbnail-3" class="pt-50 mb-30" style="display:none">
                    <div class="mb-50">
                        <h1 class="blog-title mb-30">
                            <?php echo($post["name"]) ?>
                        </h1>

                        <div class="d-flex mb-50">
                            <div class="mr-auto ed-categoryname">
                                <?php echo $post["categoryname"] ?>
                            </div>
                            <div class="clearfix" data-toggle="tooltip" data-placement="bottom"
                                title="This function is not completed." style="margin-right:15px">
                                <span class="mr-2 d-none d-sm-inline" style="font-size: 14px;">Share this:</span>
                                <a class="pointer logo-s"
                                    href="https://pinterest.com/pin/create/link/?url=<?php echo urlencode(HTTP_SERVER . $gbeSEOURL . '.html') ?>"
                                    target="_blank" style="background: #bd081c; text-decoration: none;"><i
                                        class="fab fa-pinterest-p text-white"></i></a>
                                <a class="pointer mr-2 logo-s"
                                    href="https://twitter.com/intent/tweet?url=<?php echo HTTP_SERVER ?>/<?php echo $gbeSEOURL?>.html"
                                    target="_blank" style="background: #55acee; text-decoration: none;"><i
                                        class="fab fa-twitter text-white"></i></a>
                                <a class="pointer mr-2 logo-s"
                                    href="https://www.facebook.com/sharer/sharer.php?u=<?php echo HTTP_SERVER ?>/<?php echo $gbeSEOURL?>.html"
                                    target="_blank" style="background: #3b5999;"><i
                                        class="fab fa-facebook-f text-white"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="position-relative">

                        <img srcset="<?php echo(IMAGE_SERVER . 'fixsize-730x438/' . $post['image']) ?> 1.25x, <?php echo(IMAGE_SERVER . 'fixsize-730x438/' . $post['image']) ?> 2x"
                            src="<?php echo(IMAGE_SERVER . 'fixsize-730x438/' . $post['image']) ?>"
                            class="border-radius-10 blog-thumbnail" width="730px" height="438px" alt="Responsive image">

                    </div>
                </div>

                <div class="ed-container">
                    <div class="entry-content-text">
                        <div id="editor">
                            <?php echo stripslashes(htmlspecialchars_decode($post['description'])); ?>
                        </div>

                    </div>
                </div>
            </div>

            <div id="blog-related-post" class="col-lg-4 pt-50" style="display: none;">
                <ul class="list-post">

                    <li class="mb-30" style="visibility: visible; list-style: none;">
                        <div class="d-flex has-border p-25 border-radius-5">
                            <div class="media-body">
                                <h6 class="mb-15 text-limit-2-row font-medium"><a style="color: inherit;"
                                        href="#">Spending
                                        Some Quality Time with Kids? It’s Possible</a></h6>

                                <div class="entry-meta meta-1 float-left font-x-small text-uppercase">
                                    <span>05 August</span>
                                    <span>150 views</span>
                                </div>
                            </div>
                            <div class="post-thumb-80 d-flex ml-15 border-radius-5">
                                <a class="color-white" href="#">
                                    <img src="http://demos.alithemes.com/html/stories/demo/assets/imgs/news/thumb-6.jpg"
                                        alt="">
                                </a>
                            </div>
                        </div>
                    </li>
                    <li class="mb-30" style="visibility: visible; list-style: none;">
                        <div class="d-flex has-border p-25 border-radius-5">
                            <div class="media-body">
                                <h6 class="mb-15 text-limit-2-row font-medium"><a style="color: inherit;"
                                        href="#">Relationship
                                        Podcasts are Having “That” Talk</a></h6>

                                <div class="entry-meta meta-1 float-left font-x-small text-uppercase">
                                    <span>12 August</span>
                                    <span>6K views</span>
                                </div>
                            </div>
                            <div class="post-thumb-80 d-flex ml-15 border-radius-5">
                                <a class="color-white" href="#">
                                    <img src="http://demos.alithemes.com/html/stories/demo/assets/imgs/news/thumb-7.jpg"
                                        alt="">
                                </a>
                            </div>
                        </div>
                    </li>
                    <li class="mb-30" style="visibility: visible; list-style: none;">
                        <div class="d-flex has-border p-25 border-radius-5">
                            <div class="media-body">
                                <h6 class="mb-15 text-limit-2-row font-medium"><a style="color: inherit;"
                                        href="#">Here’s
                                        How to Get the Best Sleep at Night</a></h6>

                                <div class="entry-meta meta-1 float-left font-x-small text-uppercase">
                                    <span>15 August</span>
                                    <span>16K views</span>
                                </div>
                            </div>
                            <div class="post-thumb-80 d-flex ml-15 border-radius-5">
                                <a class="color-white" href="#">
                                    <img src="http://demos.alithemes.com/html/stories/demo/assets/imgs/news/thumb-2.jpg"
                                        alt="">
                                </a>
                            </div>
                        </div>
                    </li>
                    <li class="mb-30" style="visibility: visible; list-style: none;">
                        <div class="d-flex has-border p-25 border-radius-5">
                            <div class="media-body">
                                <h6 class="mb-15 text-limit-2-row font-medium"><a style="color: inherit;"
                                        href="#">America’s
                                        Governors Get Tested for a Virus That Is Testing Them</a></h6>

                                <div class="entry-meta meta-1 float-left font-x-small text-uppercase">
                                    <span>12 August</span>
                                    <span>3K views</span>
                                </div>
                            </div>
                            <div class="post-thumb-80 d-flex ml-15 border-radius-5">
                                <a class="color-white" href="#">
                                    <img src="http://demos.alithemes.com/html/stories/demo/assets/imgs/news/thumb-3.jpg"
                                        alt="">
                                </a>
                            </div>
                        </div>
                    </li>

                </ul>
            </div>
        </div>

    </div>

    <div class="container">
        <div class="related-post">
            <h3 class="title">Bài viết liên quan</h3>

            <div class="row">
                <?php if(!empty($relatedposts)) { ?>
                <!--Chọn biến $p vì để không trùng với biến $post -->
                <?php foreach($relatedposts as $index => $p) { ?>
                <?php if($index < 3) { ?>
                <div class="col-md-4 relatedpost__item">
                    <a href="<?php echo $p['seourl'] . '.html'; ?>" class="relatedpost__image">
                        <div class="images__group">
                            <img width="390" height="260" class="" alt=""
                                srcset="<?php echo IMAGE_SERVER.'fixsize-780x520/'.$p['image'] . '?v=' . IMAGE_VERSION ?> 1.25x, <?php echo IMAGE_SERVER.'fixsize-780x520/'.$p['image'] . '?v=' . IMAGE_VERSION ?> 2x"
                                src="<?php echo IMAGE_SERVER.'fixsize-780x520/'.$p['image'] . '?v=' . IMAGE_VERSION ?>">

                        </div>
                    </a>

                    <a class="relatedpost__title" href="<?php echo $p['seourl'] . '.html'; ?>">
                        <p>
                            <?php echo $p['name']; ?>
                        </p>
                    </a>

                    <!-- /.End of blog list -->
                </div>
                <?php } ?>
                <?php } ?>
                <?php } ?>
            </div>
        </div>
    </div>
</section>

<script>
    var check_style = "<?php echo $post['headingstyle']?>";
    document.title = "<?php echo $post['name'] ?>"; //load title
</script>