<?php

// Lấy danh sách các system được cho phép truy cập
$config_access_modules = $_GET['config_access_modules'];
$config_access_modules = json_decode($config_access_modules, true);

$systems_path = $_SERVER["DOCUMENT_ROOT"] . '/goodpharma/module/*';

$systems_dirs = array_filter(glob($systems_path), 'is_dir');

$custom_frame_list = array();
$index = 0;

// Lấy danh sách các custom frame trong những system được cho phép truy cập
foreach ($systems_dirs as &$systems_dir) {
    $system_name = basename(dirname($systems_dir . "/aaa.txt"));

    if (in_array($system_name, $config_access_modules)) {
        $custom_frame_path = $_SERVER["DOCUMENT_ROOT"] . '/goodpharma/module/' . $system_name . '/customframe/*';
        $custom_frame_dirs = array_filter(glob($custom_frame_path), 'is_dir');

        foreach ($custom_frame_dirs as &$custom_frame_dir) {
            $foldername = basename(dirname($custom_frame_dir . "/aaa.txt"));
            $custom_frame_list[$index] = array(
                "layouttypename" => $system_name . '_' . $foldername,
                "layouttypecode" => $system_name . '_' . $foldername,
                "linkavatar" => 'https://adminapi.gbotweb.com/gbframe/frame/GBF_CustomFrame/avatar.png'
            );
            $index++;
        }
    }
}

echo json_encode($custom_frame_list);
