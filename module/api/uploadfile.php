<?php
$uploadpath = "data/fileupload/";
$filedata = $_FILES['filecontent']['tmp_name'];
$filename = $_POST['filename'];
if ($filedata != '' && $filename != '') {
    copy($filedata,$uploadpath.$filename);
}
?>