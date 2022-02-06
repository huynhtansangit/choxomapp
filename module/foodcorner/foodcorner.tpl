<link rel="stylesheet" href="<?= HTTP_ROOTSERVER ?>module/foodcorner/foodcorner.css?v=<?= FILE_VERSION ?>" />  
<section class="food-corner">
    <div class="foot-corner__container container">
        <h3>
            Góc ẩm thực
        </h3>
        <div class="food-corner__site-main">
            <ul class="row food-corner__item-list">
                <?php if(!empty($posts)) { ?>
                <?php foreach($posts as $post) { ?>
                <li class="food-corner__item col-lg-3 col-6">
                    <div class="food-corner__item-inner">
                        <div class="item-thumb">
                            <a href="<?php echo HTTP_SERVER . $post['seourl'] . '.html' ?>" title="<?= $post['name']?>">
                                <img
                                onerror="this.onerror=null; this.src='<?= IMAGE_SERVER?>fixsize-264x176/upload/default.png?v=<?. IMAGE_VERSION?>'"
                                width="264" height="176" class="" alt="<?php echo $post['name']?>"
                                    srcset="<?php echo IMAGE_SERVER ?>fixsize-330x220/<?php echo $post['image'] == '' ? 'upload/default.png' . '?v=' . IMAGE_VERSION : $post['image'] . '?v=' . IMAGE_VERSION?> 1.25x,
                                            <?php echo IMAGE_SERVER ?>fixsize-528x352/<?php echo $post['image'] == '' ? 'upload/default.png' . '?v=' . IMAGE_VERSION : $post['image'] . '?v=' . IMAGE_VERSION?> 2x"
                                    src=   "<?php echo IMAGE_SERVER ?>fixsize-264x176/<?php echo $post['image'] == '' ? 'upload/default.png' . '?v=' . IMAGE_VERSION : $post['image'] . '?v=' . IMAGE_VERSION?>">
                            </a>
                        </div>
                        <div class="item-info">
                            <h5 class="item-name">
                                <a href="<?php echo HTTP_SERVER . $post['seourl'] . '.html'; ?>">
                                    <?php echo $post['name']; ?>
                                </a>
                            </h5>
                            <p class="go-recipe">
                                <a href="<?php echo HTTP_SERVER . $post['seourl'] . '.html'; ?>">
                                    Xem công thức
                                </a>
                            </p>
                        </div>
                    </div>
                </li>
                <?php } ?>
                <?php } ?>
                <!-- <li class="food-corner__item col-lg-3 col-6">
                    <div class="food-corner__item-inner">
                        <div class="item-thumb">
                            <a href="#">
                                <img src="/assets/img/foodcorner/bun-bo-hue-2x.png" alt="iamge">
                            </a>
                        </div>
                        <div class="item-info">
                            <h5 class="item-name">
                                <a href="#">canh bún</a>
                            </h5>
                            <p class="go-recipe">
                                <a href="#">
                                    Xem công thức
                                </a>
                            </p>
                        </div>
                    </div>
                </li> -->
            </ul>
            <div class="food-corner__pagination">
                <div class="food-corner__pagination-nav-link">
                    <div class="nav-link">
                        <?php echo $pagination; ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>