<?php

/**
 * POS KELUAR
 */
class posKeluar
{

  private $koneksi;
  private $nopol;
  private $petugas;
  private $idnopol;

  function __construct($koneksi, $petugas)
  {
    $this->setKoneksi($koneksi);
    $this->setPetugas($petugas);
  }

  function setKoneksi($koneksi)
  {
    $this->koneksi = $koneksi;
  }

  function getKoneksi()
  {
    return $this->koneksi;
  }

  function setNopol($nopol)
  {
    $this->nopol = $nopol;
  }

  function getNopol()
  {
    return $this->nopol;
  }

  function setPetugas($petugas)
  {
    $this->petugas = $petugas;
  }

  function getPetugas()
  {
    return $this->petugas;
  }

  function cekNopol($nopol)
  {
    $s = "SELECT * FROM jumlah_kendaraan WHERE nopol LIKE '%$nopol%'";
    $q = $this->koneksi->query($s);
    $r = $q->fetch_array();
    $this->idnopol = $r['id_masuk'];
    return $r;
  }

  function hargaParkir()
  {

    $q1 = $this->koneksi->query("SELECT * FROM catat_masuk WHERE id_masuk = '$this->idnopol'");

  	$r1 = $q1->fetch_array();

	  $w1 = new datetime($r1['waktu_masuk']);
  	$w2 = new datetime(date("Y-m-d H:i:s"));

  	$b = $w1->diff($w2);

    $jam = ($b->y * 365 * 24) + ($b->m * 30 * 24) + ($b->d  * 24) + ($b->h);

    $bayar = 0;

    if ($jam > 1) {
      $bayar = 1000 + ($jam * 1000);
    } else if ($jam > 0 AND $jam < 1) {
      $bayar = 2000;
    } else {
      $bayar;
    }

    return $bayar;
  }

  function bayarParkir($uang)
  {
    // $petugas = $this->petugas;
    $idnopol = $this->idnopol;
    // print_r($idnopol);

    // $q = mysqli_query ($this->koneksi, "Insert Into catat_keluar SET id_masuk = '$idnopol', biaya = '$uang', pembayaran = 'Cash', id_petugas = '$petugas' ");
    //
    // if ($q) {
    //   echo "<script>alert('Pembayaran Berhasil')</script>";
    // } else {
    //   echo "<script>alert('".mysqli_error($this->koneksi)."')</script>";
    //   echo "<script>alert('".$this->idnopol."')</script>";
    // }

  }

  function logout()
  {
    session_destroy();
    unset($_SESSION['status']);
    header('location:../');
  }


}



?>
