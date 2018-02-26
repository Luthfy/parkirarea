<?php

  session_start();


  require_once '../config/Database.php';
  require_once 'posmasuk.php';

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
    <title>POS MASUK</title>
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
          <form class="" action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post">
            <input type="text" name="nopol" value="" class="form-control"> <br>
            <input type="submit" name="submit" value="Simpan" class="btn btn-success" id='btn-nopol' >
          </form>
        </div>
      </div>

    <?php

      $pm = new posMasuk($koneksi, $id_petugas);

      if (isset ($_POST['submit']))
      {
        if (isset($_POST['nopol']) != null) {
          $pm->setNopol($_POST['nopol']);
          $pm->SimpanData();
          $r = $pm->ambilData();

          echo "
            <div class='container'>
              <p align='center' class='alert bg-info'>
                Data Berhasil di Simpan : $r[nopol] <br>
                <a href='?' class='btn btn-danger btn-sm'>Cetak Slip</a>
              </p>

            </div>
          ";

        } else {
          echo "<script>alert('Nopol tidak boleh kosong');</script>";
        }
      }

      if (isset($_GET['pg']))
      {
        $pm->logout();
      }

    ?>

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
