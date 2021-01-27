-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 02, 2020 at 08:28 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projectpbo`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `barang_id` int(11) NOT NULL,
  `barang_nama` varchar(50) NOT NULL,
  `barang_merk` varchar(50) NOT NULL,
  `barang_stok` int(11) NOT NULL,
  `barang_harga` int(11) NOT NULL,
  `barang_exp` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`barang_id`, `barang_nama`, `barang_merk`, `barang_stok`, `barang_harga`, `barang_exp`) VALUES
(0, 'Shampoo', 'entah', 619, 1000, '2020-05-23'),
(1, 'mocha', 'aice', 144, 100000, '2020-04-30'),
(2, 'mangga', 'aice', 1001, 5000, '2020-05-24');

-- --------------------------------------------------------

--
-- Table structure for table `detail_hcost`
--

CREATE TABLE `detail_hcost` (
  `hcost_id` int(11) NOT NULL,
  `hcost_bayar` int(11) NOT NULL,
  `hcost_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_hcost`
--

INSERT INTO `detail_hcost` (`hcost_id`, `hcost_bayar`, `hcost_date`) VALUES
(1, 1000000, '2020-04-01');

-- --------------------------------------------------------

--
-- Table structure for table `detail_pembelian`
--

CREATE TABLE `detail_pembelian` (
  `data` int(11) NOT NULL,
  `pembelian_id` int(11) NOT NULL,
  `barang_id` int(11) NOT NULL,
  `dpembelian_jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_pembelian`
--

INSERT INTO `detail_pembelian` (`data`, `pembelian_id`, `barang_id`, `dpembelian_jumlah`) VALUES
(1, 1, 1, 13),
(3, 4, 1, 100),
(4, 4, 0, 45),
(5, 20, 0, 50),
(6, 20, 0, 50),
(7, 20, 0, 50),
(8, 20, 0, 50),
(9, 20, 0, 50),
(10, 21, 1, 10),
(11, 21, 0, 50),
(12, 21, 1, 10),
(13, 23, 0, 10),
(14, 23, 1, 20),
(15, 24, 1, 10),
(16, 25, 0, 10),
(17, 25, 0, 10),
(18, 25, 0, 20),
(19, 26, 0, 20),
(20, 26, 0, 10),
(21, 26, 0, 5),
(22, 27, 0, 10),
(23, 27, 0, 10),
(24, 27, 0, 22),
(25, 28, 0, 100),
(26, 28, 2, 1000),
(27, 29, 2, 3);

--
-- Triggers `detail_pembelian`
--
DELIMITER $$
CREATE TRIGGER `pembelian_barang` BEFORE INSERT ON `detail_pembelian` FOR EACH ROW BEGIN
UPDATE barang SET barang_stok = barang_stok+NEW.dpembelian_jumlah
WHERE barang_id = NEW.barang_id;
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `transaksi_id` int(11) NOT NULL,
  `barang_id` int(11) NOT NULL,
  `dtransaksi_date` date NOT NULL,
  `dtransaksi_jumlah` int(11) NOT NULL,
  `dtransaksi_harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_transaksi`
--

INSERT INTO `detail_transaksi` (`transaksi_id`, `barang_id`, `dtransaksi_date`, `dtransaksi_jumlah`, `dtransaksi_harga`) VALUES
(1, 1, '2020-04-30', 10, 100000),
(1, 1, '2020-04-30', 10, 100000),
(1, 1, '2020-05-23', 2, 100000),
(4, 1, '2020-05-23', 2, 100000),
(4, 1, '2020-05-23', 3, 100000),
(4, 1, '2020-05-23', 3, 100000),
(5, 1, '2020-05-23', 4, 100000),
(5, 1, '2020-05-23', 3, 100000),
(5, 1, '2020-05-23', 2, 100000),
(5, 1, '2020-05-23', 1, 100000),
(7, 0, '2020-05-23', 20, 1000),
(7, 1, '2020-05-23', 80, 100000),
(8, 0, '2020-05-23', 10, 1000),
(9, 0, '2020-05-23', 5, 1000),
(11, 1, '2020-05-24', 3, 100000),
(11, 0, '2020-05-24', 10, 1000),
(14, 2, '2020-05-24', 2, 5250),
(14, 1, '2020-05-24', 3, 105000),
(14, 0, '2020-05-24', 6, 1050),
(15, 0, '2020-06-02', 2, 1050);

--
-- Triggers `detail_transaksi`
--
DELIMITER $$
CREATE TRIGGER `hapus` AFTER DELETE ON `detail_transaksi` FOR EACH ROW BEGIN
INSERT INTO tb_transaksi_hapus(
    transaksi_id,
    barang_id,
    dtransaksi_date,
    dtransaksi_jumlah,
    dtransaksi_harga,
    tgl_perubahan,
    pegawai_id
    )
    VALUES
    (
        OLD.transaksi_id,
        old.barang_id,
        old.dtransaksi_date,
        old.dtransaksi_jumlah,
        old.dtransaksi_harga,
        SYSDATE(),
        CURRENT_USER
        );
        END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `penjualan_barang` AFTER INSERT ON `detail_transaksi` FOR EACH ROW BEGIN
UPDATE barang SET barang_stok=barang_stok-NEW.dtransaksi_jumlah
WHERE barang_id=NEW.barang_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `hiddent_cost`
--

CREATE TABLE `hiddent_cost` (
  `hcost_id` int(11) NOT NULL,
  `pegawai_id` int(11) NOT NULL,
  `hcost_nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hiddent_cost`
--

INSERT INTO `hiddent_cost` (`hcost_id`, `pegawai_id`, `hcost_nama`) VALUES
(1, 1, 'beli kursi');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `member_id` int(11) NOT NULL,
  `member_nama` varchar(50) NOT NULL,
  `member_alamat` varchar(50) NOT NULL,
  `member_notlp` varchar(50) NOT NULL,
  `member_jk` enum('Laki - laki','Perempuan') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`member_id`, `member_nama`, `member_alamat`, `member_notlp`, `member_jk`) VALUES
(0, 'Rama Anadya', 'Pujungan', '1234', ''),
(1, 'kiki', 'jalan nusped', '089765432123', 'Perempuan');

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `user_id` int(11) NOT NULL,
  `pegawai_id` int(11) NOT NULL,
  `pegawai_nama` varchar(50) NOT NULL,
  `pegawai_alamat` varchar(50) NOT NULL,
  `pegawai_notlp` varchar(50) NOT NULL,
  `pegawai_jk` enum('Laki - laki','Perempuan') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`user_id`, `pegawai_id`, `pegawai_nama`, `pegawai_alamat`, `pegawai_notlp`, `pegawai_jk`) VALUES
(1, 1, 'Indie Surya Jayadi', 'jalan denpasar', '089654323185', 'Laki - laki'),
(2, 3, 'Mamank', 'Pujungan', '0812311456', 'Laki - laki'),
(3, 4, 'I Putu Rama Anadya', 'Jimbaran, Bali', '111111111', 'Perempuan'),
(4, 5, 'Wayan Kiki Oktalao', 'Nusapenida', '082245637890', 'Laki - laki');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `pembelian_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `pegawai_id` int(11) NOT NULL,
  `pembelian_date` date NOT NULL,
  `pembelian_total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`pembelian_id`, `supplier_id`, `pegawai_id`, `pembelian_date`, `pembelian_total`) VALUES
(1, 11, 1, '2020-04-30', 0),
(3, 11, 1, '2020-05-24', 0),
(4, 11, 1, '2020-05-24', 0),
(13, 11, 3, '2020-05-24', 0),
(18, 11, 3, '2020-05-24', 0),
(19, 11, 3, '2020-05-24', 0),
(20, 11, 3, '2020-05-24', 0),
(21, 11, 3, '2020-05-24', 0),
(22, 11, 3, '2020-05-24', 0),
(23, 11, 3, '2020-05-24', 0),
(24, 11, 3, '2020-05-24', 0),
(25, 11, 3, '2020-05-24', 0),
(26, 11, 3, '2020-05-24', 35000),
(27, 11, 3, '2020-05-24', 42000),
(28, 11, 1, '2020-05-24', 5100000),
(29, 11, 4, '2020-05-24', 15000);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `supplier_id` int(11) NOT NULL,
  `supplier_nama` varchar(50) NOT NULL,
  `supplier_alamat` varchar(50) NOT NULL,
  `supplier_notlp` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`supplier_id`, `supplier_nama`, `supplier_alamat`, `supplier_notlp`) VALUES
(11, 'Rama', 'jalan jimbaran', '089765474888'),
(12, 'mamank', 'bukit', '08123457890');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `transaksi_id` int(11) NOT NULL,
  `pegawai_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `transaksi_total` int(11) NOT NULL,
  `transaksi_tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`transaksi_id`, `pegawai_id`, `member_id`, `transaksi_total`, `transaksi_tanggal`) VALUES
(1, 1, 1, 0, '0000-00-00'),
(2, 1, 1, 0, '0000-00-00'),
(3, 1, 1, 0, '0000-00-00'),
(4, 1, 1, 100, '0000-00-00'),
(5, 1, 1, 1000000, '0000-00-00'),
(6, 1, 1, 0, '0000-00-00'),
(7, 1, 1, 8020000, '0000-00-00'),
(8, 1, 0, 10000, '2020-05-23'),
(9, 1, 0, 5000, '2020-05-23'),
(11, 3, 0, 310000, '2020-05-24'),
(12, 3, 1, 0, '2020-05-24'),
(13, 3, 0, 0, '2020-05-24'),
(14, 3, 1, 331800, '2020-05-24'),
(15, 1, 0, 2100, '2020-06-02');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_password` varchar(50) NOT NULL,
  `user_level` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_password`, `user_level`) VALUES
(1, 'Indie Surya', 'indiesurya', '3'),
(2, 'admin', 'admin', '1'),
(3, 'IP Rama', '1234', '2'),
(4, 'kiki', 'wayq', '1');

-- --------------------------------------------------------

--
-- Table structure for table `ztb_transaksi_hapus`
--

CREATE TABLE `ztb_transaksi_hapus` (
  `transaksi_id` int(11) NOT NULL,
  `barang_id` int(11) NOT NULL,
  `dtransaksi_date` date NOT NULL,
  `dtransaksi_jumlah` int(11) NOT NULL,
  `dtransaksi_harga` int(11) NOT NULL,
  `tgl_perubahan` datetime DEFAULT NULL,
  `pegawai_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ztb_transaksi_hapus`
--

INSERT INTO `ztb_transaksi_hapus` (`transaksi_id`, `barang_id`, `dtransaksi_date`, `dtransaksi_jumlah`, `dtransaksi_harga`, `tgl_perubahan`, `pegawai_id`) VALUES
(1, 1, '2020-04-30', 13, 100000, '2020-04-30 14:07:22', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`barang_id`);

--
-- Indexes for table `detail_hcost`
--
ALTER TABLE `detail_hcost`
  ADD KEY `hcost_id` (`hcost_id`);

--
-- Indexes for table `detail_pembelian`
--
ALTER TABLE `detail_pembelian`
  ADD PRIMARY KEY (`data`),
  ADD KEY `pembelian_id` (`pembelian_id`),
  ADD KEY `barang_id` (`barang_id`);

--
-- Indexes for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD KEY `transaksi_id` (`transaksi_id`),
  ADD KEY `barang_id` (`barang_id`);

--
-- Indexes for table `hiddent_cost`
--
ALTER TABLE `hiddent_cost`
  ADD PRIMARY KEY (`hcost_id`),
  ADD KEY `pegawai_id` (`pegawai_id`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`member_id`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`pegawai_id`) USING BTREE,
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`pembelian_id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `pegawai_id` (`pegawai_id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`transaksi_id`),
  ADD KEY `pegawai_id` (`pegawai_id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `ztb_transaksi_hapus`
--
ALTER TABLE `ztb_transaksi_hapus`
  ADD KEY `transaksi_id` (`transaksi_id`),
  ADD KEY `barang_id` (`barang_id`),
  ADD KEY `pegawai_id` (`pegawai_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail_pembelian`
--
ALTER TABLE `detail_pembelian`
  MODIFY `data` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `pegawai_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `pembelian_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `transaksi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_hcost`
--
ALTER TABLE `detail_hcost`
  ADD CONSTRAINT `detail_hcost_ibfk_1` FOREIGN KEY (`hcost_id`) REFERENCES `hiddent_cost` (`hcost_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `detail_pembelian`
--
ALTER TABLE `detail_pembelian`
  ADD CONSTRAINT `detail_pembelian_ibfk_1` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`barang_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_pembelian_ibfk_2` FOREIGN KEY (`pembelian_id`) REFERENCES `pembelian` (`pembelian_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD CONSTRAINT `detail_transaksi_ibfk_2` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`barang_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_transaksi_ibfk_3` FOREIGN KEY (`transaksi_id`) REFERENCES `transaksi` (`transaksi_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hiddent_cost`
--
ALTER TABLE `hiddent_cost`
  ADD CONSTRAINT `hiddent_cost_ibfk_1` FOREIGN KEY (`pegawai_id`) REFERENCES `pegawai` (`pegawai_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD CONSTRAINT `pegawai_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD CONSTRAINT `pembelian_ibfk_1` FOREIGN KEY (`pegawai_id`) REFERENCES `pegawai` (`pegawai_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pembelian_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`pegawai_id`) REFERENCES `pegawai` (`pegawai_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
