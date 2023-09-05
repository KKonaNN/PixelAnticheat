<?php

$redeem = &$_GET['redeem'];
$redeem_expire      = &$_GET['redeem_expire'];
$license_expire      = &$_GET['license_expire'];

if ( empty($redeem) || empty($redeem_expire) || empty($license_expire)) {
    die("Missing parameters, IP: {$_SERVER['REMOTE_ADDR']}");
}

$conn = new mysqli("localhost","root","","pixelac"); 
    
if ( $conn->connect_error ) {
    die("Connection failed: " . $conn->connect_error);
}

$redeem = $conn->real_escape_string($redeem);
$redeem_expire     = $conn->real_escape_string($redeem_expire);
$license_expire = $conn->real_escape_string($license_expire);

    
$sql = "INSERT INTO `redeems`(`redeem`, `redeem_expire`, `license_expire`) VALUES ('$redeem', '$redeem_expire', '$license_expire')";
    
if ( $conn->query($sql) !== TRUE ) {
    die("Failed to perform query, error: " . mysqli_error($conn));
}else{
    response($redeem, $redeem_expire, $license_expire);
}
    
    function response($redeem,$redeem_expire,$license_expire) {
    
        $response['redeem'] = $redeem;
        $response['redeem_expire'] = $redeem_expire;
        $response['license_expire'] = $license_expire;
        $json_response = json_encode($response);
        echo $json_response;
    }
