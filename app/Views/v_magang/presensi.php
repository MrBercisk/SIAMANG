<?= $this->extend('layouts_magang/template_magang') ?>

<?= $this->section('content') ?>
<?php if (session()->has('error')) : ?>
    <script>
        Swal.fire({
            icon: 'error',
            title: 'Gagal Presensi!',
            text: '<?= session()->getFlashdata('error') ?>',
            footer: '<a href="<?= base_url('kalender'); ?>">Klik disini untuk cek jadwal magang Anda</a>',
            customClass: {
                confirmButton: 'btn btn-danger'
            },
            buttonsStyling: false
            // matikan styling default tombol Swal
        })
    </script>
<?php elseif (session()->has('success')) : ?>
    <script>
        Swal.fire({
            icon: 'success',
            title: 'Berhasil Presensi',
            text: '<?= session()->getFlashdata('success') ?>',
            customClass: {
                confirmButton: 'btn btn-success'
            },
            buttonsStyling: false
            // matikan styling default tombol Swal
        })
    </script>
<?php endif; ?>

<div class="content-wrapper">
    <section class="content-header bg-white" style="height: 50px; max-height: 100px;">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-12">
                    <p class="text-muted">SI AMANG (Sistem Informasi Aplikasi Magang)</p>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>
    <section class="content mt-5">
        <div class="row">

            <div class="col-lg-6">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title col-lg-3">Data Presensi</h3><button class="btn btn-danger col-lg-9 btn-md btn-block"><i class="fas fa-exclamation-circle"></i> Batas Waktu Presensi Jam 09.00</button>
                    </div>
                    <div class="card-body table-responsive">
                        <table class="table table-bordered table-hover">
                            <thead class="bg-primary text-white">
                                <tr>
                                    <th>No.</th>
                                    <th>Tanggal Presensi</th>
                                    <th>Jam Presensi</th>
                                    <th>Keterangan Presensi</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $no = 1; ?>
                                <?php foreach ($data_presensi as $presensi) : ?>
                                    <tr>
                                        <td><?= $no++ ?></td>
                                        <td><?= $presensi['tanggal_presensi'] ?></td>
                                        <td><?= $presensi['jam'] ?></td>
                                        <td><?= $presensi['keterangan_presensi'] ?></td>
                                    </tr>
                                <?php endforeach; ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Presensi Kehadiran Mahasiswa Setiap Pertemuan</h3>
                    </div>
                    <div class="card-body">
                        <div class="row text-center">
                            <div class="col-md-4">
                                <div class="card bg-primary text-white">
                                    <div class="card-body">
                                        <i class="fas fa-school fa-3x"></i>
                                    </div>
                                    <div class="card-footer">
                                        <h5 class="card-text">Kategori</h5>
                                        <p class="card-text"><?= $nama_kategori ?></p>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="card bg-success text-white">
                                    <div class="card-body">
                                        <i class="fas fa-university fa-3x"></i>
                                    </div>
                                    <div class="card-footer">
                                        <h5 class="card-text">Bidang</h5>
                                        <p class="card-text"><?= $nama_bidang ?></p>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="card bg-warning text-white">
                                    <div class="card-body">
                                        <i class="fas fa-user fa-3x"></i>
                                    </div>
                                    <div class="card-footer">
                                        <h5 class="card-text">Mentor</h5>
                                        <p class="card-text"><?php foreach ($mentor as $m) : ?>
                                                <?= $m['nama'] ?>
                                            <?php endforeach ?>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <?php
                        $jam_sekarang = date("H:i:s");
                        $tanggal_sekarang = date("Y-m-d");
                        $hari_sekarang = date("N");

                        if ((($hari_sekarang == 2 || $hari_sekarang == 4) && $jam_sekarang >= "07:00:00" && $jam_sekarang <= "10:00:00")) :
                        ?>
                            <form action="<?= base_url('presensi/inputPresensi'); ?>" method="post">
                                <input type="hidden" name="nama_peserta" value="<?= $nama_peserta ?>" />
                                <input type="hidden" name="tanggal_presensi" value="<?= $tanggal_sekarang ?>" />
                                <button type="submit" class="btn btn-primary btn-md btn-block">Presensi Kehadiran</button>
                            </form>
                        <?php elseif ($hari_sekarang != 2 && $hari_sekarang != 4) : ?>
                            <button type="submit" class="btn btn-danger btn-md btn-block" disabled>Presensi hanya dapat dilakukan pada hari Selasa dan Kamis.</button>
                        <?php else : ?>
                            <button type="submit" class="btn btn-danger btn-md btn-block" disabled>Waktu Presensi Telah Berakhir</button>
                        <?php endif; ?>



                    </div>
                </div>
            </div>
        </div>
    </section>



    <?= $this->endSection() ?>