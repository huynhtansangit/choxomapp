<?php
$listID = @$_GET['listid'];
$arrayID = explode("-", substr($listID,0,-1));
$arrResponse = array();

// x? lý task ??m file ?ã th?c thi
foreach ($arrayID as $id){
    if (file_exists('data/mail/'.$id)) {
        $count_outboxfile = new FilesystemIterator('data/mail/'.$id.'/outbox', FilesystemIterator::SKIP_DOTS);
        $count_sentboxfile = new FilesystemIterator('data/mail/'.$id.'/sentbox', FilesystemIterator::SKIP_DOTS);

        $count_totalfile = intval(iterator_count($count_outboxfile)) + intval(iterator_count($count_sentboxfile));
        $arrResponse[$id] = iterator_count($count_sentboxfile).'/'.$count_totalfile;
    } else {
        $arrResponse[$id] = "Inactive";
    }
}
echo json_encode($arrResponse);
?>