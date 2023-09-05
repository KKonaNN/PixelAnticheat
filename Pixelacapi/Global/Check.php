<?php
  $con = mysqli_connect("localhost", "root", "", "pixelac");
  if(!$con) {
    echo("No Connection");
  }
  $steamhex = "";
  
  if(isset($_POST['steamhex']) && !empty($_POST['steamhex'])) {
    $steamhex = mysqli_real_escape_string($con, $_POST['steamhex']);
  }
  elseif(isset($_GET['steamhex']) && !empty($_GET['steamhex'])) {
    $steamhex = mysqli_real_escape_string($con, $_GET['steamhex']);
  } else {
    exit("Data not sent");
  }
  $query_login = $con->Query("SELECT steamhex FROM globalban WHERE steamhex = '".$steamhex."' LIMIT 1");
  if(!$query_login) {
    echo("data error");
  }
  elseif($query_login->num_rows != 1) {
    echo("No steam");
  } else {
    echo("Steam Is Baned");
  }
?>