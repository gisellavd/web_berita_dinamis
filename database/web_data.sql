SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `artikel` (
  `id_artikel` int(11) NOT NULL,
  `kode_artikel` char(10) NOT NULL,
  `judul_artikel` varchar(100) NOT NULL,
  `isi_artikel` text NOT NULL,
  `gambar` varchar(100) NOT NULL DEFAULT 'gambar_default.png',
  `tanggal` datetime NOT NULL,
  `status` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `artikel` (`id_artikel`, `kode_artikel`, `judul_artikel`, `isi_artikel`, `gambar`, `tanggal`, `status`, `id_kategori`, `id_user`) VALUES
(98, 'A0094', 'Manfaat Baking Soda untuk Kesehatan', 'Baking soda memiliki sejumlah manfaat kesehatan mengejutkan yang mungkin belum Anda ketahui, mulai dari mengobati nyeri otot, bahkan mencegah kelelahan. Ini adalah lima cara manfaat menambahkan lebih banyak soda kue ke dalam makanan Anda dapat untuk kesehatan dilansir dari Express. Anda dapat meningkatkan keseimbangan pH di perut Anda dengan menambahkan lebih banyak soda kue ke dalam makanan Anda. Ini sering digunakan sebagai obat alami untuk refluks asam atau mulas. Pasien penyakit ginjal dapat memperoleh manfaat dari melengkapi soda kue, klaim situs web medis. Ini membantu memperlambat perkembangan penyakit, sekaligus meningkatkan nutrisi secara keseluruhan untuk pasien, katanya. Soda kue adalah antijamur dan antibakteri alami, yang berarti dapat membunuh jenis mikroorganisme tertentu. Bakteri yang terkait dengan kerusakan gigi, yang dikenal sebagai Streptococcus mutans, sangat rentan terhadap soda kue. Beberapa atlet mungkin mendapat manfaat dari menambahkan lebih banyak soda kue ke dalam makanan mereka, karena dapat menurunkan kemungkinan timbulnya nyeri otot setelah latihan. Ini kemudian dikaitkan dengan peningkatan kebugaran dan kinerja sprint. Sumber: lifestyle.bisnis.com', 'bakingsoda.png', '2021-04-18 16:58:13', 1, 14, 0),
(100, 'A0100', 'Mengapa Soft Skills Wajib Dimiliki di Era Teknologi?', 'Menurut pemimpin sebuah perusahaan teknologi informasi (TI) yang menjual perangkat lunak, soft skills menjadi penting karena “knowing how to code will only get you so far”. Oleh karena itu, ia menuntut agar para supervisor dan manajer meningkatkan keterampilan kepemimpinan dan soft skills. Seorang pakar TI, Sascha Giese, juga menekankan pentingnya soft skills pada para pekerja TI. Dengan perkembangan sektor TI di semua lingkungan kerja, keterampilan-keterampilan teknis memang terasa semakin dibutuhkan orang. Pengetahuan dan keterampilan yang spesifik semakin dicari. Hal ini membuat para profesional yang bergerak di bidang TI merasa sangat dibutuhkan di lingkungan kerja. Meski demikian, ketika masa kerja semakin lama dan tanggung jawab semakin membesar, para profesional tersebut merasa bahwa keterampilan holistis dan nonteknikal ternyata juga semakin penting. Mau tidak mau, cepat atau lambat, para profesional teknik itu harus menghadapi publik. Mereka tidak mungkin hanya bersembunyi di balik layar komputer. Mereka tentu perlu memahami sasaran organisasi, beradaptasi, dan berkreasi sambil tetap mengembangkan kapabilitas teknisnya. Soft skills aren’t optional—they’re essential. Sumber: kompas.com', 'softskill.png', '2021-04-18 08:02:19', 1, 16, 0),
(103, 'A0103', 'Wisata Pantai Lovina', 'Pantai Lovina dikenal sebagai salah satu pantai yang sering dikunjungi lumba-lumba di Indonesia. keberadaan lumba-lumba inilah yang jadi salah satu daya tarik utama pantai ini. Dulunya, Pantai Lovina lebih dikenal dikalangan wisatawan asing. Karena suasana-nya yang menenangkan, turis asing semaking betah untuk berkunjung ke Pantai Lovina ini. Pada akhirnya, Pantai Lovina ini berkembang menjadi objek wisata di bagian utara Bali yang dapat dikunjungi semua kalangan.Sumber: nativeindonesia.com', 'pantai.png', '2021-04-18 21:45:16', 1, 20, 0),
(105, 'A0105', 'Cara Cepat Belajar Berenang', 'Renang adalah salah satu olahraga yang sangat digemari. Sayangnya, tidak semua orang bisa berenang, lho. Belajar berenang tidak harus melalui les khusus dan membayar seorang guru untuk mengajari kita. Jika tahu bagaimana cara cepat belajar renang sendiri, kita bisa melakukannya dalam waktu yang singkat. Bagaimana caranya? Yuk kita cari tahu. Awali dengan tekad dan niat yang kuat. Cari Teman untuk Belajar Bersama. Latihan Melompat di Dalam Air. Belajar Berjalan di Dalam Kolam. Latihan Pernapasan. Latihan mengapung di dalam kolam. latihan gerakan meluncur. latihan gerakan dasar. Sumber: olahragapedia.com', 'renang.png', '2020-04-18 21:50:47', 1, 18, 0);

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL,
  `gambar_kategori` varchar(200) NOT NULL DEFAULT 'gambar_default.png'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`, `gambar_kategori`) VALUES
(14, 'Kesehatan', 'kesehatan.png'),
(16, 'Teknologi', 'teknologi.png'),
(18, 'Olahraga', 'olahraga.png'),
(20, 'Wisata', 'wisata.png');

CREATE TABLE `komentar` (
  `id_komentar` int(11) NOT NULL,
  `id_artikel` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `isi_komentar` text NOT NULL,
  `status_komentar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `komentar` (`id_komentar`, `id_artikel`, `nama`, `email`, `isi_komentar`, `status_komentar`) VALUES
(7, 98, 'Gisel D', 'gisellavd@gmail.com', 'Sangat menarik dan bermanfaat', 1);


CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `kode_user` char(9) NOT NULL,
  `nama_user` varchar(50) NOT NULL,
  `email` varchar(35) NOT NULL,
  `no_telp` char(14) NOT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `user` (`id_user`, `kode_user`, `nama_user`, `email`, `no_telp`, `username`, `password`, `status`) VALUES
(19, 'U010', 'Gisella', 'gisellavd@gmail.com', '081556230890', 'gisella', '827ccb0eea8a706c4c34a16891f84e7b', 1);

CREATE TABLE `profil` (
  `nama_website` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `profil` (`nama_website`) VALUES
('Web Berita');

ALTER TABLE `artikel`
  ADD PRIMARY KEY (`id_artikel`),
  ADD UNIQUE KEY `judul_artikel` (`judul_artikel`),
  ADD KEY `id_kategori` (`id_kategori`),
  ADD KEY `id_artikel` (`id_artikel`);

ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`),
  ADD KEY `id_kategori` (`id_kategori`);

ALTER TABLE `komentar`
  ADD PRIMARY KEY (`id_komentar`);

ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_user` (`id_user`);

ALTER TABLE `artikel`
  MODIFY `id_artikel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

ALTER TABLE `komentar`
  MODIFY `id_komentar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;