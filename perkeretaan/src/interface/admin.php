<?php
session_start();
if ($_SESSION['status'] != 'Administrator') {
    // jika bukan administrator, redirect ke halaman login
    header("Location: ../login/login.php");
}
?>

<!DOCTYPE html>
<html>

<head>
    <title>Halaman Administrator</title>
</head>

<body>
    <h1>Selamat datang, <?php echo $_SESSION['nama']; ?></h1>
    <p>Ini adalah halaman khusus Administrator.</p>
    <br>
    Silahkan Logout dengan klik link <a href="../login/logout.php">Disini</a>
</body>

</html>