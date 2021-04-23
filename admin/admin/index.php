
<div class="card mb-4">
    <div class="card-header">
        <button type="button" id="btn-tambah-admin" class="btn btn-primary"><span class="text"><i class="fas fa-car fa-sm"></i> Tambah Admin</span></button>
    </div>
    <div class="card-body">
    <?php
    if (isset($_GET['tambah'])) {
        if ($_GET['tambah']=='berhasil'){
            echo"<div class='alert alert-success'><strong>Berhasil</strong>, admin telah ditambahkan</div>";
        }else if ($_GET['tambah']=='gagal'){
            echo"<div class='alert alert-fail'><strong>Gagal</strong>, admin gagal ditambahkan</div>";
        }    
    }
    if (isset($_GET['edit'])) {
        if ($_GET['edit']=='berhasil'){
            echo"<div class='alert alert-success'><strong>Berhasil</strong>, admin telah diedit</div>";
        }else if ($_GET['edit']=='gagal'){
            echo"<div class='alert alert-fail'><strong>Gagal</strong>, admin gagal diedit</div>";
        }    
      }
    if (isset($_GET['hapus'])) {
        if ($_GET['hapus']=='berhasil'){
            echo"<div class='alert alert-success'><strong>Berhasil</strong>, admin telah dihapus</div>";
        }else if ($_GET['hapus']=='gagal'){
            echo"<div class='alert alert-fail'><strong>Gagal</strong>, admin gagal dihapus</div>";
        }    
    }
    ?>

       <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                <tr>
                    <th>No</th>
                    <th>Nama</th>
                    <th>Email</th>
                    <th>Status</th>
                    <th>Aksi</th>
                </tr>
                </thead>
                <tbody>
                    <?php
                        include '../config/database.php';
                        $sql="select * from user order by id_user desc";
                        $hasil=mysqli_query($kon,$sql);
                        $no=0;

                        while ($data = mysqli_fetch_array($hasil)):
                        $no++;
                    ?>
                    <tr>
                        <td><?php echo $no; ?></td>
                        <td><?php echo $data['nama_user']; ?></td>
                        <td><?php echo $data['email']; ?></td>
                        <td><?php echo $data['status'] == 1 ? 'Aktif' : 'Tidak Aktif'; ?></td>
                        <td>
                            <button class="btn-edit btn btn-warning btn-circle" id_user="<?php echo $data['id_user']; ?>" kode_user="<?php echo $data['kode_user']; ?>" >Edit</button>
                            <button class="btn-hapus btn btn-danger btn-circle"  id_user="<?php echo $data['id_user']; ?>" kode_user="<?php echo $data['kode_user']; ?>" level="<?php echo $data['level']; ?>" >Hapus</button>
                        </td>
                    </tr>
                    <?php endwhile; ?>
                </tbody>
            </table>
        </div>
    </div>
</div>

<div class="modal fade" id="modal">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">

        <div class="modal-header">
            <h4 class="modal-title" id="judul"></h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>

        <div class="modal-body">
            <div id="tampil_data">

            </div>  
        </div>

        <div class="modal-footer">
            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>

        </div>
    </div>
</div>
<script>

    $('#btn-tambah-admin').on('click',function(){
        
        $.ajax({
            url: 'admin/tambah.php',
            method: 'post',
            success:function(data){
                $('#tampil_data').html(data);  
                document.getElementById("judul").innerHTML='Tambah Admin';
            }
        });
        $('#modal').modal('show');
    });

    $('.btn-edit').on('click',function(){

        var id_user = $(this).attr("id_user");
        var kode_user = $(this).attr("kode_user");
        $.ajax({
            url: 'admin/edit.php',
            method: 'post',
            data: {id_user:id_user},
            success:function(data){
                $('#tampil_data').html(data);  
                document.getElementById("judul").innerHTML='Edit user #'+kode_user;
            }
        });
        $('#modal').modal('show');
    });

    $('.btn-hapus').on('click',function(){

        var id_user = $(this).attr("id_user");
        var gambar = $(this).attr("gambar");

        konfirmasi=confirm("Yakin ingin menghapus?")

        if (konfirmasi){
            $.ajax({
                url: 'admin/hapus.php',
                method: 'post',
                data: {id_user:id_user,gambar:gambar},
                success:function(data){
                    window.location.href = 'index.php?halaman=admin&hapus=berhasil';
                }
            });
        }
});

</script>