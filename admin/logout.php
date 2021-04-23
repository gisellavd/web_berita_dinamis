<?php
    session_start();
    $id_user=$_SESSION['id_user'];
    $_SESSION['id_user']='';
    $_SESSION['kode_user']='';
    $_SESSION['nama_user']='';
    $_SESSION['username']='';
    $_SESSION['level']='';

   

    unset($_SESSION['id_user']);
    unset($_SESSION['kode_user']);
    unset($_SESSION['nama_user']);
    unset($_SESSION['username']);
    unset($_SESSION['level']);

    session_unset();
    session_destroy();

    header('Location:../index.php?halaman=login');

?>