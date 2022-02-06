<?php
$gbeLayout = "layout.tpl";
$gbeTemplate = "search.tpl";
addGlobalCSS("./module/gbcms/theme/css/search.min.css");

$keyword = $_GET['keyword'];
$params = array(
    "keyword" => $keyword
);

$jsontext = callAPI("gbcms", "content_search.api", $params, array());
$apiData = json_decode($jsontext, true);
$products = $apiData["data"];
?>