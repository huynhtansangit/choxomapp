<?php
include("config_google.php");

$login_button = "";

if(isset($_GET["code"])) {
    $token = $google_client->fetchAccessTokenWithAuthCode($_GET["code"]);

    if(!isset($token['error']))
    {

        $google_client->setAccessToken($token['access_token']);


        $_SESSION['access_token'] = $token['access_token'];


        $google_service = new Google_Service_Oauth2($google_client);


        $data = $google_service->userinfo->get();

        $params = array(
            "userid" => $data['id'],
            "email" => $data["email"],
            "fullname" => $data['name'],
            "fb_access_status" => $data['verifiedEmail']
        );

        $apitext = callAPI("gbuser", "member_validateGoogleLogin.api", array(), $params);

        $apiData = json_decode($apitext, true);
        $dataSession = @$apiData["sessiondata"];

        if($apiData['status'] == 'done') {
            foreach($dataSession as $key => $value)
            {
                $_SESSION[$key] = $value;
            }

            header("Location:" . HTTP_SERVER);
        } else {
            $url = HTTP_SERVER . 'gbuser/login.gbe?userid=' . $dataSession['memberid'] . '&email=' . $dataSession['loginmemberemail'] . '&name=' . $dataSession['loginmembername'] . '&avatar=' . $dataSession['loginmemberavatar'] . '&phone=' . $dataSession['loginmemberphone'] . '&type=google';
            header("Location:" . $url);
        }
    }
}

?>



