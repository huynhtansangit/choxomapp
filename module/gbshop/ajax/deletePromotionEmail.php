<?php
$deletedid = $_GET['deletedid'];
$arrDeletedid = explode(",",$deletedid);
foreach($arrDeletedid as $id){
    //** khi x�a lu�n folder **
    if (file_exists('data/mail/'.$id.'/sentbox')) {
        array_map('unlink', glob("data/mail/".$id."/sentbox/*.*"));
        rmdir('data/mail/'.$id.'/sentbox');
    }

    if (file_exists('data/mail/'.$id.'/outbox')) {
        array_map('unlink', glob("data/mail/".$id."/outbox/*.*"));
        rmdir('data/mail/'.$id.'/outbox');
        rmdir('data/mail/'.$id);
    }
}

/**
 * Created by PhpStorm.
 * User: dell
 * Date: 1/26/2021
 * Time: 4:32 PM
 */