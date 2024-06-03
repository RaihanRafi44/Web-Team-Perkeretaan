<?php
session_start();
error_reporting(E_ALL ^ E_NOTICE ^ E_DEPRECATED);

$conn = mysqli_connect('localhost', 'root', '', 'perkeretaan');

if (isset($_POST['submit'])) {
    $username = $_POST['username'];
    $password = $_POST['password'];

    $sql = "SELECT * FROM users WHERE username='$username' AND password='$password'";
    $query = mysqli_query($conn, $sql);
    $row = mysqli_fetch_array($query);
    if ($row) {
        // Berhasil login
        $_SESSION['username'] = $row['username'];
        $_SESSION['status'] = $row['status'];
        $_SESSION['nama'] = $row['nama'];
        if ($_SESSION['status'] == 'Administrator') {
            // Jika status Administrator, redirect ke halaman admin.php
            header("Location: ../interface/admin.php");
            exit();
        } else {
            // Jika status Penumpang, redirect ke halaman home.php
            header("Location: hasilLogin.php");
            exit();
        }
    } else {
        // Gagal login
        echo '<script language="JavaScript">
            alert("Gagal Login, pastikan Username dan Password Anda benar!");
            window.location.href = "login.php";
        </script>';
        exit();
    }
}
?>

<!DOCTYPE html>
<html>

<head>
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="style/loginStyle.css">
</head>

<body>
    <div class="container">
        <div class="box form-box">
            <header>Login</header>
            <form action="" method="post">
                <div class="field input">
                    <label for="username">Username</label>
                    <input type="text" name="username" id="username" autocomplete="off" required>
                </div>

                <div class="field input">
                    <label for="password">Password</label>
                    <input type="password" name="password" id="password" autocomplete="off" required>
                </div>

                <div class="field">
                    <input type="submit" class="btn" name="submit" value="Login">
                </div>
            </form>
        </div>
    </div>
</body>

</html>
