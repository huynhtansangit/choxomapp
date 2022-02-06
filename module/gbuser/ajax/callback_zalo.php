<?php
include("config_zalo.php");
use Zalo\ZaloEndPoint;

$oauthCode = isset($_GET['code']) ? $_GET['code'] : "THIS NOT CALLBACK PAGE !!!"; // get oauthoauth code from url params
$accessToken = $helper->getAccessToken($callBackUrl); // get access token
$accessStatus = false;
if ($accessToken != null) {
    $expires = $accessToken->getExpiresAt(); // get expires time
    $accessStatus = true;
}

$params = ['fields' => 'id,name,birthday,gender,picture'];
//$urlGetProfile = "https://oauth.zaloapp.com/v3/access_token?app_id={1}&app_secret={2}&code={3}";
$response = $zalo->get(ZaloEndpoint::API_GRAPH_ME, $accessToken, $params);
$result = $response->getDecodedBody(); // result

$params = array(
    "userid" => $result['id'],
    "fullname" => $result['name'],
    "fb_access_token" => $accessStatus,
    "birthday" => $result['birthday'],
    "gender" => $result['gender']
);

$apitext = callAPI("gbuser", "member_validateZaloLogin.api", array(), $params);

$apiData = json_decode($apitext, true);
$dataSession = @$apiData["sessiondata"];

if($apiData['status'] == 'done') {
    foreach($dataSession as $key => $value)
    {
        $_SESSION[$key] = $value;
    }

    header("Location:" . HTTP_SERVER);
} else {
    $url = HTTP_SERVER . 'gbuser/login.gbe?userid=' . $dataSession['memberid'] . '&email=' . $dataSession['loginmemberemail'] . '&name=' . $dataSession['loginmembername'] . '&avatar=' . $dataSession['loginmemberavatar'] . '&phone=' . $dataSession['loginmemberphone'] . '&type=zalo';
    header("Location:" . $url);
}
?>



