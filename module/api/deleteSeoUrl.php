<?php

$getdata = $_GET;
//kiểm tra token

$seourl = $getdata['seourl'];
$filename = $seourl . ".cache";
unlink("data/seourl/" . $filename);