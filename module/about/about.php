<?php

$gbeLayout = "layout.tpl";
$gbeTemplate = "about.tpl";
$gbeModuleName = "Về Chợ Xổm";

addGlobalJS("assets/plugins/jquery-3.4.1/jquery-3.4.1.min.js");
addGlobalJS("assets/plugins/jquery-ui/jquery-ui.min.js");
addGlobalJS("./module/gbshop/theme/js/default.js");


//  $jsontext = callAPI("gbframe", "media_getMediaDetail.api", $params, array());
//  $apiData = json_decode($jsontext, true);
// $jsontext = callAPI("gbshop", "product_getProductList.api", $params);
// $productListData = json_decode($jsontext, true);
// $products = $productListData['data'];
// $jsontext = callAPI("gbcms","content_getPostList.api", $params, array());
// $apiData = json_decode($jsontext, true);
// $posts = $apiData['data'];
 //echo '<pre>';
 //var_dump($apiData);

// if ($apiData["error"] == "") {
//     $mediaData = $apiData["data"];

//     if ($mediaData["layouttype"] == "advanced") {
//         $path = "/page/" . $mediaData["seourl"];
//     };

// } else {
//     // header("Location:" . HTTP_SERVER . "404.html");
//     include("404.html");
//     exit;
// }


?>