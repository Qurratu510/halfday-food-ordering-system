-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 07, 2026 at 08:27 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `halfday`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `order_id`, `payment_id`, `item_id`) VALUES
(1, 'admin', 'admin123', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cust_order`
--

CREATE TABLE `cust_order` (
  `order_id` int(11) NOT NULL,
  `order_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `total_amount` decimal(10,2) DEFAULT NULL,
  `table_no` int(11) DEFAULT NULL,
  `receipt_path` varchar(255) DEFAULT NULL,
  `payment_status` enum('unpaid','paid') DEFAULT 'unpaid',
  `status` enum('pending','preparing','ready','completed','cancelled') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cust_order`
--

INSERT INTO `cust_order` (`order_id`, `order_time`, `total_amount`, `table_no`, `receipt_path`, `payment_status`, `status`) VALUES
(1, '2025-06-17 07:25:44', 16.00, 6, 'receipt_order_1_1750145182.jpg', 'unpaid', 'completed'),
(2, '2025-06-17 07:31:58', 13.00, 8, 'receipt_order_2_1750145532.jpg', 'unpaid', 'pending'),
(3, '2025-06-17 07:52:46', 10.00, 9, 'receipt_1750146780_2725.jpg', 'paid', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `item_options`
--

CREATE TABLE `item_options` (
  `option_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `option_name` varchar(100) DEFAULT NULL,
  `additional_price` decimal(10,2) DEFAULT 0.00,
  `option_type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `item_options`
--

INSERT INTO `item_options` (`option_id`, `item_id`, `option_name`, `additional_price`, `option_type`) VALUES
(1, 1, 'Extra Espresso Shot', 3.00, NULL),
(2, 1, 'Change to Oat Milk', 2.00, NULL),
(3, 8, 'Extra Esspresso Shot', 3.00, NULL),
(5, 13, 'Extra Esspresso Shot', 3.00, NULL),
(6, 13, 'Oat Milk', 2.00, NULL),
(8, 11, 'Extra Esspresso Shot', 3.00, NULL),
(9, 11, 'Oat Milk', 2.00, NULL),
(10, 16, 'Extra Esspresso Shot', 3.00, NULL),
(11, 16, 'Oat Milk', 2.00, NULL),
(14, 15, 'Extra Esspresso Shot', 3.00, NULL),
(15, 15, 'Oat Milk', 2.00, NULL),
(16, 17, 'Extra Esspresso Shot', 3.00, NULL),
(17, 17, 'Oat Milk', 2.00, NULL),
(18, 18, 'Oat Milk', 2.00, NULL),
(19, 23, 'Fried Egg', 2.00, NULL),
(20, 32, 'Original Fried Chicken', 5.00, NULL),
(21, 32, 'Korean Fried Chicken', 5.00, NULL),
(22, 32, 'Soy garlic Fried Chicken', 5.00, NULL),
(23, 32, 'Fried Shrimp Gyoza', 3.00, NULL),
(24, 32, 'Boiled Shrimp Gyoza', 3.00, NULL),
(25, 32, 'Extra Noodles', 2.00, NULL),
(26, 32, 'Onsen Egg', 2.00, NULL),
(27, 32, 'Fried Egg', 2.00, NULL),
(28, 48, 'Pineapple', 1.00, NULL),
(29, 48, 'Apple Peach', 1.00, NULL),
(30, 48, 'Original Black Tea', 0.00, NULL),
(31, 51, 'Elderflower', 0.00, NULL),
(32, 51, 'Rose', 0.00, NULL),
(33, 51, 'White Peach', 0.00, NULL),
(34, 51, 'Honey Lemon', 1.00, NULL),
(35, 3, 'Hot', 0.00, 'Variation'),
(36, 3, 'Iced', 1.00, 'Variation'),
(37, 3, 'Extra Esspresso Shot', 3.00, 'Add-on'),
(38, 3, 'Oat Milk', 2.00, 'Add-on'),
(39, 2, 'Hot', 0.00, 'Variation'),
(40, 2, 'Iced', 1.00, 'Variation'),
(41, 2, 'Extra Esspresso Shot', 3.00, 'Other Option'),
(42, 2, 'Oat Milk', 2.00, 'Other Option'),
(43, 4, 'Hot', 0.00, 'Variation'),
(44, 4, 'Iced', 1.00, 'Variation'),
(45, 4, 'Extra Esspresso Shot', 3.00, 'Other Option'),
(46, 4, 'Oat Milk', 2.00, 'Other Option'),
(47, 56, 'Extra Esspresso Shot', 3.00, 'Add-on'),
(48, 9, 'Hot', 0.00, 'Variation'),
(49, 9, 'Iced', 1.00, 'Variation'),
(50, 9, 'Elderflower', 2.00, 'Flavor Syrup'),
(51, 9, 'Hazelnut', 2.00, 'Flavor Syrup'),
(52, 9, 'Honey', 2.00, 'Flavor Syrup'),
(53, 9, 'Lemon', 2.00, 'Flavor Syrup'),
(54, 9, 'Mint', 2.00, 'Flavor Syrup'),
(55, 9, 'Rose', 2.00, 'Flavor Syrup'),
(56, 9, 'Extra Esspresso Shot', 3.00, 'Add-on'),
(57, 10, 'Hot', 0.00, 'Variation'),
(58, 10, 'Iced', 1.00, 'Variation'),
(59, 10, 'Caramel', 2.00, 'Flavor Syrup'),
(60, 10, 'Honey', 2.00, 'Flavor Syrup'),
(61, 10, 'Chocolate (Mocha)', 2.00, 'Flavor Syrup'),
(62, 10, 'Rose', 2.00, 'Flavor Syrup'),
(63, 10, 'Macadami Nuts', 2.00, 'Flavor Syrup'),
(64, 10, 'Hazelnut', 2.00, 'Flavor Syrup'),
(65, 10, 'Extra Espresso Shot', 3.00, 'Other Option'),
(66, 10, 'Oat Milk', 2.00, 'Other Option'),
(67, 33, 'Serve now', 0.00, 'Serving Time'),
(68, 33, 'After Meal', 0.00, 'Serving Time'),
(69, 37, 'Serve now', 0.00, 'Serving Time'),
(70, 37, 'After meal', 0.00, 'Serving Time'),
(71, 34, 'Serve now', 0.00, 'Serving Time'),
(72, 34, 'After meal', 0.00, 'Serving Time'),
(73, 35, 'After Meal', 0.00, 'Serving Time'),
(74, 35, 'Serve now', 0.00, 'Serving Time'),
(75, 53, 'Serve now', 0.00, 'Serving Time'),
(76, 53, 'After Meal', 0.00, 'Serving Time'),
(77, 53, 'Takeaway', 0.00, 'Serving Time'),
(78, 38, 'Serve now', 0.00, 'Serving Time'),
(79, 38, 'After Meal', 0.00, 'Serving Time'),
(80, 39, 'Vanilla', 0.00, 'Ice Cream Selection'),
(81, 39, 'Taro/ Yam', 0.00, 'Ice Cream Selection'),
(82, 39, 'Mint', 0.00, 'Ice Cream Selection'),
(83, 39, 'Chocolate', 0.00, 'Ice Cream Selection'),
(84, 40, 'Serve now', 0.00, 'Serving Time'),
(85, 40, 'After Meal', 0.00, 'Serving Time'),
(86, 40, 'Vanilla', 3.00, 'Add-on Ice Cream'),
(87, 40, 'Chocolate', 3.00, 'Add-on Ice Cream'),
(88, 40, 'Taro/ Yam', 3.00, 'Add-on Ice Cream'),
(89, 40, 'Mint', 3.00, 'Add-on Ice Cream'),
(90, 41, 'Cream Cheese + Blueberry Sauce', 0.00, 'Flavor'),
(91, 41, 'Yam Ice Cream & Nuts', 1.00, 'Flavor'),
(92, 41, 'Chocolate Mint Ice Cream', 1.00, 'Flavor'),
(93, 42, 'Egg Mayo & Cheese', 0.00, 'Flavor'),
(94, 42, 'Chicken Loaf & Egg Mayo', 2.00, 'Flavor'),
(95, 57, 'Lemon Curd', 0.00, 'Flavor'),
(96, 57, 'Dark Chocolate', 0.00, 'Flavor'),
(97, 57, 'Homemade Blueberry', 0.00, 'Flavor'),
(98, 57, 'Strawberry', 0.00, 'Flavor'),
(99, 57, 'Serve now', 0.00, 'Serving Time'),
(100, 57, 'After Meal', 0.00, 'Serving Time'),
(101, 57, 'Vanilla', 3.00, 'Add-on Ice Cream'),
(102, 57, 'Taro/ Yam', 3.00, 'Add-on Ice Cream'),
(103, 57, 'Mint', 3.00, 'Add-on Ice Cream'),
(104, 57, 'Chocolate', 3.00, 'Add-on Ice Cream'),
(105, 11, 'Hot', 0.00, 'Variation'),
(106, 11, 'Iced', 1.00, 'Variation'),
(109, 13, 'Hot', 0.00, 'Variation'),
(110, 13, 'Iced', 1.00, 'Variation'),
(113, 15, 'Hot', 0.00, 'Variation'),
(114, 15, 'Iced', 1.00, 'Variation'),
(115, 16, 'Hot', 0.00, 'Variation'),
(116, 16, 'Iced', 1.00, 'Variation'),
(117, 17, 'Hot', 0.00, 'Variation'),
(118, 17, 'Iced', 1.00, 'Variation'),
(119, 49, 'Hot', 0.00, 'Variation'),
(120, 49, 'Iced', 1.00, 'Variation'),
(121, 49, 'Mint', 0.00, 'Flavor'),
(122, 49, 'Rose', 0.00, 'Flavor'),
(123, 49, 'Elderflower', 0.00, 'Flavor'),
(124, 49, 'Honey', 0.00, 'Flavor'),
(125, 51, 'Hot', 0.00, 'Variation'),
(126, 51, 'Iced', 1.00, 'Variation'),
(127, 52, 'Hot', 0.00, 'Variation'),
(128, 52, 'Iced', 1.00, 'Variation'),
(129, 45, 'Chili Sauce', 0.00, 'Condiments'),
(130, 45, 'Mayo', 0.00, 'Condiments'),
(131, 45, 'Toasted Mentai', 2.00, 'Condiments'),
(132, 46, 'Ginger in Vinegar', 0.00, 'Condiments'),
(133, 46, 'Chili Sauce', 0.00, 'Condiments'),
(134, 23, 'Original', 0.00, 'Flavor'),
(135, 23, 'Spicy', 0.00, 'Flavor'),
(136, 26, 'Original', 0.00, 'Flavor of Fried Chicken'),
(137, 26, 'Korean', 0.00, 'Flavor of Fried Chicken'),
(138, 26, 'Soy Garlic', 0.00, 'Flavor of Fried Chicken'),
(256, 44, 'Chili sauce', 1.00, 'Condiments'),
(257, 44, 'Mayonnaise Sauce', 1.00, 'Condiments');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `item_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `is_available` tinyint(1) DEFAULT 1,
  `image_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`item_id`, `name`, `price`, `category`, `is_available`, `image_path`) VALUES
(1, 'Iced Watermelon YURI Matcha Milk', 13.00, 'Niko Neko Japanese Tea', 1, '../images/1749831039_watermelon yuri.jpg'),
(2, 'YURI Matcha Milk', 11.00, 'Niko Neko Japanese Tea', 1, '../images/1749837682_yuri matcha milk.jpeg'),
(3, 'SUISEN Genmai Milk', 11.00, 'Niko Neko Japanese Tea', 1, '../images/1749830953_suisen genmai.jpg'),
(4, 'TSUBAKI Houjicha Milk', 11.00, 'Niko Neko Japanese Tea', 1, '../images/1749830990_hoijicha milkshake.jpeg'),
(5, 'YURI Matcha Milkshake', 13.00, 'Niko Neko Japanese Tea', 1, '../images/1749831065_yuri matcha milkshake.jpeg'),
(6, 'TSUBAKI Houjicha Chocolate Milkshake', 13.00, 'Niko Neko Japanese Tea', 1, '../images/1749830971_tsubaki houjicha.jpeg'),
(8, 'Aero Iced Black Coffee', 11.00, 'Espresso Coffee', 1, '../images/1749830248_dirty.jpeg'),
(9, 'Black Coffee', 9.00, 'Espresso Coffee', 1, '../images/1749830296_black coffee.jpeg'),
(10, 'White Milk Coffee', 10.00, 'Espresso Coffee', 1, '../images/1749830352_white milk coffee.jpeg'),
(11, 'Fresh Milk', 8.00, 'Fresh Milk Series', 1, '../images/1749830448_fresh milk.jpg'),
(13, 'Earl Grey Black Tea Milk', 10.00, 'Fresh Milk Series', 1, '../images/1749830431_earl grey.jpg'),
(15, 'Macadamia Nuts Syrup Milk', 10.00, 'Fresh Milk Series', 1, '../images/1749830515_macadamia-milk.webp'),
(16, 'Hazelnut Syrup Milk', 10.00, 'Fresh Milk Series', 1, '../images/1749830469_hazulnut syrup.webp'),
(17, 'Rose Milk', 10.00, 'Fresh Milk Series', 1, '../images/1749830534_rose milk.jpeg'),
(18, 'Iced Strawberry Milk', 11.00, 'Fresh Milk Series', 1, '../images/1749825280_strawberry milk.jpg'),
(19, 'Oreo', 13.00, 'Milkshake', 1, '../images/1749831381_milkshake selection.jpg'),
(20, 'Chocolate', 13.00, 'Milkshake', 1, '../images/1749831340_milkshake selection.jpg'),
(21, 'Mint Chocolate', 13.00, 'Milkshake', 1, '../images/1749831365_milkshake selection.jpg'),
(22, 'Strawberry', 13.00, 'Milkshake', 1, '../images/1749831398_milkshake selection.jpg'),
(23, 'Butter Chicken with Rice', 18.00, 'Mains', 1, '../images/1749830719_butterciken rice.jpg'),
(24, 'Nasi Lemak Ijo Ayam Goreng', 18.00, 'Mains', 1, '../images/1749830757_n.l ijo ayam grg.jpg'),
(25, 'Oyakodon', 18.00, 'Mains', 1, '../images/1749830810_oyakodpon.jpg'),
(26, 'Scallion Oil Rice Bowl with Chicken', 12.00, 'Mains', 1, '../images/1749830844_scallion oil  iken.jpeg'),
(27, 'Original Fried Chciken', 18.00, 'Mains', 1, '../images/1749830782_fried ciken.jpg'),
(28, 'Soy Garlic Fried Chciken', 18.00, 'Mains', 1, '../images/1749830899_soy garlic.jpg'),
(29, 'Korean Fried Chciken', 18.00, 'Mains', 1, '../images/1749830739_korean fried ciken.jpg'),
(31, 'Scallion Shrimp Ramen', 18.00, 'Mains', 1, '../images/1749830863_shrimp ramen.webp'),
(32, 'Signature Noodles and Egg', 10.00, 'Mains', 1, '../images/1749830884_signature noodle eggs.jpg'),
(33, 'Affogato (Espresso Coffee + Vanilla Ice Cream)', 11.00, 'Heyee Self-made Desserts', 1, '../images/1749826307_affogato.jpg'),
(34, 'Pistachio Baked Burnt Cheese Cake', 14.00, 'Heyee Self-made Desserts', 1, '../images/1749828061_pistachio bake burnt.jpg'),
(35, 'Yuri Matcha Cheese Cake', 13.00, 'Heyee Self-made Desserts', 1, '../images/1749830682_yuri matcha chesse cake.jpg'),
(37, 'Strawberry Cheese Cake', 13.00, 'Heyee Self-made Desserts', 1, '../images/1749830635_strawberry chesse.jpg'),
(38, 'Tiramisu Semifreddo', 14.00, 'Heyee Self-made Desserts', 1, '../images/1749830659_tiramisu.jpg'),
(39, 'Dark Chocolate Brownie Ice Cream', 14.00, 'Heyee Self-made Desserts', 1, '../images/1749830594_dark chocolate.jpg'),
(40, 'Honey Butter Cinnamon Roll', 10.00, 'Bakery', 1, '../images/1749822173_honey butter rolls.jpg'),
(41, 'Sweet Croissant', 12.00, 'Bakery', 1, '../images/1749829994_sweet croisant.jpg'),
(42, 'Savoury Croissant', 13.00, 'Bakery', 1, '../images/1749822271_savoury croissant.webp'),
(44, 'Fries', 10.00, 'Sides', 1, '../images/1749822453_fries.jpeg'),
(45, 'Fried Shrimp Gyoza', 11.00, 'Sides', 1, '../images/1749831209_fried shrimp.webp'),
(46, 'Shrimp Gyoza', 13.00, 'Sides', 1, '../images/1749831255_shrimp gyoza.jpeg'),
(47, 'Nuggets & Fries', 15.00, 'Sides', 1, '../images/1749831235_nugget and fries.jpg'),
(48, 'Iced Kombucha Selection', 10.00, 'Refreshment Soda', 1, '../images/1749831106_kombucha selection.jpg'),
(49, 'Lemonade Based Selection', 8.00, 'Refreshment Soda', 1, '../images/1749831123_lemonade selection.jpg'),
(50, 'Iced Lemonade Osmanthus Jelly Soda', 9.00, 'Refreshment Soda', 1, '../images/1749831145_lemonae watermelon.jpeg'),
(51, 'Black Tea Selection', 8.00, 'Tea Drinks', 1, '../images/1749831280_black tea.jpeg'),
(52, 'Green Tea Selection', 8.00, 'Tea Drinks', 1, '../images/1749831295_green tea selection.jpeg'),
(53, 'Mango Cheese Cake', 13.00, 'Heyee Self-made Desserts', 1, '../images/1749827661_mango cheesecake.jpg'),
(55, 'SUISEN Genmai Taro Milkshake', 13.00, 'Niko Neko Japanese Tea', 1, '../images/1749848700_taro milkshake.jpeg'),
(56, 'Dirty', 13.00, 'Espresso Coffee', 1, '../images/1749848754_dirty.jpeg'),
(57, 'Cookies Dough Tart', 10.00, 'Bakery', 1, '../images/1749850273_cookies dough tart.jpg'),
(58, 'Taro / Yam', 13.00, 'Milkshake', 1, '../images/1749852399_milkshake selection.jpg'),
(62, 'Beef Noodle Soup', 18.00, 'Mains', 1, '../images/1749852271_beef noodle soup.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT 1,
  `price_at_order_time` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_item_id`, `order_id`, `item_id`, `quantity`, `price_at_order_time`) VALUES
