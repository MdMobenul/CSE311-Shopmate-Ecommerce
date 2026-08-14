-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 21, 2021 at 08:44 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopmate`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `userID` int(11) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `a_name` varchar(255) DEFAULT NULL,
  `a_phone` varchar(11) DEFAULT NULL,
  `a_email` varchar(50) DEFAULT NULL,
  `shopID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`userID`, `username`, `a_name`, `a_phone`, `a_email`, `shopID`) VALUES
(3, 'Zidan360', 'Shafin Ahmed', '01924274840', 'shafinzidan10@gmail.com', 8),
(4, 'Shafin360', 'Shafin Yo', '01768745893', 's@gmail.com', 9),
(5, 'hellomate', 'Hello Mate', '01768745893', 's@gmail.com', 10);

--
-- Triggers `admin`
--
DELIMITER $$
CREATE TRIGGER `bedoredelete_admin` BEFORE DELETE ON `admin` FOR EACH ROW DELETE FROM a_login WHERE a_username=OLD.username
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `a_login`
--

CREATE TABLE `a_login` (
  `a_id` int(11) NOT NULL,
  `a_username` varchar(30) DEFAULT NULL,
  `a_pass` varchar(50) DEFAULT NULL,
  `a_shopID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `a_login`
--

INSERT INTO `a_login` (`a_id`, `a_username`, `a_pass`, `a_shopID`) VALUES
(8, 'Zidan360', '123456', 8),
(9, 'Shafin360', '123456', 9),
(10, 'hellomate', '123456', 10);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `c_userID` int(11) NOT NULL,
  `c_username` varchar(30) DEFAULT NULL,
  `c_name` varchar(255) DEFAULT NULL,
  `c_phone` varchar(11) DEFAULT NULL,
  `c_email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`c_userID`, `c_username`, `c_name`, `c_phone`, `c_email`) VALUES
(2, 'hello', 'Shafin Ahmed', '01924274840', 'shafin@gmail.com'),
(3, 'hi', 'hi mate', '01558163373', 'hello@gmail.com'),
(4, 'zidan', 'hello you', '123456789', 'z@gmail.com'),
(7, 'me', 'you andme', '123456', 'yo@gmail.com'),
(9, 'mylife', '123456 7', '01768745893', 's@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `customer_shop`
--

CREATE TABLE `customer_shop` (
  `Cusername` varchar(30) NOT NULL,
  `C_shopno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer_shop`
--

INSERT INTO `customer_shop` (`Cusername`, `C_shopno`) VALUES
('me', 8),
('me', 9),
('me', 11),
('zidan', 8),
('zidan', 9),
('zidan', 10);

-- --------------------------------------------------------

--
-- Table structure for table `debts`
--

CREATE TABLE `debts` (
  `debtID` int(11) NOT NULL,
  `amount_payable` decimal(10,2) DEFAULT NULL,
  `date_due` varchar(10) DEFAULT NULL,
  `customer_ID` int(11) DEFAULT NULL,
  `d_shopID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `debts`
--

INSERT INTO `debts` (`debtID`, `amount_payable`, `date_due`, `customer_ID`, `d_shopID`) VALUES
(5, '120.00', '11/2020', 4, 9),
(6, '250.00', '10/2021', 7, 11);

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `itemID` int(11) NOT NULL,
  `itemType` varchar(30) DEFAULT NULL,
  `itemName` varchar(255) DEFAULT NULL,
  `itemPrice` decimal(10,2) DEFAULT NULL,
  `StockRemaining` int(3) DEFAULT NULL,
  `i_shopID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`itemID`, `itemType`, `itemName`, `itemPrice`, `StockRemaining`, `i_shopID`) VALUES
(19, 'Snacks', 'yo', '23.00', 20, 9),
(21, 'Beverages', 'Not chips', '23.00', 2, 8),
(22, 'Beverages', 'CocaCola', '12.00', 2, 8),
(23, 'Beverages', 'qt', '12.00', 21, 8),
(24, 'Daily Needs', 'Tissue', '12.00', 5, 8);

--
-- Triggers `inventory`
--
DELIMITER $$
CREATE TRIGGER `before_deleteinventory` BEFORE DELETE ON `inventory` FOR EACH ROW DELETE FROM transactions WHERE transactions.itemID=OLD.itemID
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `pass` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `username`, `pass`) VALUES
(1, 'zidan', '123456'),
(3, 'hello', '123456'),
(8, 'me', '12345678'),
(10, 'mylife', '123456');

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `shopID` int(11) NOT NULL,
  `shop_name` varchar(255) DEFAULT NULL,
  `shop_address` varchar(500) DEFAULT NULL,
  `shop_email` varchar(50) DEFAULT NULL,
  `shop_phone` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`shopID`, `shop_name`, `shop_address`, `shop_email`, `shop_phone`) VALUES
