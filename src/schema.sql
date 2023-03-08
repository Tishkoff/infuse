--
-- Database: `infuse`
--
CREATE DATABASE IF NOT EXISTS `infuse` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `infuse`;

-- --------------------------------------------------------

--
-- Table structure for table `visitors`
--
CREATE TABLE `visitors` (
  `ip_address` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `user_agent` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `view_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `page_url` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `views_count` int UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for table `visitors`
--
ALTER TABLE `visitors`
  ADD PRIMARY KEY (`ip_address`,`user_agent`,`page_url`);
COMMIT;
