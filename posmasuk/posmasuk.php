<?php

  /**
   *  Pos Masuk
   */

   date_default_timezone_set('Asia/Singapore');

  class posMasuk
  {

    private $koneksi;
    private $nopol;
    private $petugas;
    private $unik;

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

    function unik()
    {
        // unikwaktu
        $a = rand(1,9);
        $b = date('Ymd');

        $unik = "$a"."$b";
        return $this->unik = $unik;
    }

    function SimpanData()
    {
        $unik = $this->unik;
        // $x    = "INSERT INTO catat_masuk (nopol, kode_unik, id_petugas) VALUES ('')"
        $q   = $this->koneksi->query("INSERT INTO catat_masuk SET nopol = '$this->nopol', kode_unik = '$unik', id_petugas = '$this->petugas'");

      if (! $q )
      {
        echo "gagal";
      }
    }

    function ambilData()
    {
      $q = $this->koneksi->query("SELECT * FROM jumlah_kendaraan WHERE kode_unik = '$this->unik'");
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
