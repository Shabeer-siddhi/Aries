-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 23, 2024 at 10:18 PM
-- Server version: 8.3.0
-- PHP Version: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aries`
--

-- --------------------------------------------------------

--
-- Table structure for table `abilities`
--

DROP TABLE IF EXISTS `abilities`;
CREATE TABLE IF NOT EXISTS `abilities` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity_id` bigint UNSIGNED DEFAULT NULL,
  `entity_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `only_owned` tinyint(1) NOT NULL DEFAULT '0',
  `options` json DEFAULT NULL,
  `scope` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `abilities_scope_index` (`scope`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assigned_roles`
--

DROP TABLE IF EXISTS `assigned_roles`;
CREATE TABLE IF NOT EXISTS `assigned_roles` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` bigint UNSIGNED NOT NULL,
  `entity_id` bigint UNSIGNED NOT NULL,
  `entity_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `restricted_to_id` bigint UNSIGNED DEFAULT NULL,
  `restricted_to_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scope` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assigned_roles_entity_index` (`entity_id`,`entity_type`,`scope`),
  KEY `assigned_roles_role_id_index` (`role_id`),
  KEY `assigned_roles_scope_index` (`scope`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2014_10_12_200000_add_two_factor_columns_to_users_table', 2),
(7, '2024_09_21_105020_add_user_type_to_users_table', 3),
(8, '2024_09_21_171443_create_bouncer_tables', 4),
(9, '2024_09_23_085837_add_status_to_users_table', 5),
(10, '2024_09_23_124256_create_projects_table', 6),
(11, '2024_09_23_124304_create_tasks_table', 6),
(12, '2024_09_23_124538_create_project_user_table', 6),
(14, '2024_09_23_164428_add_time_columns_to_tasks_table', 7);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `ability_id` bigint UNSIGNED NOT NULL,
  `entity_id` bigint UNSIGNED DEFAULT NULL,
  `entity_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `forbidden` tinyint(1) NOT NULL DEFAULT '0',
  `scope` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_entity_index` (`entity_id`,`entity_type`,`scope`),
  KEY `permissions_ability_id_index` (`ability_id`),
  KEY `permissions_scope_index` (`scope`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
CREATE TABLE IF NOT EXISTS `projects` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `projects_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `name`, `description`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Non sed saepe magnam.', 'Eos doloribus rem impedit fugiat qui incidunt. Dolore sequi modi vitae in. Voluptas aut mollitia eveniet accusantium optio.', 10, '2024-09-23 21:59:13', '2024-09-23 21:59:13'),
(2, 'Dolor voluptatem et.', 'Beatae id laboriosam laborum sed omnis veniam vel. Iusto rem laborum deserunt non maxime consequatur excepturi. Maxime dolore sequi soluta ea totam quia sint id. In quia enim ut magnam magni est.', 7, '2024-09-23 21:59:13', '2024-09-23 21:59:13'),
(3, 'Illo magni.', 'Voluptatem ipsum et et minus dolor. Voluptatum et officiis ea molestiae harum fuga excepturi. Reprehenderit et itaque ipsum sed. Et quis ducimus iusto eaque consequatur enim velit nisi.', 2, '2024-09-23 21:59:13', '2024-09-23 21:59:13'),
(4, 'Odio velit molestiae.', 'Iure molestias odit id. Repellendus exercitationem est ea reiciendis. Asperiores ratione et corrupti aliquam. Voluptas corrupti qui autem est perferendis.', 6, '2024-09-23 21:59:13', '2024-09-23 21:59:13'),
(5, 'Voluptatum dolores labore.', 'Qui eum occaecati similique doloribus. Recusandae doloribus magni quia amet sit quod occaecati eos.', 1, '2024-09-23 21:59:13', '2024-09-23 21:59:13'),
(6, 'Blanditiis qui veritatis.', 'Et consectetur quaerat voluptates nesciunt. Dolorem molestiae fugit voluptas pariatur. Officia quis dolor omnis adipisci est. Ducimus voluptatem et et minima. Ad rerum ab facere quam.', 11, '2024-09-23 21:59:13', '2024-09-23 21:59:13'),
(7, 'Sit quisquam amet.', 'Earum molestias nulla velit et voluptas. Repellendus non aut sequi consequatur. Eveniet id est beatae iusto reiciendis. Quisquam cumque voluptatibus excepturi dolores quia alias.', 3, '2024-09-23 21:59:13', '2024-09-23 21:59:13'),
(8, 'Voluptatem aut iusto.', 'Rerum culpa optio ea explicabo mollitia et. Dicta nobis consequatur nulla vel similique et.', 6, '2024-09-23 21:59:13', '2024-09-23 21:59:13'),
(9, 'Distinctio sed et.', 'Enim voluptates dolorem voluptatem nobis. Iste vitae rem omnis et enim autem molestiae sed. Harum qui nesciunt ratione debitis quibusdam dolor ut. Dicta eligendi fugit consequuntur omnis et qui.', 8, '2024-09-23 21:59:13', '2024-09-23 21:59:13'),
(10, 'Eos sint voluptatem.', 'Quia a laboriosam in laboriosam rerum aut. Eos autem sit reiciendis repellendus consequuntur quis rem voluptas. Et voluptate repellendus libero sint illo.', 9, '2024-09-23 21:59:13', '2024-09-23 21:59:13');

