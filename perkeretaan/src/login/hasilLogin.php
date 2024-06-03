<?php
session_start();
echo "Anda Berhasil Login sebagai " . $_SESSION['nama'] . " Dan Anda Terdaftar Sebagai " . $_SESSION['status'];
?>
<br>
Silakan Logout dengan klik link <a href="logout.php"> Disini </a>