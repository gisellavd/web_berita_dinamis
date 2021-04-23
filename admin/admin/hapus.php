<?php
session_start();
    include '../../config/database.php';

    $id_user=$_POST["id_user"];
    $gambar=$_POST["gambar"];

    $sql="delete from user where id_user=$id_user";
    $hapus_user=mysqli_query($kon,$sql);


?>