(1, 1, 1, 1, 16.00),
(2, 2, 1, 1, 13.00),
(3, 3, 44, 1, 10.00);

-- --------------------------------------------------------

--
-- Table structure for table `order_item_options`
--

CREATE TABLE `order_item_options` (
  `order_item_option_id` int(11) NOT NULL,
  `order_item_id` int(11) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_item_options`
--

INSERT INTO `order_item_options` (`order_item_option_id`, `order_item_id`, `option_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `receipt_path` varchar(255) NOT NULL,
  `payment_time` datetime DEFAULT current_timestamp(),
  `uploaded_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_admin_order` (`order_id`),
  ADD KEY `fk_admin_payment` (`payment_id`),
  ADD KEY `fk_admin_item` (`item_id`);

--
-- Indexes for table `cust_order`
--
ALTER TABLE `cust_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `item_options`
--
ALTER TABLE `item_options`
  ADD PRIMARY KEY (`option_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `order_item_options`
--
ALTER TABLE `order_item_options`
  ADD PRIMARY KEY (`order_item_option_id`),
  ADD KEY `order_item_id` (`order_item_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `order_id` (`order_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cust_order`
--
ALTER TABLE `cust_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `item_options`
--
ALTER TABLE `item_options`
  MODIFY `option_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=258;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order_item_options`
--
ALTER TABLE `order_item_options`
  MODIFY `order_item_option_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `fk_admin_item` FOREIGN KEY (`item_id`) REFERENCES `menu_items` (`item_id`),
  ADD CONSTRAINT `fk_admin_order` FOREIGN KEY (`order_id`) REFERENCES `cust_order` (`order_id`),
  ADD CONSTRAINT `fk_admin_payment` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`payment_id`);

--
-- Constraints for table `item_options`
--
ALTER TABLE `item_options`
  ADD CONSTRAINT `item_options_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `menu_items` (`item_id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `cust_order` (`order_id`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `menu_items` (`item_id`);

--
-- Constraints for table `order_item_options`
--
ALTER TABLE `order_item_options`
  ADD CONSTRAINT `order_item_options_ibfk_1` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`order_item_id`) ON DELETE CASCADE;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `cust_order` (`order_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
