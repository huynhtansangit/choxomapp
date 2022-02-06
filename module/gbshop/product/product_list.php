<?php

include_once("system/pagination.php");
$gbeLayout = "layout.tpl";
$gbeTemplate = "product_list.tpl";

//add library popup
addGlobalCSS("./module/gbshop/theme/plugins/popup/css/popup.min.css");
addGlobalJS("./module/gbshop/theme/plugins/popup/js/popup.js");

addGlobalJS("assets/plugins/jquery-3.4.1/jquery-3.4.1.min.js");
addGlobalJS("assets/plugins/jquery-ui/jquery-ui.min.js");
addGlobalCSS("./module/gbshop/theme/css/product_list.min.css");
addGlobalJS("./module/gbshop/theme/js/default.js");
addGlobalJS("./module/gbshop/theme/js/product_list.js");

$page = 1;
if (isset($_GET['page'])) {
    $page = preg_replace('#[^0-9]#i', '', @$_GET['page']);
}

//RENDER CATEGORY TREE
$jsontext = callAPI("gbshop", "category_getCategoryList.api");
$categories = json_decode($jsontext, true);

$category_html = "";
$open = 0;
$active = "";
$category_breadcrumb_parent = "";
$category_breadcrumb_html = "";


if(!empty($categories)) {
    foreach($categories as $index => $category) {

        if($category['categorycode'] == $gbeObjectCode) {
            $active = ' active ';
            //$category_breadcrumb = $category['categoryname'];
        } else {
            $active = "";
        }
        if(!empty($categories[$index + 1])) {
            if($categories[$index + 1]['level'] > $categories[$index]['level']) {
                $category_html .= '<li><div class="product__items collapsible '. $active .'">'. $category['name'] .'</div><ul class="children">';

                $category_breadcrumb_parent = '<li><a href="'. HTTP_SERVER . $category['seourl'] .'.html">'. $category['name'] .'</a></li>';

                $category_parent = $category['categoryname'];
                if($category['categorycode'] == $gbeObjectCode) {
                    $category_breadcrumb_html .= '<li><a href="'. $category['seourl'] .'.html">'. $category['name'] .'</a></li>';
                }
                    $open++;
            } elseif ($categories[$index + 1]['level'] == $categories[$index]['level']) {
                    $category_html .= '<li class="'. $active .'" ><a class="category__link"  href="'. $category['seourl'] .'.html">' . $category['name'] . '</a></li>';

                if($category['categorycode'] == $gbeObjectCode) {
                    $category_breadcrumb_html .= $category_breadcrumb_parent . '<li><a href="'. $category['seourl'] .'.html">'. $category['name'] .'</a></li>';
                }
            } else {
                $category_html .= '<li class="'. $active .'"><a class="category__link"  href="'. $category['seourl'] .'.html">' . $category['name'] . '</a></li>';

                if($category['categorycode'] == $gbeObjectCode) {
                    $category_breadcrumb_html .= $category_breadcrumb_parent . '<li><a href="'. $category['seourl'] .'.html">'. $category['name'] .'</a></li>';
                }
                //level của thằng con hiện tại lệch bao nhiêu cấp so với thằng cha/ông tiếp theo thì đóng bấy nhiêu lại
                $category_index_current = intval($categories[$index]['level']);
                $category_index_next = intval($categories[$index + 1]['level']);
                while($category_index_current != $category_index_next) {
                    $category_html .= '</ul></li>';
                    $category_index_current--;
                    $open--;
                }
                $category_breadcrumb_parent = '';
            }
        } else {
            $category_html .= '<li class="'. $active .'"><a class="category__link"  href="'. $category['seourl'] .'.html">'. $category['name'] .'</a></li>';

            if($category['categorycode'] == $gbeObjectCode) {
                $category_breadcrumb_html .= '<li><a href="'. $category['seourl'] .'.html">'. $category['name'] .'</a></li>';
            }

            while($open > 0) {
                $category_html .= '</ul></li>';
                $open--;
            }
        }
    }
}


