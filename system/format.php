<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 7/30/2020
 * Time: 4:28 PM
 */
function formatDate($datetime) {
    return date('d/m/Y', strtotime($datetime));
}