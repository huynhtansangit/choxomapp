<?php
include_once("system/pagination.php");
$gbeLayout = "layout.tpl";
$gbeTemplate = "foodcorner.tpl";
$gbeModuleName = "Liên hệ";


addGlobalJS("assets/plugins/jquery-3.4.1/jquery-3.4.1.min.js");
addGlobalJS("assets/plugins/jquery-ui/jquery-ui.min.js");
addGlobalJS("./module/gbshop/theme/js/default.js");

$current_link = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? "https" : "http") . "://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
$page = 1;
if (isset($_GET['page'])) {
    $page = preg_replace('#[^0-9]#i', '', @$_GET['page']);
}

$params = array(
    "page" => $page,
    "orderby" => "publishdate",
    "sort" => "DESC"
);

$jsontext = callAPI("gbcms","content_getFoodBlogList.api", $params, array());
$apiData = json_decode($jsontext, true);
$posts = $apiData['data'];

$items_per_page = 12;

//get current page
/*** generate paging ***/
$pagination = new Pagination();
if($device =='desktop')
{
    $pagination->num_links=5;
}
else {
    $pagination->num_links=3;

}
$pagination->total = $apiData['itemcount'];
$pagination->page = $page;
$pagination->limit = $items_per_page;
$actual_link = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? "https" : "http") . "://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
$url = preg_replace('/\\?.*/', '', $actual_link);
$pagination->url = $url . "?page={page}";
$pagination = $pagination->render();
?>