(8, 'Mister Potato', 'badda', 'b@gmail.com', '01768745893'),
(9, 'Janata', 'banani', 'shop@gmail.com', '01768745893'),
(10, 'Shwapno', 'gulshan', 'g@gmail.com', '01924274840'),
(11, 'wew', 'ewe', 'e@gmail.com', '12345'),
(12, 'wew', 'ewe', 'e@gmail.com', '12345');

-- --------------------------------------------------------

--
-- Table structure for table `trandate`
--

CREATE TABLE `trandate` (
  `tranID` int(11) NOT NULL,
  `month` int(2) DEFAULT NULL,
  `year` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `transactionID` int(11) NOT NULL,
  `customer_userID` int(11) DEFAULT NULL,
  `itemID` int(11) DEFAULT NULL,
  `amount_paid` decimal(10,2) DEFAULT NULL,
  `date_purchased` date DEFAULT NULL,
  `quantity` int(3) DEFAULT NULL,
  `t_shopID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`transactionID`, `customer_userID`, `itemID`, `amount_paid`, `date_purchased`, `quantity`, `t_shopID`) VALUES
(26, 4, 19, '12.00', '2021-01-20', 4, 8),
(28, 4, 19, '200.00', '2021-01-20', 5, 8),
(31, 9, 22, '21.00', '2020-12-01', 6, 8),
(32, 4, 19, '25.00', '2021-01-20', 7, 8);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`userID`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `shopID` (`shopID`);

--
-- Indexes for table `a_login`
--
ALTER TABLE `a_login`
  ADD PRIMARY KEY (`a_id`),
  ADD UNIQUE KEY `a_username` (`a_username`),
  ADD KEY `a_shopID` (`a_shopID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`c_userID`),
  ADD UNIQUE KEY `c_username` (`c_username`);

--
-- Indexes for table `customer_shop`
--
ALTER TABLE `customer_shop`
  ADD PRIMARY KEY (`Cusername`,`C_shopno`);

--
-- Indexes for table `debts`
--
ALTER TABLE `debts`
  ADD PRIMARY KEY (`debtID`),
  ADD KEY `customer_ID` (`customer_ID`),
  ADD KEY `d_shopID` (`d_shopID`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`itemID`),
  ADD KEY `i_shopID` (`i_shopID`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`shopID`);

--
-- Indexes for table `trandate`
--
ALTER TABLE `trandate`
  ADD PRIMARY KEY (`tranID`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transactionID`),
  ADD KEY `itemID` (`itemID`),
  ADD KEY `customer_userID` (`customer_userID`),
  ADD KEY `t_shopID` (`t_shopID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `a_login`
--
ALTER TABLE `a_login`
  MODIFY `a_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `c_userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `debts`
--
ALTER TABLE `debts`
  MODIFY `debtID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `itemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `shopID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `transactionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`shopID`) REFERENCES `shops` (`shopID`);

--
-- Constraints for table `a_login`
--
ALTER TABLE `a_login`
  ADD CONSTRAINT `a_login_ibfk_1` FOREIGN KEY (`a_shopID`) REFERENCES `shops` (`shopID`);

--
-- Constraints for table `debts`
--
ALTER TABLE `debts`
  ADD CONSTRAINT `debts_ibfk_1` FOREIGN KEY (`customer_ID`) REFERENCES `customer` (`c_userID`),
  ADD CONSTRAINT `debts_ibfk_2` FOREIGN KEY (`d_shopID`) REFERENCES `shops` (`shopID`);

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`i_shopID`) REFERENCES `shops` (`shopID`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`itemID`) REFERENCES `inventory` (`itemID`),
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`customer_userID`) REFERENCES `customer` (`c_userID`),
  ADD CONSTRAINT `transactions_ibfk_3` FOREIGN KEY (`t_shopID`) REFERENCES `shops` (`shopID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
