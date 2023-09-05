<?php

$license = &$_GET['license'];
$discordid      = &$_GET['discordid'];
$expire  = &$_GET['expire'];



if ( empty($license) || empty($discordid) || empty($expire)) {
    die("Missing parameters, IP: {$_SERVER['HTTP_CF_CONNECTING_IP']}");
}
//if ($_SERVER['HTTP_CF_CONNECTING_IP'] === "185.128.139.127") {
    $conn = new mysqli("localhost","root","","pixelac"); 
        
    if ( $conn->connect_error ) {
        die("Connection failed: " . $conn->connect_error);
    }

    $license = $conn->real_escape_string($license);
    $discordid     = $conn->real_escape_string($discordid);
    $expire = $conn->real_escape_string($expire);
    $dateserver = date('Y-m-d');
    $res = "".$expire." Day";
        
    $sql = "INSERT INTO `licenses`(`license`, `expire`, `DiscordID`, `Verify`, `Date`, `Reason`) VALUES ('$license', '$expire', '$discordid', 'true', '$dateserver', '$res')";
        
    if ( $conn->query($sql) !== TRUE ) {
        die("Failed to perform query, error: " . mysqli_error($conn));
    }else{
        function response($license,$expire,$discordid) {
        
            $response['license'] = $license;
            $response['expire'] = $expire;
            $response['discordid'] = $discordid;
            $json_response = json_encode($response);
            echo $json_response;
        }
        response($license, $expire, $discordid);
    }
        
// } else {
//         exit("```𝑮𝒐𝒐𝒅 𝑻𝒓𝒚 𝑻𝒐 𝑯𝒂𝒄𝒌```");
// }
