<?php
require_once("./config.php");

if ($_SERVER['REQUEST_METHOD'] == "POST") {
    $post_params = @$_POST;
    $post_params['token'] = TOKEN;
    $jsontext = callAdminAPI("gbuser", "common_remotelogin.api", array(), $post_params);

    $apiData = json_decode($jsontext, true);
    $error = $apiData['error'];
    if (empty($error)) {
        // Xử lý gán session
        $sessiondata = $apiData['sessiondata'];
        if (!empty($sessiondata)) {
            foreach ($sessiondata as $key => $value) {
                $_SESSION[$key] = $value;
            }
        }
        // Lấy sessionid để redirect qua trang admin
        $sessionid = $apiData['sessionid'];
        $_SESSION['sessionid'] = $sessionid;
        header('Location: https://choxomadmin.gbotweb.com/directlogin.php?sessionid=' . $sessionid);
    }
}


function callAdminAPI($system = "", $api, $get_params = array(), $post_params = array())
{
    $url = "http://choxomadminapi.gbotweb.com/" . $system . "/" . $api . "?token=" . $post_params['token'];
    if (!empty($get_params) > 0) {
        $querystring = http_build_query($get_params);
        $url = $url . "&" . $querystring;
    }
    $post_params["sessiondata"] = json_encode(@$_SESSION);
    // Khởi tạo CURL
    $ch = curl_init($url);
    // Thiết lập có return
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    // Thiết lập sử dụng POST
    curl_setopt($ch, CURLOPT_POST, count($post_params));
    // Thiết lập các dữ liệu gửi đi
    curl_setopt($ch, CURLOPT_POSTFIELDS, $post_params);
    $result = curl_exec($ch);
    curl_close($ch);
    return $result;
}

?>
<!--
<form action="login.php" method="POST">
    <label for="username">Username</label>
    <input type="text" name="username" id="username">

    <label for="password">Password</label>
    <input type="text" name="password" id="password">
    <button type="submit">Submit</button>
</form>
-->

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="favicon.ico"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="css/util.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <!--===============================================================================================-->
</head>
<body>
<div class="limiter">
    <div class="container-login100">
        <div class="wrap-login100">
            <form class="login100-form validate-form" action="login.php" method="POST">
					<span class="login100-form-title">
						Cho Xom Login
					</span>
                <div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
                    <input class="input100" type="text" name="username" placeholder="Username">
						<span class="symbol-input100">
							<i class="fa fa-user" aria-hidden="true"></i>
						</span>
                </div>
                <div class="wrap-input100 validate-input" data-validate = "Password is required">
                    <input class="input100" type="password" name="password" placeholder="Password">
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
                </div>
                <?php if(!empty($error)){?>
                    <span class="ml-4" style="color: red">
                        <?php echo $error;?>
                    </span>
                <?php } ?>
                <div class="container-login100-form-btn">

                    <button class="login100-form-btn">
                        Login
                    </button>
                </div>
                <div class="text-center p-t-136">
                    <a class="txt2" href="#">
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>




<!--===============================================================================================-->
<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/bootstrap/js/popper.js"></script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/tilt/tilt.jquery.min.js"></script>
<script >
    $('.js-tilt').tilt({
        scale: 1.1
    })
</script>
<!--===============================================================================================-->
<script src="js/main.js"></script>

</body>
</html>