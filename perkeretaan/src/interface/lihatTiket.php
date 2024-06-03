<?php
session_start();
error_reporting(E_ALL ^ E_NOTICE ^ E_DEPRECATED);

$conn = mysqli_connect('localhost', 'root', '', 'perkeretaan');

if (!$conn) {
    die("Koneksi ke database gagal: " . mysqli_connect_error());
}

$sql = "SELECT
            penumpang.nama_penumpang AS 'Nama Penumpang',
            penumpang.no_telp AS 'No. Telp',
            stasiun.nama_stasiun AS 'Stasiun Tujuan',
            kereta.nama_kereta AS 'Nama Kereta',
            kereta.kelas_kereta AS 'Kelas',
            jadwal.tanggal_berangkat AS 'Waktu Keberangkatan',
            jadwal.harga_tiket AS 'Harga(Rp.)'
        FROM tiket
        JOIN penumpang ON tiket.no_telpFK = penumpang.no_telp
        JOIN stasiun ON tiket.id_stasiunFK = stasiun.id_stasiun
        JOIN kereta ON tiket.id_keretaFK = kereta.id_kereta
        JOIN jadwal ON tiket.id_jadwalFK = jadwal.id_jadwal";

$result = mysqli_query($conn, $sql);

if (!$result) {
    echo "Error: " . $sql . "<br>" . mysqli_error($conn);
}

?>

<!DOCTYPE html>
<html>
<head>
    <title>Tiket Kereta</title>
    <link rel="stylesheet" href="style/lihatTiketStyle.css">
</head>
<body>
    <h2>Data Tiket Kereta</h2>
    <table border=1>
        <tr>
            <th>Nama Penumpang</th>
            <th>No. Telp</th>
            <th>Stasiun Tujuan</th>
            <th>Nama Kereta</th>
            <th>Kelas</th>
            <th>Waktu Keberangkatan</th>
            <th>Harga(Rp.)</th>
        </tr>
        <?php
        while ($row = mysqli_fetch_assoc($result)) {
            echo "<tr>";
            echo "<td>" . $row['Nama Penumpang'] . "</td>";
            echo "<td>" . $row['No. Telp'] . "</td>";
            echo "<td>" . $row['Stasiun Tujuan'] . "</td>";
            echo "<td>" . $row['Nama Kereta'] . "</td>";
            echo "<td>" . $row['Kelas'] . "</td>";
            echo "<td>" . $row['Waktu Keberangkatan'] . "</td>";
            echo "<td>" . $row['Harga(Rp.)'] . "</td>";
            echo "</tr>";
        }
        ?>
    </table>
</body>
</html>
