<?php
$gbeLayout = "layout.tpl";
$gbeTemplate = "blogdetail.tpl";
$gbeTittle = "Blog Detail";
addGlobalCSS("./module/gbcms/theme/css/defaultblogdetail.css");
addGlobalCSS("./module/gbcms/theme/css/blogdetail.css");

addGlobalJS("./module/gbcms/theme/js/blogdetail.js");
$params = array(
    "id" => $gbeObjectId,
);
$jsontext = callAPI("gbcms","content_getPostList.api", $params, array());
$apiData = json_decode($jsontext, true);
$posts = $apiData['data'];


$jsontext = callAPI("gbcms","content_getPostDetail.api", $params, array());
$apiData = json_decode($jsontext, true);
$post = $apiData['data'];

$nextpost = $apiData['nextpost'];
$previouspost = $apiData['previouspost'];

$months = array(
    "01" => 'Jan',
    "02" => 'Feb',
    "03" => 'Mar',
    "04" => 'Apr',
    "05" => 'May',
    "06" => 'Jun',
    "07" => 'Jul',
    "08" => 'Aug',
    "09" => 'Sep',
    "10" => 'Oct',
    "11" => 'Nov',
    "12" => 'Dec'
);

$error = $apiData['error'];
if (empty($error)) {
    $media = $apiData['data'];
    $media['description'] = htmlspecialchars_decode($media['description']);
    $media['publishdate'] = formatDate($media['publishdate']);

    // get related post
    $params = array(
        "categorycode" => $media['categorycode'],
        "currentpostid" => $media['id']
    );
    $jsontext = callAPI("gbcms", "content_getRelatedPostList.api", $params, array());
    $relatedposts = json_decode($jsontext, true);

    //publish date
    $date_str = $post['publishdate'] ;
    $date_int = strtotime($date_str);
    //d: day ;;; m: month
    $post['publishday'] = date('d', $date_int);
    $post['publishmonth'] = $months[date('m', $date_int)];
    $post['publishyear'] = date('Y', $date_int);
} else {
    header("Location:" . HTTP_SERVER . "404.html");
}

?>