-- --------------------------------------------------------

--
-- Table structure for table `project_user`
--

DROP TABLE IF EXISTS `project_user`;
CREATE TABLE IF NOT EXISTS `project_user` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `project_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_user_project_id_foreign` (`project_id`),
  KEY `project_user_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_user`
--

INSERT INTO `project_user` (`id`, `project_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 10, NULL, NULL),
(2, 2, 3, NULL, NULL),
(3, 2, 6, NULL, NULL),
(4, 2, 8, NULL, NULL),
(5, 3, 2, NULL, NULL),
(6, 3, 6, NULL, NULL),
(7, 3, 9, NULL, NULL),
(8, 4, 6, NULL, NULL),
(9, 5, 2, NULL, NULL),
(10, 5, 5, NULL, NULL),
(11, 6, 1, NULL, NULL),
(12, 6, 11, NULL, NULL),
(13, 7, 4, NULL, NULL),
(14, 7, 8, NULL, NULL),
(15, 8, 4, NULL, NULL),
(16, 8, 10, NULL, NULL),
(17, 9, 1, NULL, NULL),
(18, 9, 11, NULL, NULL),
(19, 10, 9, NULL, NULL),
(20, 10, 10, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scope` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`,`scope`),
  KEY `roles_scope_index` (`scope`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
CREATE TABLE IF NOT EXISTS `tasks` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `project_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `total_time` int DEFAULT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tasks_project_id_foreign` (`project_id`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `project_id`, `name`, `description`, `start_time`, `end_time`, `total_time`, `completed`, `created_at`, `updated_at`) VALUES
(1, 1, 'Amet provident sapiente.', 'Sint ducimus et eius quia molestiae quia. Labore voluptas incidunt magnam et beatae ipsam. Ab aut eligendi et minima autem aut.', '2024-09-19 23:43:44', NULL, NULL, 0, '2024-09-23 21:59:13', '2024-09-23 21:59:13'),
(2, 1, 'Harum possimus quia.', 'Officiis sit eligendi atque illo suscipit sit placeat omnis. Ad doloribus sit tenetur sapiente ut labore. Voluptates enim vero quis ratione sit illum.', '2024-09-21 01:08:10', '2024-09-27 12:39:15', 71, 1, '2024-09-23 21:59:13', '2024-09-23 21:59:13'),
(3, 1, 'Ab dicta suscipit nihil.', 'Eum exercitationem laborum voluptas quis et soluta quisquam unde. Vero quisquam quasi ea est veniam. Est autem aut dolor labore a.', NULL, NULL, NULL, 0, '2024-09-23 21:59:13', '2024-09-23 21:59:13'),
(4, 1, 'Temporibus dicta voluptatum.', 'Quam et ipsa ut aliquid ea quo ut. Omnis nihil necessitatibus sint iure incidunt est qui. Iste dolor pariatur impedit impedit nemo id quo accusantium.', NULL, NULL, NULL, 0, '2024-09-23 21:59:13', '2024-09-23 21:59:13'),
(5, 1, 'Eveniet rerum.', 'Et sint et harum tenetur. Doloribus optio aliquam repellat et error. Veritatis dolores eveniet odio at. Accusamus aut asperiores qui rerum dolorem voluptatibus voluptatem.', NULL, NULL, NULL, 0, '2024-09-23 21:59:13', '2024-09-23 21:59:13'),
(6, 2, 'Asperiores voluptatem amet dolor.', 'Ullam minima quisquam sed voluptatem ab. Nihil sunt odio deserunt sed beatae ipsum harum.', '2024-09-17 02:55:15', '2024-09-27 15:57:15', 451, 1, '2024-09-23 21:59:13', '2024-09-23 21:59:13'),
(7, 2, 'Veniam modi laborum.', 'Laborum est est aut nisi veritatis voluptates. Tempora totam saepe rem aspernatur aperiam fuga numquam ipsam. Ipsam aperiam voluptatum qui itaque.', '2024-09-18 13:24:52', NULL, NULL, 0, '2024-09-23 21:59:13', '2024-09-23 21:59:13'),
(8, 2, 'Voluptas et quis.', 'Est quia at optio voluptas fugiat velit velit impedit. Cumque totam sit minus pariatur. Quia blanditiis excepturi in repellat repellat dolore ut. Et autem aut voluptatem aliquam.', '2024-09-21 04:58:50', '2024-09-25 07:45:57', 361, 1, '2024-09-23 21:59:13', '2024-09-23 21:59:13'),
(9, 2, 'Dolor natus explicabo.', 'Omnis totam unde sed harum consequatur nostrum consequatur et. Quo earum quo eveniet rem qui. In doloribus unde nulla libero et consequuntur.', '2024-09-22 19:50:21', '2024-09-22 20:00:42', 18, 1, '2024-09-23 21:59:13', '2024-09-23 21:59:13'),
(10, 2, 'In voluptatum quia.', 'Eaque eligendi facere qui est sit occaecati. Amet ut repellendus incidunt sunt.', '2024-09-23 21:32:10', '2024-09-25 22:08:24', 26, 1, '2024-09-23 21:59:13', '2024-09-23 21:59:13'),
(11, 3, 'Molestiae voluptates.', 'Velit voluptatem eum autem pariatur. Ea animi cupiditate ullam. Aut amet voluptatum libero nulla corrupti tempore. Hic perferendis vel dolor.', '2024-09-21 08:38:41', NULL, NULL, 0, '2024-09-23 21:59:14', '2024-09-23 21:59:14'),
(12, 3, 'Porro velit hic.', 'Dolores dolorem est deleniti eligendi. Reiciendis voluptates rerum quia vel totam impedit blanditiis. Eos sed reprehenderit quibusdam excepturi. Numquam esse fuga saepe culpa inventore provident minus.', '2024-09-22 08:10:15', '2024-09-28 01:40:45', 435, 1, '2024-09-23 21:59:14', '2024-09-23 21:59:14'),
(13, 3, 'Numquam et eos aperiam.', 'Et quaerat itaque officia consequatur tenetur. Veniam suscipit culpa incidunt recusandae. Quaerat fuga quidem similique. Voluptatem itaque saepe et odio quod et.', '2024-09-18 04:28:30', '2024-09-30 08:17:35', 218, 1, '2024-09-23 21:59:14', '2024-09-23 21:59:14'),
(14, 3, 'Fugit dolores modi omnis odio.', 'Assumenda et qui distinctio maxime sequi tenetur. Ut eligendi et ad debitis esse tempore vero. Amet beatae enim vero assumenda. Ex eos repudiandae saepe ut doloremque.', '2024-09-20 05:25:06', '2024-09-20 20:35:57', 446, 1, '2024-09-23 21:59:14', '2024-09-23 21:59:14'),
(15, 3, 'Praesentium fuga natus dolorem.', 'Et facilis nemo numquam et modi quasi hic. Voluptatem laboriosam deserunt laboriosam. Dolores voluptatem quia quia ratione laudantium. Qui laudantium minima natus omnis ut consectetur a. Modi aperiam nobis in earum omnis.', '2024-09-23 08:08:23', '2024-09-27 08:20:04', 354, 1, '2024-09-23 21:59:14', '2024-09-23 21:59:14'),
(16, 4, 'Esse voluptate et.', 'Debitis ut praesentium rerum. Impedit exercitationem nesciunt asperiores occaecati quia totam qui. Tenetur asperiores error laborum autem. Ullam reiciendis voluptatem et dolores praesentium repellendus molestiae possimus. Ex beatae quam quia.', '2024-09-16 22:03:30', '2024-09-26 00:26:32', 388, 1, '2024-09-23 21:59:14', '2024-09-23 21:59:14'),
(17, 4, 'Aut beatae corporis magnam.', 'Qui soluta maxime assumenda porro. Ducimus perspiciatis sit et repudiandae. Voluptatum velit nostrum est enim reprehenderit. Necessitatibus amet accusantium vero recusandae dolor laboriosam quae.', '2024-09-23 04:02:07', NULL, NULL, 0, '2024-09-23 21:59:14', '2024-09-23 21:59:14'),
(18, 4, 'Nemo nihil accusamus.', 'Deserunt qui autem dolores qui cum. Voluptatem sit quo minus nulla. Est sit praesentium facilis vel commodi at sapiente.', '2024-09-23 12:16:34', '2024-09-29 21:42:46', 158, 1, '2024-09-23 21:59:14', '2024-09-23 21:59:14'),
(19, 4, 'Ducimus cumque vel quaerat.', 'Exercitationem esse in consequatur nostrum. Mollitia non sit perspiciatis dolorem similique totam eius. Voluptatem quia quia quo qui.', NULL, NULL, NULL, 0, '2024-09-23 21:59:14', '2024-09-23 21:59:14'),
(20, 4, 'Amet dolore.', 'Ducimus fugiat ipsam mollitia autem possimus voluptate quia. Dolor et qui recusandae porro. Laboriosam qui nam consequatur praesentium saepe molestias et ut.', NULL, NULL, NULL, 0, '2024-09-23 21:59:14', '2024-09-23 21:59:14'),
(21, 5, 'Dolor maiores quo.', 'Recusandae atque eligendi et reiciendis aliquid. Quaerat accusamus et consequatur et temporibus et. Ducimus tempore iste facere ratione.', '2024-09-17 12:28:13', NULL, NULL, 0, '2024-09-23 21:59:14', '2024-09-23 21:59:14'),
(22, 5, 'Velit possimus fugiat.', 'Ducimus consequuntur sapiente accusamus optio corrupti incidunt. Minima eos sit ipsa. Tenetur amet et minus ut nobis et.', '2024-09-17 04:09:50', NULL, NULL, 0, '2024-09-23 21:59:14', '2024-09-23 21:59:14'),
(23, 5, 'Illum reiciendis ut.', 'Quia rerum ratione quis dignissimos perferendis nesciunt omnis error. Et deserunt voluptates cum voluptatum. Quia iste occaecati eius quia sunt.', '2024-09-22 04:13:09', NULL, NULL, 0, '2024-09-23 21:59:14', '2024-09-23 21:59:14'),
(24, 5, 'Alias nesciunt quibusdam.', 'Beatae culpa non nobis aliquid delectus et quas sit. Laudantium et asperiores consequuntur dolores est mollitia. Voluptas nesciunt repudiandae aut ab et et placeat. Ipsa vero dolorum et cumque.', '2024-09-22 04:34:10', NULL, NULL, 0, '2024-09-23 21:59:14', '2024-09-23 21:59:14'),
(25, 5, 'Repellat nobis cumque est molestiae.', 'Quo dicta rerum quasi qui voluptas. Mollitia modi modi magni consequuntur dolorum. Molestiae sint ratione culpa aut minus eum dolores non. Et odio magnam ut a.', '2024-09-18 14:25:33', '2024-09-23 02:34:24', 455, 1, '2024-09-23 21:59:14', '2024-09-23 21:59:14'),
(26, 6, 'Laborum animi accusamus suscipit aut.', 'Repellendus ut hic temporibus illum commodi ut. Consequatur accusamus sunt id adipisci.', '2024-09-18 16:34:09', '2024-09-21 18:20:08', 268, 1, '2024-09-23 21:59:14', '2024-09-23 21:59:14'),
(27, 6, 'Rem perspiciatis et rerum.', 'Nobis nobis et ea optio quas. Omnis animi non velit. Velit sed vitae id voluptatem.', '2024-09-19 05:53:59', NULL, NULL, 0, '2024-09-23 21:59:14', '2024-09-23 21:59:14'),
(28, 6, 'Deleniti cum sint.', 'Ducimus aliquam pariatur cumque a ut eos ullam. Facere eum quibusdam exercitationem saepe totam quas. Hic aperiam voluptatem dignissimos voluptatem. Quia eaque ea totam labore eveniet.', '2024-09-22 22:07:52', NULL, NULL, 0, '2024-09-23 21:59:14', '2024-09-23 21:59:14'),
(29, 6, 'Nesciunt excepturi quod.', 'Aut ipsa numquam nostrum sed odit reiciendis inventore laborum. Laudantium qui expedita commodi adipisci. Voluptatem eveniet exercitationem error expedita. Est eos perspiciatis molestias odit et.', '2024-09-17 08:57:04', '2024-09-20 23:54:51', 105, 1, '2024-09-23 21:59:14', '2024-09-23 21:59:14'),
(30, 6, 'Rem earum quasi ut.', 'Necessitatibus suscipit incidunt voluptatem alias temporibus fugiat. Aut atque dolores quia sit. Dolorem sint cum voluptatem enim. Omnis aut modi est consequatur rerum.', '2024-09-19 14:01:54', '2024-09-28 04:45:03', 440, 1, '2024-09-23 21:59:14', '2024-09-23 21:59:14'),
(31, 7, 'Quas minus autem quia.', 'Velit accusamus exercitationem laboriosam. Et voluptas quia officiis ut saepe laborum minus. Vel ab aut accusantium quis dignissimos autem.', NULL, NULL, NULL, 0, '2024-09-23 21:59:14', '2024-09-23 21:59:14'),
(32, 7, 'Aut omnis id doloremque.', 'Aut neque ab nostrum. Saepe voluptas natus soluta rerum debitis quaerat. Dolorem magni cupiditate commodi illum aspernatur.', '2024-09-17 16:30:51', NULL, NULL, 0, '2024-09-23 21:59:14', '2024-09-23 21:59:14'),
(33, 7, 'Vitae ut delectus.', 'Itaque sapiente sunt impedit et. Accusantium est nobis alias voluptates laboriosam numquam. Qui sapiente voluptas aut ipsam.', '2024-09-19 18:13:46', '2024-09-25 21:41:46', 221, 1, '2024-09-23 21:59:14', '2024-09-23 21:59:14'),
(34, 7, 'Dolore animi.', 'Distinctio eveniet maiores ullam et rerum. Et et corporis ipsa deserunt autem repellat ab. Maiores culpa dolore nihil voluptatum.', '2024-09-21 18:45:47', NULL, NULL, 0, '2024-09-23 21:59:14', '2024-09-23 21:59:14'),
(35, 7, 'Aspernatur velit quibusdam temporibus.', 'Hic veritatis quis et placeat et ad est. Pariatur omnis qui voluptatem assumenda ducimus. Ducimus ut excepturi voluptatum voluptatem est voluptate quia.', '2024-09-17 07:11:49', '2024-09-26 12:54:55', 109, 1, '2024-09-23 21:59:14', '2024-09-23 21:59:14'),
(36, 8, 'Aut nemo nulla.', 'Voluptas voluptates qui recusandae magnam optio. Ipsam quidem blanditiis quam dolorem. Dolor numquam deserunt repellendus sunt nam. Unde dolorem autem sit officia ut et repellendus sit.', '2024-09-18 11:12:57', '2024-09-19 11:45:19', 262, 1, '2024-09-23 21:59:14', '2024-09-23 21:59:14'),
(37, 8, 'Optio voluptatem quis ipsa illo.', 'Qui quia illum laborum consectetur optio beatae alias. Nihil quam esse nostrum et sed molestiae cumque. Eaque quia illum consequatur voluptate et optio. Odit itaque est facere sit quia non nesciunt.', '2024-09-20 17:48:54', '2024-09-29 22:03:45', 242, 1, '2024-09-23 21:59:14', '2024-09-23 21:59:14'),
(38, 8, 'Dolore eum atque quasi.', 'Qui voluptas aperiam ratione. Itaque eveniet exercitationem nihil provident itaque ad ipsum.', NULL, NULL, NULL, 0, '2024-09-23 21:59:14', '2024-09-23 21:59:14'),
(39, 8, 'Est vel et eligendi.', 'Aliquid sed quis autem ipsa. Quo omnis et est. Sed nihil est aut.', '2024-09-23 00:38:49', NULL, NULL, 0, '2024-09-23 21:59:14', '2024-09-23 21:59:14'),
(40, 8, 'Velit molestias.', 'Labore incidunt esse quibusdam sunt. At est repudiandae tempore similique. Ullam aliquid unde totam qui totam aut.', '2024-09-16 23:38:54', '2024-09-25 02:43:13', 262, 1, '2024-09-23 21:59:14', '2024-09-23 21:59:14'),
(41, 9, 'Sed ipsa a dolor delectus.', 'Nam enim illo voluptates enim velit ratione. Assumenda aspernatur earum est et doloribus. Molestiae est sunt quod in.', '2024-09-17 12:56:52', '2024-09-18 08:18:33', 417, 1, '2024-09-23 21:59:14', '2024-09-23 21:59:14'),
(42, 9, 'Eligendi facilis est dicta sequi.', 'Doloribus consequatur illo et facere dignissimos ipsa. Corporis saepe dolor sapiente. Quis fuga libero sapiente ipsa eos aspernatur. Sed voluptas consequatur eum non.', '2024-09-17 11:08:56', NULL, NULL, 0, '2024-09-23 21:59:14', '2024-09-23 21:59:14'),
(43, 9, 'Deserunt quis voluptas quod neque.', 'Voluptas porro est aperiam sed perspiciatis voluptate. Est quos ut voluptas officiis velit.', '2024-09-17 09:08:58', '2024-09-22 05:01:17', 300, 1, '2024-09-23 21:59:14', '2024-09-23 21:59:14'),
(44, 9, 'Qui blanditiis architecto qui.', 'Enim sit ut dolorum et itaque. Sed magni aperiam porro rerum doloribus voluptatibus.', '2024-09-22 14:34:02', '2024-09-28 20:59:46', 220, 1, '2024-09-23 21:59:14', '2024-09-23 21:59:14'),
(45, 9, 'Soluta delectus in.', 'Omnis corporis expedita aut qui nihil quam qui. Ipsam mollitia nemo commodi necessitatibus vel necessitatibus aut. In est iusto aut ipsam magnam saepe.', NULL, NULL, NULL, 0, '2024-09-23 21:59:14', '2024-09-23 21:59:14'),
(46, 10, 'Minima voluptatem qui.', 'Et veritatis maiores deserunt perspiciatis. Ratione at et vel quaerat. Excepturi ut magnam explicabo autem. Aut soluta dignissimos et modi sed natus doloribus. Laboriosam aut corporis beatae eligendi et ullam.', '2024-09-23 06:52:24', '2024-09-30 04:25:27', 28, 1, '2024-09-23 21:59:14', '2024-09-23 21:59:14'),
(47, 10, 'Molestias ut ipsum sit.', 'Sed alias recusandae quo inventore. Provident nam eos optio autem voluptatem ea suscipit. Repellendus aperiam et quia ut.', '2024-09-22 00:26:35', NULL, NULL, 0, '2024-09-23 21:59:14', '2024-09-23 21:59:14'),
(48, 10, 'Dicta est tenetur magni.', 'Consequatur sequi voluptates blanditiis distinctio facere deserunt. Tenetur cumque nobis amet sequi. Ut ut voluptatem ea velit molestias eveniet suscipit.', '2024-09-20 08:30:31', NULL, NULL, 0, '2024-09-23 21:59:14', '2024-09-23 21:59:14'),
(49, 10, 'Ut provident optio necessitatibus eos.', 'Aliquid natus ut praesentium cumque nostrum autem enim. Accusantium distinctio est sunt est expedita. Eum delectus corrupti velit corporis dolore maxime. In et aut ut aliquam.', '2024-09-20 03:50:10', '2024-09-28 09:24:57', 228, 1, '2024-09-23 21:59:14', '2024-09-23 21:59:14'),
(50, 10, 'Et impedit iure voluptatum.', 'Ea itaque architecto facere. Ut ut vero excepturi voluptatem. Numquam ipsam dolor et ea.', '2024-09-21 00:23:30', '2024-09-29 02:49:19', 408, 1, '2024-09-23 21:59:14', '2024-09-23 21:59:14');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_type` enum('user','admin') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `user_type`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@example.com', '2024-09-23 21:59:13', '$2y$12$cWywktQBardkAlybZVuajeknPvigeNo0Ab9NSIdLwtgtn3AGVeDji', NULL, NULL, NULL, '2TjWKonvT6GFWyHyyeuN9TlI0GOjig3gvbUWwM88EItnx8crdg9vpEDGPArd', 'admin', 1, '2024-09-23 21:59:13', '2024-09-23 21:59:13'),
(2, 'Stefanie Doyle', 'clementina.lebsack@example.net', '2024-09-23 21:59:13', '$2y$12$cWywktQBardkAlybZVuajeknPvigeNo0Ab9NSIdLwtgtn3AGVeDji', NULL, NULL, NULL, 'PefXLev7e5', 'admin', 1, '2024-09-23 21:59:13', '2024-09-23 21:59:13'),
(3, 'Caleb Barrows', 'jacquelyn.leannon@example.org', '2024-09-23 21:59:13', '$2y$12$cWywktQBardkAlybZVuajeknPvigeNo0Ab9NSIdLwtgtn3AGVeDji', NULL, NULL, NULL, 'jUZMFTpyij', 'admin', 1, '2024-09-23 21:59:13', '2024-09-23 21:59:13'),
(4, 'Nathaniel Schulist', 'qlegros@example.com', '2024-09-23 21:59:13', '$2y$12$cWywktQBardkAlybZVuajeknPvigeNo0Ab9NSIdLwtgtn3AGVeDji', NULL, NULL, NULL, 'RZM6KjJmw1', 'admin', 1, '2024-09-23 21:59:13', '2024-09-23 21:59:13'),
(5, 'Charles Nikolaus', 'kip88@example.net', '2024-09-23 21:59:13', '$2y$12$cWywktQBardkAlybZVuajeknPvigeNo0Ab9NSIdLwtgtn3AGVeDji', NULL, NULL, NULL, 'ataWr3N5wT', 'admin', 1, '2024-09-23 21:59:13', '2024-09-23 21:59:13'),
(6, 'Kurt Russel', 'mckenzie.lyla@example.com', '2024-09-23 21:59:13', '$2y$12$cWywktQBardkAlybZVuajeknPvigeNo0Ab9NSIdLwtgtn3AGVeDji', NULL, NULL, NULL, 'qAhvRiHw9Q', 'admin', 1, '2024-09-23 21:59:13', '2024-09-23 21:59:13'),
(7, 'Jasper Purdy', 'hodkiewicz.arely@example.com', '2024-09-23 21:59:13', '$2y$12$cWywktQBardkAlybZVuajeknPvigeNo0Ab9NSIdLwtgtn3AGVeDji', NULL, NULL, NULL, 'RGaL6SVHxU', 'admin', 1, '2024-09-23 21:59:13', '2024-09-23 21:59:13'),
(8, 'Brant Bogan', 'matilde.bins@example.org', '2024-09-23 21:59:13', '$2y$12$cWywktQBardkAlybZVuajeknPvigeNo0Ab9NSIdLwtgtn3AGVeDji', NULL, NULL, NULL, 'Lg7Jo4tJ4S', 'admin', 1, '2024-09-23 21:59:13', '2024-09-23 21:59:13'),
(9, 'Cali Lakin', 'ccummings@example.net', '2024-09-23 21:59:13', '$2y$12$cWywktQBardkAlybZVuajeknPvigeNo0Ab9NSIdLwtgtn3AGVeDji', NULL, NULL, NULL, '70iQFRSPlI', 'admin', 1, '2024-09-23 21:59:13', '2024-09-23 21:59:13'),
(10, 'Dr. Carmella Connelly', 'barton.jordyn@example.com', '2024-09-23 21:59:13', '$2y$12$cWywktQBardkAlybZVuajeknPvigeNo0Ab9NSIdLwtgtn3AGVeDji', NULL, NULL, NULL, 'DAFJ8xtQED', 'admin', 1, '2024-09-23 21:59:13', '2024-09-23 21:59:13'),
(11, 'Bernita Halvorson V', 'freda46@example.net', '2024-09-23 21:59:13', '$2y$12$cWywktQBardkAlybZVuajeknPvigeNo0Ab9NSIdLwtgtn3AGVeDji', NULL, NULL, NULL, 'CQpcltlJ03', 'admin', 1, '2024-09-23 21:59:13', '2024-09-23 21:59:13'),
(12, 'Dr. Newell Kuhic Jr.', 'germaine91@example.com', '2024-09-23 21:59:13', '$2y$12$cWywktQBardkAlybZVuajeknPvigeNo0Ab9NSIdLwtgtn3AGVeDji', NULL, NULL, NULL, 'YmnFUYRk6O', 'admin', 1, '2024-09-23 21:59:13', '2024-09-23 21:59:13'),
(13, 'Ms. Faye Swift', 'adams.kathryne@example.org', '2024-09-23 21:59:13', '$2y$12$cWywktQBardkAlybZVuajeknPvigeNo0Ab9NSIdLwtgtn3AGVeDji', NULL, NULL, NULL, 'WF1b4PEFDe', 'admin', 1, '2024-09-23 21:59:13', '2024-09-23 21:59:13'),
(14, 'Franz Gorczany', 'hagenes.jermey@example.com', '2024-09-23 21:59:13', '$2y$12$cWywktQBardkAlybZVuajeknPvigeNo0Ab9NSIdLwtgtn3AGVeDji', NULL, NULL, NULL, '1Ie2Xs48gE', 'admin', 1, '2024-09-23 21:59:13', '2024-09-23 21:59:13'),
(15, 'Mr. Erling Gulgowski', 'isadore75@example.com', '2024-09-23 21:59:13', '$2y$12$cWywktQBardkAlybZVuajeknPvigeNo0Ab9NSIdLwtgtn3AGVeDji', NULL, NULL, NULL, 'pwOrUbTTVf', 'admin', 1, '2024-09-23 21:59:13', '2024-09-23 21:59:13'),
(16, 'Buck Kuhic', 'nkub@example.net', '2024-09-23 21:59:13', '$2y$12$cWywktQBardkAlybZVuajeknPvigeNo0Ab9NSIdLwtgtn3AGVeDji', NULL, NULL, NULL, 'octuylf3HH', 'admin', 1, '2024-09-23 21:59:13', '2024-09-23 21:59:13'),
(17, 'Selena Dickinson', 'josefa07@example.net', '2024-09-23 21:59:13', '$2y$12$cWywktQBardkAlybZVuajeknPvigeNo0Ab9NSIdLwtgtn3AGVeDji', NULL, NULL, NULL, 'A2AcOMqTsN', 'admin', 1, '2024-09-23 21:59:13', '2024-09-23 21:59:13'),
(18, 'Mona Connelly', 'jenkins.joanny@example.com', '2024-09-23 21:59:13', '$2y$12$cWywktQBardkAlybZVuajeknPvigeNo0Ab9NSIdLwtgtn3AGVeDji', NULL, NULL, NULL, 'TBQaMbhuPm', 'admin', 1, '2024-09-23 21:59:13', '2024-09-23 21:59:13'),
(19, 'Ms. Coralie Yundt', 'qconn@example.com', '2024-09-23 21:59:13', '$2y$12$cWywktQBardkAlybZVuajeknPvigeNo0Ab9NSIdLwtgtn3AGVeDji', NULL, NULL, NULL, 'zUGSxhD9A7', 'admin', 1, '2024-09-23 21:59:13', '2024-09-23 21:59:13'),
(20, 'Dr. Elfrieda Koepp Jr.', 'bosco.tristian@example.org', '2024-09-23 21:59:13', '$2y$12$cWywktQBardkAlybZVuajeknPvigeNo0Ab9NSIdLwtgtn3AGVeDji', NULL, NULL, NULL, 'd5gzUKjDHq', 'admin', 1, '2024-09-23 21:59:13', '2024-09-23 21:59:13'),
(21, 'Adrain Schaden', 'richard.stark@example.com', '2024-09-23 21:59:13', '$2y$12$cWywktQBardkAlybZVuajeknPvigeNo0Ab9NSIdLwtgtn3AGVeDji', NULL, NULL, NULL, 'okpB6vUg7x', 'admin', 1, '2024-09-23 21:59:13', '2024-09-23 21:59:13');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
