<?php


$foldername = $_GET['pagename'];
$blockname = $_GET['blockname'];


$uploadpath = "module/gbcms/page/".$foldername."/".$blockname."/";
$filedata = $_FILES['filecontent']['tmp_name'];
$filename = $_POST['filename'];
if ($filedata != '' && $filename != '') {
    copy($filedata,$uploadpath.$filename);
}
?>