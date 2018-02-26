<?php

/**
 * POS KELUAR
 */
class posKeluar
{

  private $koneksi;
  private $nopol;
  private $petugas;

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
    $s = "SELECT * FROM `jumlah_kendaraan` GROUP BY nama_petugas = (SELECT nama_petugas FROM petugas WHERE id_petugas = '$this->petugas') AND nopol LIKE '%$nopol%'";
    $q = $this->koneksi->query($s);
    $r = $q->fetch_array();
    return $r;
  }

  function getDanaNopol()
  {

  }

  function logout()
  {
    session_destroy();
    unset($_SESSION['status']);
    header('location:../');
  }


}



?>
