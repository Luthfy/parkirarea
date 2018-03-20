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
            <input type="text" name="nopol" value="" class="form-control" id="nopol"> <br>
            <input type="submit" name="submit" value="Simpan" class="btn btn-success" id='btn-nopol' onclick="return cekkolom()">
          </form>
        </div>
      </div>

    <?php

      $pm = new posMasuk($koneksi, $id_petugas);

      if (isset ($_POST['submit']))
      {
        if (isset($_POST['nopol']) != null) {
          $pm->setNopol($_POST['nopol']);
          $pm->unik();
          $pm->SimpanData();
          $r = $pm->ambilData();

          echo "
            <div class='container'>
              <p align='center' class='alert bg-info'>
                Data Berhasil di Simpan : $r[nopol] <br>
                <a href='' class='btn btn-danger btn-sm' data-toggle='modal' data-target='#myModal'>Cetak Slip</a>
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

    <!-- Modal -->
    <div id="myModal" class="modal fade " role="dialog">
      <div class="modal-dialog modal-sm">
        <!-- konten modal-->
        <div class="modal-content">
          <!-- heading modal -->
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4>Cetak</h4>
          </div>
          <!-- body modal -->
          <div class="modal-body">
            <h2>ParkirArea</h2>
            <hr>
            <h3 align="center"><?php echo $r['nopol']; ?></h3>
            <hr>
            <table width="100%">
              <tr>
                <td width="33%" align="left"><?php echo $r['nama_petugas']; ?></td>
                <td width="33%" align="center"><?php echo $r['waktu_masuk']; ?></td>
                <td width="33%" align="right"><?php echo $r['kode_unik']; ?></td>
              </tr>
            </table>
          </div>
          <!-- footer modal -->
          <div class="modal-footer">
            <button type="button" name="button"> <span class="glyphicon glyphicon-print"></span> </button>
            <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Tutup Modal</button>
          </div>
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
