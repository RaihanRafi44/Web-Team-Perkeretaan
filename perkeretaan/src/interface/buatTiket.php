<?php
session_start();
error_reporting(E_ALL ^ E_NOTICE ^ E_DEPRECATED);

$conn = mysqli_connect('localhost', 'root', '', 'perkeretaan');

if (!$conn) {
    die("Koneksi ke database gagal: " . mysqli_connect_error());
}

// Input Data Diri
if (isset($_POST['submit'])) {
    $nama = $_POST['nama'];
    $nama_penumpang = $_POST['nama_penumpang'];
    $no_telp = $_POST['no_telp'];

    // memasukkan data Penumpang ke tabel penumpang
    $sql = "INSERT INTO penumpang (no_telp, nama_penumpang) VALUES ('$no_telp', '$nama_penumpang')";
    $result = mysqli_query($conn, $sql);

    if ($result) {
        echo '<script language="JavaScript">
            alert("Berhasil membuat Data Diri!");
            window.location = "jadwal.php";
        </script>';
    } else {
        echo '<script language="JavaScript">
            alert("Gagal membuat Data Diri! Silahkan coba lagi.");
            window.location = "buatTiket.php";
        </script>';
    }
}
?>

<!DOCTYPE html>
<html>

<head>
    <title>Data Diri</title>
    <link rel="stylesheet" type="text/css" href="style/buatTiketStyle.css">
</head>

<body>
    <!-- Form Data Diri -->
    <h2>Data Diri</h2>
    <form method="post" action="buatTiket.php">
        <input type="text" name="nama_penumpang" placeholder="Nama Lengkap" required><br>
        <input type="text" name="no_telp" placeholder="Nomor Telepon" required><br>
        <input type="submit" name="submit" value="Daftar">
    </form>
</body>

</html>