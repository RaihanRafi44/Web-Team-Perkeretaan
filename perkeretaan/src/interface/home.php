<?php
session_start();
if ($_SESSION['status'] != 'Penumpang') {
    // jika bukan Penumpang, redirect ke halaman login
    header("Location: ../login/login.php");
}
?>

<!DOCTYPE html>
<html>

<head>
    <title>home</title>
    <link rel="stylesheet" type="text/css" href="style/homeStyle.css">
</head>

<body>
    <h2>Selamat datang,<br></h2>
    <h1><?php echo $_SESSION['nama']; ?></h1>
    <p>Ini adalah halaman khusus Penumpang.</p>
    <br>
    <button type="button" onclick="window.location.href='lihatTiket.php'">Lihat Tiket</button>
    <button type="button" onclick="window.location.href='buatTiket.php'">Beli Tiket</button>
    <br><br>
    <a href="../login/logout.php">logout</a>
</body>

</html>