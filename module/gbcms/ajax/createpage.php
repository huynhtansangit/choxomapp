<?php
//$_GET['pagename'] = 'aaa'; test
$PageName = $_GET['pagename'];
$folderpath = $_SERVER["DOCUMENT_ROOT"]."/gbmaster/module/gbcms/page/".$PageName;

if (!file_exists($folderpath)) {
    mkdir($folderpath, 0777);
}


?>
