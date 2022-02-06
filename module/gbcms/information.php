<?php

$gbeLayout = "layout.tpl";
$gbeTemplate = "information.tpl";

addGlobalCSS("./module/gbcms/theme/css/information.css");

if (!empty($_GET['mediacode'])) {
    $params = array(
        "mediacode" => $_GET['mediacode'],
    );
} else {
    $params = array(
        "mediacode" => $gbeObjectCode,
    );
}

$jsontext = callAPI("gbframe", "media_getMediaDetail.api", $params, array());
$apiData = json_decode($jsontext, true);

//echo '<pre>';
//var_dump($apiData);

if ($apiData["error"] == "") {
    $mediaData = $apiData["data"];

    if ($mediaData["layouttype"] == "advanced") {
        $path = "page/" . $mediaData["seourl"];
    };

} else {
    // header("Location:" . HTTP_SERVER . "404.html");
    include("404.html");
    exit;
}


?>