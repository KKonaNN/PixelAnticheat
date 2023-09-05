<?php
//if ($_SERVER['HTTP_CF_CONNECTING_IP'] === "185.128.139.127") {
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
    $con->Query("DELETE FROM licenses WHERE license='$license'");
  }
// } else {
//   exit("```𝑮𝒐𝒐𝒅 𝑻𝒓𝒚 𝑻𝒐 𝑯𝒂𝒄𝒌```");
// }
?>