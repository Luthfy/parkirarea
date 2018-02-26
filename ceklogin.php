<?php
  session_start();
  require 'config/Database.php';

  $username = $_POST['username'];
  $password = MD5($_POST['password']);
  $pos      = $_POST['pos'];


  $q = $koneksi->query("SELECT * FROM petugas WHERE username = '$username' AND password = '$password'");
  $r = $q->num_rows;

  if ($r ==  1) {

    $_SESSION['status'] = 'login';

    switch ($pos) {
      case '1':
        $h = $q->fetch_array();
        $_SESSION['nama'] = $h['nama_petugas'];
        $_SESSION['id'] = $h['id_petugas'];
        header('location:posmasuk/');
        break;
      case '2':
        $h = $q->fetch_array();
        $_SESSION['nama'] = $h['nama_petugas'];
        $_SESSION['id'] = $h['id_petugas'];
        header('location:poskeluar/');
        break;
      default:
        echo "<script>alert('Pos Jaga Belum Diatur');</script>";
        header('location:index.php');
        break;
    }
  } else {
    echo "username dan password gagal";
  }

 ?>
