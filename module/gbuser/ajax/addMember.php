<?php
$jsontext = callAPI("gbuser", "member_addMember.api", array(), @$_POST);
$memberAPIData = json_decode($jsontext, true);
$dataSession = @$memberAPIData["sessiondata"];
if($memberAPIData['status'] == 'done') {
    foreach($dataSession as $key => $value)
    {
        $_SESSION[$key] = $value;
    }
}



echo $jsontext;