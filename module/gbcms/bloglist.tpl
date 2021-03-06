<div class="blog">
    <div class="container">
        <div class="blog__main__wrapper">
            <div class="row">
                <?php if(!empty($posts))
                for($i=0; $i<2; $i++) {
                if(!empty($posts[$i])) { ?>
                <div class="col-lg-6">
                    <div class="blog__wrapper__content">
                        <a href="<?php echo HTTP_SERVER . $posts[$i]['seourl'] . '.html'; ?>" class="blog__wrapper__image">
                            <div class="images__group">
                                <img width="" height="" class="" alt=""
                                     srcset="<?php echo IMAGE_SERVER.'fixsize-1250x830/'.$posts[$i]['image'] . '?v=' . IMAGE_VERSION ?> 1.25x, <?php echo IMAGE_SERVER.'fixsize-1250x830/'.$posts[$i]['image'] . '?v=' . IMAGE_VERSION ?> 2x"
                                     src="<?php echo IMAGE_SERVER.'fixsize-1250x830/'.$posts[$i]['image'] . '?v=' . IMAGE_VERSION ?>">

                            </div>
                        </a>

                        <div class="blog__wrapper__title">
                            <div class="category__title"><?php echo $posts[$i]['categoryname']; ?></div>
                            <a href="<?php echo HTTP_SERVER . $posts[$i]['seourl'] . '.html'; ?>"><?php echo $posts[$i]['name']; ?></a>
                        </div>
                    </div>
                </div>
                <?php } } ?>
            </div>
        </div>
        <div class="blog__main__content">
            <div class="row">
                <div class="blog__market__items col-lg-8">
                    <?php if (sizeof($posts)>2) for($i=2; $i < sizeof($posts); $i++) { ?>
                    <?php if(!empty($posts[$i])){ ?>
                    <div class="blog__market__item">
                        <a href="<?php echo HTTP_SERVER . $posts[$i]['seourl'] . '.html'; ?>" class="blog__market__image">
                            <div class="images__group">
                                <img width="390" height="260" class="" alt=""
                                     srcset="<?php echo IMAGE_SERVER.'fixsize-780x520/'.$posts[$i]['image'] . '?v=' . IMAGE_VERSION ?> 1.25x, <?php echo IMAGE_SERVER.'fixsize-780x520/'.$posts[$i]['image'] . '?v=' . IMAGE_VERSION ?> 2x"
                                     src="<?php echo IMAGE_SERVER.'fixsize-780x520/'.$posts[$i]['image'] . '?v=' . IMAGE_VERSION ?>">

                            </div>
                        </a>

                        <div class="blog__market__title">
                            <div class="category__title"><?php echo $posts[$i]['categoryname']; ?></div>
                            <a href="<?php echo HTTP_SERVER . $posts[$i]['seourl'] . '.html'; ?>"><?php echo $posts[$i]['name']; ?></a>
                            <div class="blog__summary"><?php echo htmlspecialchars_decode($posts[$i]['summary']); ?></div>
                        </div>
                    </div>
                    <?php } ?>
                    <?php } ?>
                    <div class="row">
                        <div class="col-md-12 pagi-area text-center">
                            <div class="text-center mt-3">
                                <ul class="pagination justify-content-end">
                                    <?php echo $pagination; ?>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="blog__news__and__subscribe col-lg-3">
                    <?php if(!empty($highlight_posts)) { ?>
                    <div class="blog__news">
                        <div class="blog__news__title">
                            Tin n???i b???t
                        </div>

                        <div class="blog__hotnews__items">
                            <?php for($i = 0; $i < 4; $i++) { ?>
                            <div class="blog__hotnews__item">
                                <span>0<?php echo $i + 1?></span>
                                <a href="<?php echo HTTP_SERVER . $highlight_posts[$i]['seourl'] ?>.html"><?php echo $highlight_posts[$i]['name'] ?></a>
                            </div>
                            <?php } ?>
                            <!--
                            <div class="blog__hotnews__item">
                                <span>02</span>
                                <a href="https://www.gbmaster.com//rang-ro-don-tet-voi-meo-lam-dep-da-trong-thoi-gian-ngan.html">R???ng r??? ????n T???t v???i m???o l??m ?????p da trong th???i gian ng???n</a>
                            </div>
                            <div class="blog__hotnews__item">
                                <span>03</span>
                                <a href="https://www.gbmaster.com//duong-da-mua-hanh-kho.html">D?????ng da m??a hanh kh??</a>
                            </div>
                            <div class="blog__hotnews__item">
                                <span>04</span>
                                <a href="https://www.gbmaster.com//thuc-pham-nen-an-hang-ngay-de-tranh-tac-nghen-dong-mach-ngua-dau-tim.html">Th???c ph???m n??n ??n h??ng ng??y ????? tr??nh t???c ngh???n ?????ng m???ch, ng???a ??au tim</a>
                            </div>
                            -->
                        </div>
                    </div>
                    <?php } ?>
                    <div gbfid="F135601a1af9c87aa">
                        <form id="F135601a1af9c87aa">
                            <input type="hidden" name="formcode" value="F135601a1af9c87aa">
                            <div class="gol-blog__subscribe">
                                <img width="120" height="97" class="blog__subscribe__image" alt=""
                                     src="https://demo.gbotweb.com/golead/data/templateform/formblognewsletter/subscri.png">

                                <p class="blog__subscribe__title">?????ng b??? l??? th??ng tin!</p>

                                <p class="blog__subscribe__summary">Nh???n nh???ng th??ng tin m???i nh???t c???a th??? tr?????ng
                                    ???????c g???i
                                    qua email h??ng tu???n.</p>

                                <div id="email-wrapper">
                                    <input id="email" class="blog__subscribe__input" type="text" name="email" placeholder="Nh???p email ????ng k??" required>
                                </div>

                                <a id="btn-submit-F135601a1af9c87aa" class="blog__subscribe__btn" href="javascript:void(0)">????ng k??</a>
                            </div>
                        </form>

                        <div id="mydialog" class="gol-mydialog">
                            <div class="gol-mydialog_container">
                                <div class="gol-mydialog_header"><i class="fa"></i>&nbsp; <span>Th??ng b??o</span></div>
                                <div class="gol-mydialog_body"></div>
                                <div class="gol-mydialog_footer">
                                    <button type="button" autofocus class="btnok btn gol-btn-primary">OK</button>
                                    <button type="button" class="btncancel btn gol-btn-light">Cancel</button>
                                    <button type="button" autofocus class="btnagreedelete btn gol-btn-danger">Agree</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--<form id="F132600042212dc6d" class="blog__subscribe">
                        <img width="120" height="97" class="blog__subscribe__image" alt=""
                             srcset="<?php echo HTTP_SERVER ?>module/gbcms/theme/img/subscri.png"
                             src="<?php echo HTTP_SERVER ?>module/gbcms/theme/img/subscri.png">

                        <p class="blog__subscribe__title">?????ng b??? l??? th??ng tin!</p>

                        <p class="blog__subscribe__summary">Nh???n nh???ng th??ng tin m???i nh???t c???a th??? tr?????ng
                            ???????c g???i
                            qua email h??ng tu???n.</p>
                        <input class="blog__subscribe__input" type="text" placeholder="Nh???p email ????ng k??">
                        <a id="btn-submit-F132600042212dc6d" class="blog__subscribe__btn" href="javascript">????ng k??</a>
                    </form>
                    -->
                </div>
            </div>
        </div>
    </div>
</div>