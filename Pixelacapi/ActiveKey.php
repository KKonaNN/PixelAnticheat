<?php
    $conn = new mysqli("localhost","root","","pixelac"); 
        
    if ( $conn->connect_error ) {
        die("Connection failed: " . $conn->connect_error);
    }
     
    $sql = "SELECT COUNT(*) FROM `globalban`";
    $result = $conn->query($sql);  
    $sql2 = "SELECT COUNT(*) FROM `licenses`";
    $result2 = $conn->query($sql2);

    $response['Bans'] = $result->fetch_row()[0];
    $response['Licenses'] = $result2->fetch_row()[0];
    $json_response = json_encode($response);
    echo $json_response;
?>
