<link rel="stylesheet" href="<?php echo $httpFrame ?>template.css">
<style>
    .item__title {
        color: #2F64A6;
        display: block;
    }

    .content {
        max-height: 0;
    }

    .item__content {
        color: #90A6C9;

    }
</style>
<div class="gbframeblock gbf__0008 py-4">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <?php if (!empty($blockdata['GBF0008_310'])) { ?>
                <?php foreach ($blockdata['GBF0008_310'] as $faq) { ?>
                    <a class="collapsible item__title"><?php echo $faq['col01']; ?></a>
                    <div class="content">
                        <p><?php echo $faq['col02']; ?></p>
                    </div>
                <?php } ?>
                <?php } ?>
            </div>
        </div>

    </div>

</div>
<script src="<?php echo $httpFrame ?>template.js"></script>