<?php
include_once("system/pagination.php");
$gbeLayout = "layout.tpl";
$gbeTemplate = "bloglist.tpl";
addGlobalCSS("assets/plugins/font-awesome-5.13.0/css/all.min.css");
addGlobalCSS("./module/gbcms/theme/css/bloglist.css");

$current_link = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? "https" : "http") . "://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
//$categoryid = @$_GET['categoryid'];
$categorycode = $gbeObjectCode;
if ($categorycode == NULL) {
    $categorycode  = "";
}

$page = 1;
if (isset($_GET['page'])) {
    $page = preg_replace('#[^0-9]#i', '', @$_GET['page']);
}

$orderby = @$_GET['orderby'];

$params = array(
    "categorycode" => $categorycode,
    "page" => $page,
    "orderby" => "publishdate",
    "sort" => "DESC"
);

$jsontext = callAPI("gbcms","content_getCategoryList.api", array(), array());
$categorys = json_decode($jsontext, true);

$jsontext = callAPI("gbcms", "content_getHighlightPostList.api");
$apiData = json_decode($jsontext, true);
$highlight_posts = $apiData['data'];

$jsontext = callAPI("gbcms","content_getPostList.api", $params, array());
$apiData = json_decode($jsontext, true);
$posts = $apiData['data'];


$items_per_page = 9;
//get current page
/*** generate paging ***/
$pagination = new Pagination();
$pagination->total = $apiData['itemcount'];
$pagination->page = $page;
$pagination->limit = $items_per_page;
$actual_link = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? "https" : "http") . "://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
$url = preg_replace('/\\?.*/', '', $actual_link);
$pagination->url = $url . "?page={page}";
$pagination = $pagination->render();
?>
