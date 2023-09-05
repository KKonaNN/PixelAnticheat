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
    echo json_encode(
        array(
            "Active" => "false",
            "Reason" => "data not sent"
        )
    );
  }

  $query_login = $con->Query("SELECT License FROM licenses WHERE License = '".$license."' LIMIT 1");
  if(!$query_login) {
    echo json_encode(
        array(
            "Active" => "false",
            "Reason" => "data not sent 2"
        )
    );
  }
  elseif($query_login->num_rows != 1) {
    echo json_encode(
        array(
            "Active" => "false",
            "Reason" => "License not found"
        )
    );
  } else {
    $query_result = $query_login->Fetch_assoc();

    $query_licenseexpire = $con->Query("SELECT Expire FROM licenses WHERE License = '".$license."' LIMIT 1");
    $query_licenseresultexpire = $query_licenseexpire->Fetch_assoc();
    if($query_licenseresultexpire['Expire']  == '0') {
      echo("License Expire");
    } else {
        $query_servername = $con->Query("SELECT Servername FROM licenses WHERE License = '".$license."' LIMIT 1");
        $query_licenseresultservername = $query_servername->Fetch_assoc();
      response($query_licenseresultexpire['Expire'], $query_licenseresultservername['Servername']);
    }

  }
  function response($expire, $sname) {

    $response['Expire'] = $expire;
    $response['Active'] = "true";
    $response['Servername'] = $sname;
    $json_response = json_encode($response);
    echo $json_response;
  }

?>