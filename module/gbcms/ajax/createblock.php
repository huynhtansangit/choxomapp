<?php

$PageName = $_GET['pagename'];
$BlockName = $_GET['blockname'];

$folderpath = $_SERVER["DOCUMENT_ROOT"]."/gbmaster/module/gbcms/page/".$PageName.'/'.$BlockName;

if (!file_exists($folderpath)) {
    mkdir($folderpath, 0777);
}


?>
