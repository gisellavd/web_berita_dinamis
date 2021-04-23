<?php
    $id_user=$_POST["id_user"];
    include '../../config/database.php';
    $query = mysqli_query($kon, "SELECT * FROM user where id_user=$id_user");
    $data = mysqli_fetch_array($query); 

    $kode_user=$data['kode_user'];
    $nama_user=$data['nama_user'];
    $email=$data['email'];
    $no_telp=$data['no_telp'];
    $username=$data['username'];
    $password=$data['password'];
    $status=$data['status'];
?>
    <form action="admin/edit.php" method="post">
    <div class="form-group">
            <label>Kode user</label>
            <h3><?php echo $kode_user; ?></h3>
            <input name="id_user" value="<?php echo $id_user; ?>" type="hidden" class="form-control">
        </div>
        <div class="form-group">
            <label>Nama user</label>
            <input name="nama_user" value="<?php echo $nama_user; ?>" type="text" class="form-control" placeholder="Masukkan nama" required>
        </div>

        <div class="row">
            <div class="col-sm-6">
            <div class="form-group">
                    <label>Email</label>
                    <input name="email" value="<?php echo $email; ?>" type="email" class="form-control" placeholder="Masukkan email" required>
            </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label>No Telp</label>
                    <input name="no_telp" value="<?php echo $no_telp; ?>" type="text" class="form-control" placeholder="Masukkan no telp" required>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-6">
                <div class="form-group">
                    <label>Username</label>
                    <input name="username" value="<?php echo $username; ?>" type="text" class="form-control" placeholder="Masukkan username" required>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label>Password</label>
                    <input name="password" value="<?php echo $password; ?>" type="password" class="form-control" placeholder="Masukkan password" required>
                </div>
            </div>
        </div>


        <div class="row">
            <div class="col-sm-6">
                <div class="form-group">
                    <label>Status</label>
                    <select name="status" class="form-control">
                        <option <?php if ($status==1) echo "selected"; ?> value="1">Aktif</option>
                       <option <?php if ($status==0) echo "selected"; ?> value="0">Tidak Aktif</option>
                    </select>
                </div>
            </div>
        </div>


        <button type="submit" name="simpan_edit" class="btn btn-dark">Update user</button>
    </form>

<?php
    if (isset($_POST['simpan_edit'])) {
        include '../../config/database.php';
        
        function input($data) {
            $data = trim($data);
            $data = stripslashes($data);
            $data = htmlspecialchars($data);
            return $data;
        }
        $id_user=input($_POST["id_user"]);
        $nama_user=input($_POST["nama_user"]);
        $email=input($_POST["email"]);
        $no_telp=input($_POST["no_telp"]);
        $username=input($_POST["username"]);
        $status=input($_POST["status"]);
 
        $ambil_password=mysqli_query($kon,"select password from user where id_user=$id_user limit 1");
        $data = mysqli_fetch_array($ambil_password);
        
        if ($data['password']==$_POST["password"]){
            $password=input($_POST["password"]);
        }else {
            $password=md5(input($_POST["password"]));
        }

        $sql="update user set
        nama_user='$nama_user',
        email='$email',
        no_telp='$no_telp',
        username='$username',
        password='$password',
        status='$status'
        where id_user=$id_user";

        $hasil=mysqli_query($kon,$sql);

        if ($hasil) {
            header("Location:../index.php?halaman=admin&edit=berhasil");
        }
        else {
            header("Location:../index.php?halaman=admin&edit=gagal");;

        }
        
    }
    ?>