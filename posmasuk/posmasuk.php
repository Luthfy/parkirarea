<?php

  /**
   *  Pos Masuk
   */

  class posMasuk
  {

    private $koneksi;
    private $nopol;
    private $petugas;

    function __construct($koneksi, $petugas)
    {
      $this->setPetugas($petugas);
      $this->setKoneksi($koneksi);
    }

    function setKoneksi ($koneksi)
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

    function SimpanData()
    {
      $q   = $this->koneksi->query("INSERT INTO catat_masuk SET nopol = '$this->nopol', id_petugas = '$this->petugas'");

      if (! $q )
      {
        echo "gagal";
      }
    }

    function ambilData()
    {
      $q = $this->koneksi->query("SELECT * FROM jumlah_kendaraan WHERE nopol = '$this->nopol'");
      $r = $q->fetch_array();
      return $r;
    }

    function logout()
    {
      session_destroy();
      unset($_SESSION['status']);
      header('location:../');
    }

  }

 ?>
