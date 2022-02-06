<?php
$uploadpath = "data/fileserver/file/upload/";
$filedata = $_FILES['filecontent']['tmp_name'];
$filename = $_POST['filename'];
if ($filedata != '' && $filename != '') {
    copy($filedata,$uploadpath.$filename);
}
?>