//GET PRODUCTS LIST ON LOAD PAGE
$categorycode_getparam = $gbeObjectCode;
$manufacturercodes_getparam = array();
if(!empty(@$_GET['manufacturercodes']) && $_GET['manufacturercodes'] !== "[]") {
    $manufacturercodes_getparam = array_unique(@$_GET['manufacturercodes']);
}

if ($gbeSEOURL == "nhan-hang-goodpharma") {
    $manufacturercodes_getparam = array("M00187");
}

$pricemin = @$_GET['pricemin'];
$pricemax = @$_GET['pricemax'];
$params = array(
    "categorycode" => $categorycode_getparam,
    "manufacturercodes" => json_encode($manufacturercodes_getparam),
    "pricemin" => $pricemin,
    "pricemax" => $pricemax,
    "orderby" => @$_GET['orderby'],
    "page" => $page,
    "sort" => $orderby
);
//var_dump($params);
$jsontext = callAPI("gbshop", "product_getProductList.api", $params);
$productListData = json_decode($jsontext, true);
//var_dump($productListData);
$productlist_categoryname = @$productListData['categoryname'];
if ($gbeSEOURL == "nhan-hang-goodpharma") {
    $productlist_categoryname = "Nhãn hàng GoodPharma";
}

$products = $productListData['data'];
$products_count = $productListData['itemcount'];
//var_dump($products);
if(!empty($products)) {
    foreach($products as $index => $product) {
        if($product['subimages'] != '') {
            $products[$index]['subimages'] = explode(',', $product['subimages']);
        }
    }
}

$items_per_page = 18;
//get current page
/*** generate paging ***/
$pagination = new Pagination();
$pagination->total = $productListData['itemcount'];
$pagination->page = $page;
$pagination->limit = $items_per_page;
//$query = $_GET;
//$query['page'] = $page;
//unset($query['gbeseourl']);
$paginationparams = $params;
unset($paginationparams['page']);
if (empty($manufacturercodes_getparam) | $_GET['manufacturercodes'] == "[]") {
    unset($paginationparams['manufacturercodes']);
}
$actual_link = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? "https" : "http") . "://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
$url = preg_replace('/\\?.*/', '', $actual_link);
$query_result = http_build_query($paginationparams);

//$pagination->url = HTTP_SERVER . "san-pham.html?page={page}&categorycode=" . $categorycode_getparam;
$pagination->url = $url . "?page={page}&" . $query_result;
$pagination = $pagination->render();

$params_category = array(
    'categorycode' => $categorycode_getparam
);
$jsontext = callAPI("gbshop","manufacturer_getManufacturerList.api",$params_category);
$manufacturers = json_decode($jsontext, true);
 //var_dump($manufacturers);
//get min max price

//$params_minmax = array(
//    "categorycode" => $categorycode_getparam,
//    "manufacturercodes" => json_encode($manufacturercodes_getparam),
//    "pricemin" => $pricemin,
//    "pricemax" => $pricemax,
//
//);
//
//$jsontext = callAPI("gbshop","product_getProductMinMax.api");
//$productPrice = json_decode($jsontext, true);
//var_dump($manufacturers);

//đây là nút start nằm bên phải của thanh search giá
$productStartPrice = number_format($productListData['pricemin'], 0, '.', '.');
// đây là nút end nằm bên trái của thanh search giá
$productEndPrice = number_format($productListData['pricemax'], 0, '.', '.');

//echo "min: " . $productMinPrice;
//echo "<br>";
//echo "start: " . @$_GET['pricemin'];
//echo "<br>";
//echo "end: " . @$_GET['pricemax'];
//echo "<br>";
//echo "max: " . $productMaxPrice ;

//if(!empty(@$_GET['pricemin'])) {
//    if((@$_GET['pricemin'] < $productListData['pricemin']) || (@$_GET['pricemin'] > $productListData['pricemax'])) {
//        @$_GET['pricemin'] = $productListData['pricemin'];
//    }
//}
//if(!empty(@$_GET['pricemax'])) {
//    if((@$_GET['pricemax'] > $productListData['pricemax']) || (@$_GET['pricemax'] < $productListData['pricemin'])) {
//        @$_GET['pricemax'] = $productListData['pricemax'];
//    }
//}
?>