<?php

require_once("./config.php");

unset($_SESSION['cardidcms']);

unset($_SESSION['sessionid']);

unset($_SESSION['usertypecode']);

unset($_SESSION['permissiondata']);

session_destroy();

header("Location: " . HTTP_SERVER . 'login.php');