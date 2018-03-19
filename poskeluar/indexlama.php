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
            <input type="text" id='nopol' name="nopol" value="" class="form-control"> <br>
            <button type="button" name='cek' class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" id="btn-nopol">Cek Nopol</button>
        </div>
      </div>

      <!-- Modal -->
      <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
          <!-- konten modal-->
          <div class="modal-content">
            <!-- heading modal -->
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title">Data Pencarian</h4>
            </div>
            <!-- body modal -->
            <div class="modal-body">
              <div class="hasil">

              </div>
              <table class="table">
                <tr>
                  <td>No</td>
                  <td>Nopol</td>
                  <td>Kode Unik</td>
                  <td>Waktu Masuk</td>
                  <td>Aksi</td>
                </tr>
                <tr>
                  <td>1</td>
                  <td>DA 4004 GA</td>
                  <td>1800929302920101111</td>
                  <td>2018-02-18 16:15:20</td>
                  <td> <button type="button" name="button" class="btn btn-default btn-sm" onclick="pilihDataNopol('1')">Pilih</button> </td>
                </tr>
              </table>
            </div>
            <!-- footer modal -->
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">Tutup Modal</button>
            </div>
          </div>
        </div>
      </div>

    <?php

      $pk = new posKeluar($koneksi, $id_petugas);

      if (isset($_GET['pg']))
      {
        $pk->logout();
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
