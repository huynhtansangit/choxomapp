<?php if ($mediaData["layouttype"] == "simple") { ?>
    <div class="container pt-4 pb-5">
    <div id="information__inner" class="row">
        <div class="col-lg-12">
            <img width="100%" height="400" src="<?php echo IMAGE_SERVER . 'fixsize-1600x600/' . $mediaData['image']?>" alt="">
        </div>
        <div class="col-lg-8 offset-lg-2 mt-3">
            <?php echo htmlspecialchars_decode($mediaData["description"]); ?>
        </div>
    </div>

    </div>
<?php } else { ?>
    <?php foreach ($mediaData["framesdata"] as $frameData) 
    {
        $frameName = $frameData['blockcode'];
        $httpFrame = HTTP_SERVER . "module/gbcms/" . $path . "/" . $frameName . "/";
        if($frameData['frametype']=='customframe'){
            $arrFrameModule = explode("_", $frameData['framemodule']);
            $system = $arrFrameModule[0];
            $frameName = str_replace($system . '_', '', $frameData['framemodule']) ;
            include(__DIR__ . "/../" . $system . "/customframe/".$frameName."/template.php");
        } elseif ($frameData['frametype']=='templateframe') {
            $blockdata[$frameData['blockcode']] = $frameData['blockdata'];
            include($path . "/" . $frameName . "/template.tpl");
        }

    }
    ?>
<?php } ?>