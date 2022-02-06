<?php
$gbeLayout = "layout.tpl";
$gbeTemplate = "productdetail.tpl";


addGlobalCSS("./module/gbshop/theme/css/product_detail.min.css");
addGlobalCSS("assets/plugins/swiper-5.4.5/css/swiper.min.css");

addGlobalJS("assets/plugins/jquery-3.4.1/jquery-3.4.1.min.js");
addGlobalJS("assets/plugins/jquery-ui/jquery-ui.min.js");
addGlobalJS("./module/gbshop/theme/js/jquery.elevatezoom.js");
addGlobalJS("assets/plugins/swiper-5.4.5/js/swiper.min.js");

//add library popup
addGlobalCSS("./module/gbshop/theme/plugins/popup/css/popup.min.css");
addGlobalJS("./module/gbshop/theme/plugins/popup/js/popup.js");

addGlobalJS("./module/gbshop/theme/js/default.js");
addGlobalJS("./module/gbshop/theme/js/product_detail.js");

//$gbeObjectCode = "P18107";
$params = array(
    "productcode" => $gbeObjectCode
);

$jsontext = callAPI("gbshop", "product_getProductDetail.api", $params, array());
$productData = json_decode($jsontext, true);

$categorys = $productData['data']['categorys'];

$mainProduct = $productData["data"]["productmain"];



$jsontext = callAPI("gbshop", "product_getImageOption.api", $params, array());
$imageOptionData = json_decode($jsontext, true);
$imageOptionDetail = array();
if(!empty($imageOptionData["data"])) {
    foreach($imageOptionData["data"] as $imageOption){
        $imageOptionDetail[$imageOption["optioncode"]."|".$imageOption["value"]] = $imageOption["image"];
    }
}

$productDetail = $productData["data"]["products"];
$productImages = array();
$productImages[0] = $productData["data"]["productmain"]["image1"];
if (!empty($productData["data"]["productmain"]["subimages"])) {
    $subImages = explode(",", $productData["data"]["productmain"]["subimages"]);
    if (!empty($subImages)) {
        foreach ($subImages as $subimage) {
            array_push($productImages, $subimage);
        }
    }
}

$productZoomImages = array();
if (!empty($productImages)) {
    foreach ($productImages as $image) {
        $image_info = getimagesize("./data/fileserver/file/" . $image);
        if ($image_info[0] < 1080 && $image_info[1] < 1080) {
            $image = 'fixsize-1080x1080/' . $image;
            $productZoomImages[] = $image;
        } else {
            $image = 'root/' . $image;
            $productZoomImages[] = $image;
        }
    }
}

//if (empty($productImages[0])) $productImages = array($productData["data"]["productmain"]["image1"]);
$productOptionFormats = array();
$productOptions = array();
if(!empty($productDetail)) {
    foreach ($productDetail as $product) {
//  tao mot mang optionvaluetext cua tat ca san pham va kiem tra nguoi dung chon san pham co ton tai hay k
//  neu co thi hien thi thong tin kem theo
        array_push($productOptionFormats, array(
            "sku" => $product["sku"],
            "option"=>$product["optionvaluetext"],
            "baseprice"=>number_format($product["baseprice"], 0, ',', '.'),
            "sellingprice"=>number_format($product["sellingprice"], 0, ',', '.'),
            "currency"=>$productData["data"]["currency"],
            "quantity"=>$product["quantity"],
        ));
//    nếu sản phẩm không có option nào thì không cần hiện
        if (empty($product["optionvaluearray"])) continue;
//    duyệt tất cả các thuộc tính của sản phẩm và ??a nó v? d?ng m?ng ?? hi?n th?
        foreach ($product["optionvaluearray"] as $key=>$option) {
//        print_r($option);
            if (empty($option["value"])) continue;
            if (empty($productOptions[$key])) {
                $productOptions[$key]["name"] = $option["name"];
                $productOptions[$key]["data"] = array($option["value"]);
            }
            else{
                if(!in_array($option["value"], $productOptions[$key]["data"]))
                    array_push($productOptions[$key]["data"],$option["value"]);
            }
        }
    }
}

$productOptionFormats = json_encode($productOptionFormats);

$params = array(
    "categorycode" => $productData['categorycode'],
);
$jsonText = callAPI("gbshop", "product_getProductList.api",$params,array());
$relatedProductsData = json_decode($jsonText,true);
$relatedProductsList = $relatedProductsData['data'];


//render breadcrumb
$jsontext = callAPI("gbshop", "category_getCategoryList.api");
$categories = json_decode($jsontext, true);

$category_breadcrumb_parent = "";
$category_breadcrumb_html = "";

//var_dump($categorys);

if(!empty($categories)) {
    foreach($categories as $index => $category) {


        if(!empty($categories[$index + 1])) {
            if($categories[$index + 1]['level'] > $categories[$index]['level']) {
                $category_breadcrumb_parent = '<li><a href="'. HTTP_SERVER . $category['seourl'] .'.html">'. $category['name'] .'</a></li>';

                $category_parent = $category['categoryname'];
                if($category['categorycode'] == $categorys[0]['categorycode']) {
                    $category_breadcrumb_html .= '<li><a href="'. $category['seourl'] .'.html">'. $category['name'] .'</a></li>';
                }
                $open++;
            } elseif ($categories[$index + 1]['level'] == $categories[$index]['level']) {
                if($category['categorycode'] == $categorys[0]['categorycode']) {
                    $category_breadcrumb_html .= $category_breadcrumb_parent . '<li><a href="'. $category['seourl'] .'.html">'. $category['name'] .'</a></li>';
                }
            } else {
                if($category['categorycode'] == $categorys[0]['categorycode']) {
                    $category_breadcrumb_html .= $category_breadcrumb_parent . '<li><a href="'. $category['seourl'] .'.html">'. $category['name'] .'</a></li>';
                }
                $category_breadcrumb_parent = '';
            }
        } else {
            if($category['categorycode'] == $categorys[0]['categorycode']) {
                $category_breadcrumb_html .= '<li><a href="'. $category['seourl'] .'.html">'. $category['name'] .'</a></li>';
            }
        }
    }
}

?>