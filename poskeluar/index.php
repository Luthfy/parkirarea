<?php

  session_start();


  require_once '../config/Database.php';
  require_once 'poskeluar.php';

  $id_petugas = $_SESSION['id'];

  if (! $_SESSION['status'] == 'login')
  {
    header('location:../');
    echo "<script>alert('session validasi mencekal');</script>";
  }

?>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>POS KELUAR</title>
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="../assets/css/master.css">
  </head>
  <body>
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <a href="#" class="navbar-brand">Parkir Area</a>
        </div>
        <div class="navbar-right" id='setting'>
          <a href="#"> <?php echo $_SESSION['nama']; ?> </a>
          <a href="?pg=logout">Logout</a>
        </div>
      </div>
    </nav>
    <div class="body">
      <div class="container">
        <div class="box nopolmasuk">
          <h1 align='center' id='please'>Masukan Nopol Pengunjung :</h1>
          <form class="" action="<?php $_SERVER['PHP_SELF']; ?>" method="POST">
            <input type="text" id='nopol' name="nopol" value="" class="form-control"> <br>
            <button type="submit" name="submit" class="btn btn-info btn-lg" id="btn-nopol">Cek Nopol</button>
          </form>
        </div>

        <?php

          $pk = new posKeluar($koneksi, $id_petugas);

          if (isset($_GET['pg']))
          {
            $pk->logout();
          }

        ?>

        <div class="box pembayaran">
          <h1 align="center">Rp. 2000</h1>
          <div class="" align="right">
            <?php echo date("Y-m-d H:m:s") ?>
            <button type="button" name="button" class="btn btn-primary">Bayar</button>
            <button type="button" name="button" class="btn btn-success">Cetak</button>
          </div>
        </div>

      </div>

    </div>

      <footer>
        <hr>
        <p align='center'>(c) Copyright 2018</p>
      </footer>
    <script type="text/javascript" src="../assets/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="../assets/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../assets/js/master.js"></script>
  </body>
  </body>
</html>
