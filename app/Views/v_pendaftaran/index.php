<?= $this->extend('layouts_peserta/template_peserta') ?>


<?= $this->section('content') ?>
<main id="main">

  <!-- ======= Pendaftaran ======= -->
  <section id="contact" class="contact">
    <div class="container" data-aos="fade-up">

      <div class="section-title">
        <h3><span>Halaman Pendaftaran</span></h3>
        <p>Aplikasi Pendaftaran Magang Mahasiswa - DISKOMINFOSAN</p>
      </div>

      <div class="row" data-aos="fade-up" data-aos-delay="100">

        <div class="col-lg-6" data-aos="zoom-out" data-aos-delay="100">
          <img src="/assets/bizland/img/about.jpg" class="img-fluid" alt="">
        </div>

        <div class="col-lg-6">
          <form id="formPendaftaran" role="form" class="php-email-form">
            <div class="input-group">
              <div class="input-group-prepend">
                <span class="input-group-text" id="basic-addon1"><i class="icofont-users-alt-5"></i></span>
              </div>
              <input type="text" class="form-control" name="nama" placeholder="Nama Lengkap" autofocus/>
              <p class="text-danger">*</p>
            </div>
            <small id="nama_error" class="form-text text-danger mb-3"></small>
            
            <div class="input-group">
              <div class="input-group-prepend">
                <span class="input-group-text" id="basic-addon1"><i class="icofont-email"></i></span>
              </div>
              <input type="text" class="form-control" name="email" placeholder="Email"/>
            </div>
            <small id="email_error" class="form-text text-danger mb-3"></small>

            <div class="input-group">
              <div class="input-group-prepend">
                <span class="input-group-text" id="basic-addon1"><i id="show-password" class="icofont-eye-blocked"></i></span>
              </div>
              <input type="password" class="form-control" id="password" name="password" placeholder="Password"/>
            </div>
            <p class="text-danger mt-2">**Password Minimal 8 Karakter</p>
            <small id="password_error" class="form-text text-danger mb-3"></small>

            <div class="input-group">
              <div class="input-group-prepend">
                <span class="input-group-text" id="basic-addon1"><i id="show-confirmpassword" class="icofont-eye-blocked"></i></span>
              </div>
              <input type="password" class="form-control" id="confirm_password" name="confirm_password" placeholder="Confirm Password"/>
            </div>
            <small id="confirm_password_error" class="form-text text-danger mb-3"></small>

            <div class="text-center mb-2">
              <button class="col-lg" type="submit" id="btn-pendaftaran">Daftar</button>
            </div>
            <p class="mb-2 text-center">
              <a href="<?php echo base_url('login'); ?>">Sudah punya akun? Silahkan Login!</a>
            </p>
          </form>
        </div>

      </div>

    </div>
  </section>
  
</main>
<?= $this->endSection() ?>

<?= $this->section('script') ?>
<script>
  $(document).ready(function() {

    //Show Password
    $('#show-password').on('click', function(){
        if ($(this).hasClass('icofont-eye-blocked')) {
            $('#password').attr('type', 'text');
            $(this).removeClass('icofont-eye-blocked');
            $(this).addClass('icofont-eye');
        } else {
            $('#password').attr('type', 'password');
            $(this).removeClass('icofont-eye');
            $(this).addClass('icofont-eye-blocked');
        }
    });
    //-------------------------------------------------------------------

    //Show Confirm Password
    $('#show-confirmpassword').on('click', function(){
        if ($(this).hasClass('icofont-eye-blocked')) {
            $('#confirm_password').attr('type', 'text');
            $(this).removeClass('icofont-eye-blocked');
            $(this).addClass('icofont-eye');
        } else {
            $('#confirm_password').attr('type', 'password');
            $(this).removeClass('icofont-eye');
            $(this).addClass('icofont-eye-blocked');
        }
    });
    //-------------------------------------------------------------------

    //Submit pendaftaran user
    $('#btn-pendaftaran').on('click', function(){
      const formPendaftaran = $('#formPendaftaran');
      
      $.ajax({
        url: "pendaftaran/daftarAkun",
        method: "POST",
        data: formPendaftaran.serialize(),
        dataType: "JSON",
        success: function (data) {
          //Data Error
          if(data.error){
            if(data.daftar_akun_error['nama'] != '') $('#nama_error').html(data.daftar_akun_error['nama']);   
            else $('#nama_error').html('');

            if(data.daftar_akun_error['email'] != '') $('#email_error').html(data.daftar_akun_error['email']);   
            else $('#email_error').html('');

            if(data.daftar_akun_error['password'] != '') $('#password_error').html(data.daftar_akun_error['password']);   
            else $('#password_error').html('');

            if(data.daftar_akun_error['confirm_password'] != '') $('#confirm_password_error').html(data.daftar_akun_error['confirm_password']);   
            else $('#confirm_password_error').html('');
          }

          //Pendaftaran Sukses
          if(data.success){
            formPendaftaran.trigger('reset');
            $('#nama_error').html('');
            $('#email_error').html('');
            $('#password_error').html(''); 
            $('#confirm_password_error').html(''); 
            Swal.fire({
              position: 'top-end',
              icon: 'success',
              title: 'Pendaftaran Berhasil!',
              showConfirmButton: false,
              timer: 1500
            });
            window.location.replace(data.link);
          }
            
        }
        
      });

    });
    //-------------------------------------------------------------------

  });

</script>
<?= $this->endSection() ?>