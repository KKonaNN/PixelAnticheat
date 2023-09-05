<?php
$steamhex = $_GET['steamhex'];
$license = $_GET['license'];
$discord = $_GET['discord'];
$token = $_GET['token'];

if ( empty($steamhex) || empty($license) || empty($discord)) {
    die("Missing parameters, IP: {$_SERVER['HTTP_CF_CONNECTING_IP']}");
}
if ($steamhex && $license && $discord && $token) {
    $conn = new mysqli("localhost", "root", "", "pixelac");
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
    $sql = "INSERT INTO globalban (steamhex, license, discord, token )
    VALUES ('$steamhex', '$license', '$discord', '$token')";
    if ($conn->query($sql) === TRUE) {
        exit("Banned");
    } else {
        exit("```𝑪𝒂𝒏'𝒕 𝑩𝒂𝒏```");
    }
} else {
    exit("```𝑮𝒐𝒐𝒅 𝑻𝒓𝒚 𝑻𝒐 𝑯𝒂𝒄𝒌```");
}
?>