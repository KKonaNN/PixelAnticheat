<?php
//if ($_SERVER['HTTP_CF_CONNECTING_IP'] === "185.128.139.127") {
  $con = mysqli_connect("localhost", "root", "", "pixelac");
  if(!$con) {
    echo("No Connection");
  }

  $discord_id = "";
  $NewServerName = &$_GET['NewServerName'];

  if(isset($_POST['discord_id']) && !empty($_POST['discord_id'])) {
    $discord_id = mysqli_real_escape_string($con, $_POST['discord_id']);
  }
  elseif(isset($_GET['discord_id']) && !empty($_GET['discord_id'])) {
    $discord_id = mysqli_real_escape_string($con, $_GET['discord_id']);
  } else {
    exit("Data not sent");
  }
  $query_login = $con->Query("SELECT License FROM licenses WHERE DiscordID = '$discord_id'");
  if(!$query_login) {
    echo("data error");
  }
  elseif($query_login->num_rows != 1) {
    echo("No License");
  } else {
    $query_result = $query_login->Fetch_assoc();


  
      $con->Query("UPDATE licenses SET Servername='$NewServerName' WHERE DiscordID = '$discord_id'");
      
      echo("updated");

  }
/*} else {
  exit("```𝑮𝒐𝒐𝒅 𝑻𝒓𝒚 𝑻𝒐 𝑯𝒂𝒄𝒌```");
}*/
  
?>