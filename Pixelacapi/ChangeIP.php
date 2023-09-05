<?php


$license = $_GET['license'];
$newIP = &$_GET['newIP'];

if ( empty($license) || empty($newIP)) {
  die("Missing parameters, IP: {$_SERVER['HTTP_CF_CONNECTING_IP']}");
}

//if ($_SERVER['HTTP_CF_CONNECTING_IP'] === "185.128.139.127") {
    $con = mysqli_connect("localhost", "root", "", "pixelac");

    if(!$con) {
      echo("Connection To Database Broken");
    }

    if(isset($_POST['license']) && !empty($_POST['license'])) {
      $license = mysqli_real_escape_string($con, $_POST['license']);
    }

    $query_login = $con->Query("SELECT License FROM licenses WHERE License = '$license'");
    if(!$query_login) {
      echo("Get Data From Sql Broked");
    }
    elseif($query_login->num_rows != 1) {
      echo("No License Finded");
    } else {
      $query_result = $query_login->Fetch_assoc();


    
        $con->Query("UPDATE licenses SET IP='$newIP' WHERE License = '$license'");
        

        $con->Query("UPDATE licenses SET IPLimit=7 WHERE License = '$license'");
        echo("License Has Been Updated");

    }
// } else {
//     exit("```𝑮𝒐𝒐𝒅 𝑻𝒓𝒚 𝑻𝒐 𝑯𝒂𝒄𝒌```");
// }

  
?>