<?php if(!empty($products)) { ?>
<div class="container py-5">
    <div class="row">
        <div class="col-lg-12 mb-3">
            <h2>Kết quả tìm kiếm</h2>

            <p>Tìm thấy <strong><?php echo count($products) ?></strong> kết quả với từ khóa: <strong><?php echo $keyword ?></strong></p>
        </div>
        <?php foreach ($products as $product) { ?>
        <div class="col-lg-12 mb-3 mb-lg-5 d-flex">
            <div class="news-item-image d-none d-lg-block mr-3">
                <a href="<?php echo HTTP_SERVER . $product['linkproductdetail']?>">
                    <img width="200" height="120" alt="" class=""
                         srcset="<?php echo IMAGE_SERVER ?>resize-400x240/<?php echo $product['productavatar'] == '' ? 'upload/default.png' . '?v=' . IMAGE_VERSION : $product['productavatar'] . '?v=' . IMAGE_VERSION?> 1.25x,
                         <?php echo IMAGE_SERVER ?>resize-400x240/<?php echo $product['productavatar'] == '' ? 'upload/default.png' . '?v=' . IMAGE_VERSION : $product['productavatar'] . '?v=' . IMAGE_VERSION?> 2x"
                         src="<?php echo IMAGE_SERVER ?>resize-200x120/<?php echo $product['productavatar'] == '' ? 'upload/default.png' . '?v=' . IMAGE_VERSION : $product['productavatar'] . '?v=' . IMAGE_VERSION?>"/>
                </a>
            </div>
            <div class="news-item-content pb-4 pb-lg-0">
                <h5><a class="search-item-title" href="<?php echo HTTP_SERVER . $product['linkproductdetail']?>"><?php echo $product['productname'] ?></a></h5>
                <!--<div class="<?php echo $productstatusclass[$product['productstatus']] ?>"><span class="product-item-tag font-weight-bold mb-3">Đã kết thúc</span></div>-->
                <div class="advancesearch-link"><a
                            href="<?php echo HTTP_SERVER . $product['linkproductdetail']?>"><?php echo HTTP_SERVER . $product['linkproductdetail']?></a>
                </div>
            </div>
        </div>
        <?php } ?>
    </div>
</div>
<?php } else { ?>
<div class="container py-5">
    <h2>Kết quả tìm kiếm</h2>
    <div class="row">
        <div class="col-lg-12 mb-3">
            <p class="text-muted">Tìm thấy 0 kết quả với từ khóa: &nbsp;<strong><?php echo $keyword?></strong></p>
        </div>
    </div>
</div>
<?php } ?>

