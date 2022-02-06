<?php
require 'config_fb.php';
//use Facebook\Exceptions\FacebookSDKException;
//use Facebook\Exceptions\FacebookResponseException;

try {
    $accessToken = $helper->getAccessToken();
} catch(Facebook\Exceptions\FacebookResponseException $e) {
    // When Graph returns an error
    echo 'Graph returned an error: ' . $e->getMessage();
    exit;
} catch(Facebook\Exceptions\FacebookSDKException $e) {
    // When validation fails or other local issues
    echo 'Facebook SDK returned an error: ' . $e->getMessage();
    exit;
}

if (! isset($accessToken)) {
    if ($helper->getError()) {
        header('HTTP/1.0 401 Unauthorized');
        echo "Error: " . $helper->getError() . "\n";
        echo "Error Code: " . $helper->getErrorCode() . "\n";
        echo "Error Reason: " . $helper->getErrorReason() . "\n";
        echo "Error Description: " . $helper->getErrorDescription() . "\n";

        echo "<script>
                window.opener.location.reload(true);
                window.close();
              </script>";

    } else {
        header('HTTP/1.0 400 Bad Request');
        echo 'Bad request';
    }
    exit;
}

try{
    $response = $fb->get('/me?fields=id,name,email,first_name,last_name,picture,gender', $accessToken->getValue());
} catch(Facebook\Exceptions\FacebookResponseException $e){
    echo 'Error';
    exit;
} catch(Facebook\Exceptions\FacebookSDKException $e){
    echo 'Error';
    exit;
}

$fbUserData = $response->getGraphUser()->asArray();
$userid   = array_values($fbUserData)[0];
$email    = array_values($fbUserData)[2];
$fullname = array_values($fbUserData)[1];
$token    = (string) $accessToken;

$params = array(
    "userid" => $userid,
    "email" => $email,
    "fullname" => $fullname,
    "fb_access_token" => $token ,
);

$apitext = callAPI("gbuser", "member_validateFacebookLogin.api", array(), $params);

$apiData = json_decode($apitext, true);
$dataSession = @$apiData["sessiondata"];
if($apiData['status'] == 'done') {
    foreach($dataSession as $key => $value)
    {
        $_SESSION[$key] = $value;
    }


    //echo "<script> window.opener.document.location.href = '" . HTTP_SERVER . "'; window.close(); </script>";
    echo "<script>
            window.opener.document.location.href = '" . HTTP_SERVER . "';
            window.close();
            </script>";

    //header("Location:" . HTTP_SERVER);
} else {
    $url = HTTP_SERVER . 'gbuser/login.gbe?userid=' . $dataSession['memberid'] . '&email=' . $dataSession['loginmemberemail'] . '&name=' . $dataSession['loginmembername'] . '&avatar=' . $dataSession['loginmemberavatar'] . '&phone=' . $dataSession['loginmemberphone'] . '&type=facebook';

    echo "<script>
            window.opener.document.location.href = '" . $url . "';
            window.close(); 
            </script>";
    //header("Location:" . $url);
}

?>

