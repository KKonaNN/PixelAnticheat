<?php

  $con = mysqli_connect("localhost", "root", "", "pixelac");
  if(!$con) {
    echo("No Connection");
  }
  $license = "";
  
  if(isset($_POST['license']) && !empty($_POST['license'])) {
    $license = mysqli_real_escape_string($con, $_POST['license']);
  }
  elseif(isset($_GET['license']) && !empty($_GET['license'])) {
    $license = mysqli_real_escape_string($con, $_GET['license']);
  } else {
    exit("Data not sent");
  }
  $query_login = $con->Query("SELECT License FROM licenses WHERE License = '".$license."' LIMIT 1");
  if(!$query_login) {
    echo("data error");
  }
  elseif($query_login->num_rows != 1) {
    echo("No License");
  } else {
    $query_result = $query_login->Fetch_assoc();

    $query_licenseexpire = $con->Query("SELECT Expire FROM licenses WHERE License = '".$license."' LIMIT 1");
    $query_licenseresultexpire = $query_licenseexpire->Fetch_assoc();
    if($query_licenseresultexpire['Expire']  == '0') {
      echo("License Expire");
    } else {
  
      $query_licensestatus = $con->Query("SELECT Active FROM licenses WHERE License = '".$license."' LIMIT 1");
      $query_licensestatuscheck = $query_licensestatus->Fetch_assoc();

      $query_IPCHECK = $con->Query("SELECT IP FROM licenses WHERE License = '".$license."' LIMIT 1");
      $query_IPCHECKSSS = $query_IPCHECK->Fetch_assoc();

      $query_LicesenReason = $con->Query("SELECT Reason FROM licenses WHERE License = '".$license."' LIMIT 1");
      $query_LicesenReasonss = $query_LicesenReason->Fetch_assoc();

      $query_ServerName = $con->Query("SELECT Servername FROM licenses WHERE License = '".$license."' LIMIT 1");
      $query_ServerNameSSS = $query_ServerName->Fetch_assoc();

      $query_DiscordId = $con->Query("SELECT DiscordID FROM licenses WHERE License = '".$license."' LIMIT 1");
      $query_DiscordIdss = $query_DiscordId->Fetch_assoc();

      $query_iplimit = $con->Query("SELECT IPLimit FROM licenses WHERE License = '".$license."' LIMIT 1");
      $query_iplimitss = $query_iplimit->Fetch_assoc();
  

      response($query_result['License'], $query_licenseresultexpire['Expire'], $query_licensestatuscheck['Active'], $query_IPCHECKSSS['IP'], $query_LicesenReasonss['Reason'], $query_ServerNameSSS['Servername'], $query_DiscordIdss['DiscordID'], $query_iplimitss['IPLimit']);
    }

    

  }
  function response($license,$expire,$licensestatus,$ip,$Reason,$Servername,$DiscordID,$IPLimit) {

    $response['license'] = $license;
    $response['expire'] = $expire;
    $response['licensestatus'] = $licensestatus;
    $response['ip'] = $ip;
    $response['Reason'] = $Reason;
    $response['Servername'] = $Servername;
    $response['DiscordID'] = $DiscordID;
    $response['IPLimit'] = $IPLimit;
    $json_response = json_encode($response);
    echo $json_response;
  }

?>