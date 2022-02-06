<link rel="stylesheet" href="<?php echo $httpFrame ?>template.css">
<div class="promotion">
    <div class="container">
        <div class="row">
            <?php if (!empty($blockdata['GBF0022_215'])) { ?>
            <?php foreach ($blockdata['GBF0022_215'] as $promotion) { ?>
            <div class="col-lg-4 col-12 promotion__banner">
                <a href="<?php echo $promotion['col02']; ?>">
                    <img width="724" height="470" alt="Homepage promotion banner"
                         srcset="<?php echo IMAGE_SERVER ?>fixsize-724x470/<?php echo $promotion['col01'] . '?v=' . IMAGE_VERSION ?> 1.25x, <?php echo IMAGE_SERVER ?>fixsize-724x470/<?php echo $promotion['col01'] . '?v=' . IMAGE_VERSION ?> 2x"
                         src="<?php echo IMAGE_SERVER ?>fixsize-362x235/<?php echo $promotion['col01'] == '' ? 'upload/default.png' . '?v=' . IMAGE_VERSION : $promotion['col01'] . '?v=' . IMAGE_VERSION?>">
                </a>
            </div>
            <?php } ?>
            <?php } ?>
        </div>
    </div>
</div>
