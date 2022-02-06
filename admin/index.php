<?php
require_once("./config.php");

if (!empty(@$_SESSION['cardidcms']) && !empty(@$_SESSION['sessionid'])) {
    header('Location: https://choxomadmin.gbotweb.com/?refererdomain=' . HTTP_SERVER);
    exit;
} else {
    header('Location: ' . HTTP_SERVER . 'login.php');
}
