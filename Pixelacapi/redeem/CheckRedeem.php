<?php
  $con = mysqli_connect("localhost", "root", "", "pixelac");
  if(!$con) {
    echo("No Connection");
  }
  $redeem = "";
  
  if(isset($_POST['redeem']) && !empty($_POST['redeem'])) {
    $redeem = mysqli_real_escape_string($con, $_POST['redeem']);
  }
  elseif(isset($_GET['redeem']) && !empty($_GET['redeem'])) {
    $redeem = mysqli_real_escape_string($con, $_GET['redeem']);
  } else {
    exit("Data not sent");
  }
  $query_login = $con->Query("SELECT redeem FROM redeems WHERE redeem = '".$redeem."' LIMIT 1");
  if(!$query_login) {
    echo("data error");
  }
  elseif($query_login->num_rows != 1) {
    echo("Redeem Expired !");
  } else {
    $query_result = $query_login->Fetch_assoc();

    $query_redeemexpire = $con->Query("SELECT redeem_expire FROM redeems WHERE redeem = '".$redeem."' LIMIT 1");
    $query_redeemresultexpire = $query_redeemexpire->Fetch_assoc();
    if($query_redeemresultexpire['redeem_expire']  == '0') {
      echo("Redeem Expired !");
    } else {
  
      $query_license_expire = $con->Query("SELECT license_expire FROM redeems WHERE redeem = '".$redeem."' LIMIT 1");
      $query_license_expires = $query_license_expire->Fetch_assoc();

      response($query_license_expires['license_expire']);

      $con->Query("DELETE FROM redeems WHERE redeem='$redeem'");
    }

    

  }
  function response($license_expire) {

    $response['license_expire'] = $license_expire;
    $json_response = json_encode($response);
    echo $json_response;
  }
?>