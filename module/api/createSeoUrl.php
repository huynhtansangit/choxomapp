<?php

$getdata = $_GET;

$seourl = $getdata['seourl'];
$module = $getdata['module'];
$function = $getdata['function'];
createSeoUrl($seourl, $module, $function);

/***************************************************************/
/*************      Tạo FILE cache data/seourl           ***********/
/**************************************************************/

function createSeoUrl($seourl, $module, $function) {

    $params = array(
        "seourl" => $seourl
    );
    $cachedata = callAPI("gbcms",'content_getPageSettingBySeourl.api', $params, array());

    $cachedata = json_decode($cachedata, true);

    $cachedata['module'] = $module;
    $cachedata['function'] = $function;
    $cachedata = json_encode($cachedata);
    $filename = $seourl . ".cache";
    file_put_contents("data/seourl/" . $filename, $cachedata);

}