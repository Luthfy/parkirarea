<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Parkir Area</title>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="assets/css/master.css">
  </head>
  <body>
    <div class="container">
      <div class="box login">
        <h1 align='center' id="please">- Please Login Before -</h1>
        <form class="" action="ceklogin.php" method="post">
          <input type="text" name="username" value="" placeholder="Masukan username" class="form-control"> <br>
          <input type="password" name="password" value="" placeholder="Masukan Password" class="form-control"> <br>
          <select class="form-control" name="pos">
            <option name='pos' value="">- Pilih Pos Petugas -</option>
            <option value="1">1. Petugas Pos Masuk</option>
            <option value="2">2. Petugas Pos Keluar</option>
          </select> <br>
          <button type="submit" class="btn btn-primary btn-success">Login</button>
        </form>
      </div>
    </div>

    <script type="text/javascript" src="assets/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="assets/js/master.js"></script>
  </body>
</html>
