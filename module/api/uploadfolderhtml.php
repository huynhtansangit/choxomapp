<?php
$foldername = $_GET['pagename'];

$uploadpath = "module/content/page/".$foldername."/";
$filedata = $_FILES['filecontent']['tmp_name'];
$filename = $_POST['filename'];
if ($filedata != '' && $filename != '') {
    copy($filedata,$uploadpath.$filename);
}
?>