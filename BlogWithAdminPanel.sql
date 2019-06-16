-- phpMyAdmin SQL Dump
-- version 4.4.15.9
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 16, 2019 at 03:31 AM
-- Server version: 5.6.37
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `BlogWithAdminPanel`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE IF NOT EXISTS `admins` (
  `id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `phone`, `status`, `created_at`, `updated_at`) VALUES
(1, 'IQ Company', 'admin@admin.com', '$2y$10$w5nZmp0nsGHciOkm71se7u0WkejPSMgMiYUiHW1x7kk5d/B3Tm6nu', '02783872', 1, '2019-05-30 04:32:33', '2019-05-31 09:10:03'),
(2, 'Ahmed Ramadan', 'ahmed.ramadan6565@gmail.com', '$2y$10$O/n3fB7aTVjWJGDQ3QrJQ.B7W9aZTJGoWKdldzG314CqVaHLM5I/u', '010', 1, '2019-05-30 04:32:33', '2019-05-31 07:00:02');

-- --------------------------------------------------------

--
-- Table structure for table `admin_role`
--

CREATE TABLE IF NOT EXISTS `admin_role` (
  `id` bigint(20) unsigned NOT NULL,
  `admin_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role`
--

INSERT INTO `admin_role` (`id`, `admin_id`, `role_id`, `created_at`, `updated_at`) VALUES
(6, 2, 3, NULL, NULL),
(7, 1, 2, NULL, NULL),
(8, 2, 1, NULL, NULL),
(9, 2, 2, NULL, NULL),
(10, 1, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'League of Legends', 'Gaming', '2019-05-29 21:46:44', '2019-05-29 21:48:58'),
(2, 'PUBG', 'Gaming', '2019-05-29 21:46:58', '2019-05-29 21:49:13'),
(3, 'Battle Field', 'Gaming', '2019-05-29 21:47:11', '2019-05-29 21:49:26'),
(4, 'PHP', 'Studying', '2019-05-29 21:49:42', '2019-05-29 21:49:42'),
(5, 'Laravel', 'Studying', '2019-05-29 21:49:54', '2019-05-29 21:49:54'),
(6, 'Barcelona', 'Football', '2019-05-29 21:50:21', '2019-05-29 21:50:21');

-- --------------------------------------------------------

--
-- Table structure for table `category_posts`
--

CREATE TABLE IF NOT EXISTS `category_posts` (
  `post_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_posts`
--

INSERT INTO `category_posts` (`post_id`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-05-29 21:53:18', '2019-05-29 21:53:18'),
(2, 6, '2019-05-29 21:55:45', '2019-05-29 21:55:45'),
(3, 2, '2019-05-29 21:58:33', '2019-05-29 21:58:33'),
(4, 5, '2019-05-29 21:59:57', '2019-05-29 21:59:57'),
(5, 4, '2019-05-29 22:03:30', '2019-05-29 22:03:30'),
(5, 5, '2019-05-29 22:03:30', '2019-05-29 22:03:30'),
(6, 3, '2019-05-29 22:05:40', '2019-05-29 22:05:40');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(32, '2014_10_12_000000_create_users_table', 1),
(33, '2014_10_12_100000_create_password_resets_table', 1),
(34, '2019_05_11_234700_create_posts_table', 1),
(35, '2019_05_11_235443_create_tags_table', 1),
(36, '2019_05_11_235530_create_categories_table', 1),
(37, '2019_05_11_235652_create_category_posts_table', 1),
(38, '2019_05_11_235753_create_post_tags_table', 1),
(39, '2019_05_11_235904_create_admins_table', 1),
(40, '2019_05_12_000032_create_roles_table', 1),
(41, '2019_05_12_000147_create_admin_roles_table', 1),
(42, '2019_05_29_101452_create_permissions_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `for` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `for`, `created_at`, `updated_at`) VALUES
(1, 'user-create', 'user', '2019-05-29 21:19:39', '2019-05-29 21:19:39'),
(2, 'user-update', 'user', '2019-05-29 21:20:00', '2019-05-29 21:20:00'),
(3, 'user-delete', 'user', '2019-05-29 21:20:13', '2019-05-29 21:20:13'),
(4, 'tag-CRUD', 'other', '2019-05-29 21:20:30', '2019-05-29 21:20:30'),
(5, 'Category-CRUD', 'other', '2019-05-29 21:20:43', '2019-05-29 21:20:43'),
(6, 'post-create', 'post', '2019-05-29 21:20:53', '2019-05-29 21:20:53'),
(7, 'post-delete', 'post', '2019-05-29 21:21:05', '2019-05-29 21:21:05'),
(8, 'post-publish', 'post', '2019-05-29 21:21:19', '2019-05-29 21:21:19'),
(9, 'post-update', 'post', '2019-05-29 21:21:31', '2019-05-29 21:21:31');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE IF NOT EXISTS `permission_role` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`role_id`, `permission_id`) VALUES
(2, 6),
(2, 8),
(2, 9),
(3, 4),
(3, 5),
(1, 6),
(1, 9),
(1, 4),
(1, 5),
(3, 9),
(3, 6),
(2, 4),
(2, 5),
(3, 7);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) unsigned NOT NULL,
  `title` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `suptitle` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `posted_by` int(11) DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `like` int(11) DEFAULT NULL,
  `dislike` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `suptitle`, `slug`, `body`, `status`, `posted_by`, `image`, `like`, `dislike`, `created_at`, `updated_at`) VALUES
(1, 'League of Legends', 'Mid Lane', 'online games', '<p>League of Legends is a fairly simple game. Five players sidle alongside one another to combat five others in a small arena to play a little match of tug-of-war (x3). It&#39;s easy to learn the macro structures within the game and the sheer competitive nature of playing with a team keeps players coming back to that small arena. Time after time the chance of victory (crushing or marginal) and even just the thrill of competition make this humble game fun and popular.</p>\r\n\r\n<p>But what makes League fun is not what makes it&nbsp;<em>tantalizing</em>. The further I have gone down the League rabbit-hole and discovered new champions, new synergies, and quirks that have revealed to me why I find this game not addicting (although it very much is) rather I find it delicious: League allows the player to utilize every major tenant of warfare simultaneously and ,in fact, makes them necessary.</p>\r\n\r\n<p>&nbsp;First: strength. The oldest (and simplest) form of all fighting. Giant armies amass and either slaughter each other, or select their champions to battle each other to determine the victor with less bloodshed, soldiers line up neatly to shoot at one another with muskets, or dig themselves into trenches to outlast each other (you get the idea). This also translates into League very simply: tanks and adc&#39;s are often proponents of raw strength and the ones with the most of &#39;it&#39; are the victors.</p>\r\n\r\n<p>&quot;&gt; Second: intelligence. As made famous by Sun Tzu&#39;s &quot;Art of War&quot; the understanding of the upcoming battle is often more important than the battle itself. Mr. Tzu (can I call him that?) also stipulates that those that know the enemy and know themselves shall win every battle. That in mind, it&#39;s endlessly important to know what your champ is capable of versus what the enemies&#39; champ can do. But that&#39;s only step one. This must be repeated for every champ on your team and the opponents. If everyone has a firm grasp on how the upcoming fight could play out then each team is more equipped to try and sway the battle in their favor.<br />\r\nAlso: most of the resources that one can use also fall within intelligence. Most notably: vision. In League, as in real life, knowing where the opponent is and where they are going gives a team the opportunity to collaborate and respond accordingly. Whether the answer is to peel away from the lane and hunt the stray champ or turtle up till they go away, it is impossible to be prepared if you cannot see what&#39;s happening.</p>\r\n\r\n<p>&nbsp;Third: mobility. In real life mobility as a form of warfare only bloomed on a handful of occasions (Genghis Khan&#39;s riders in particular) until technology allowed being mobile to be more successful than sheer might. Fortunately for League, operating under a set of parameters that contains magic or fantastic possibilities and characters the environment of the game is not limited by technology (although if your CS is low that might not be quite true). This contrasts severely with other games. Age of Empires, for instance, is a game that I love dearly and took many years of my childhood, but as I return to play it now I&#39;ve discovered the chore that is technology. One must go through several steps to have the tech to defeat the enemy and these steps are largely identical no matter what civilization you play with; so the first 10 minutes of every game are roughly identical and only result in horse drawn cannons and some slow boats.<br />\r\nBut! For League champions can teleport and flash right from the get-go! Sure many champs just walk around, but other hope, skip, scamper, waddle, leap, dive, etc! The sheer multitude of ways that a champion can move or be moved around the map is staggering and results in an infinitude of combinations (not literally but pretty close!). There is only one resource (not 2 or 4 or 8,153: StarCraft, AoE, Civ 5, respectively) which hurdles the gameplay forward as unencumbered as possible with its infinitude of mobility options for the unsuspecting humans who have stumbled onto League (for better and for worse, till death do us part).</p>\r\n\r\n<p>Lastly: teamwork. These three concepts of war alone are not that impressive. Oodles of games have one or two of them and occasionally even all three. But what makes League incredible is the rapid and concordant fashion that all three come together but ONLY through the human player. Every team fight is laden with a plethora of minute details that are rooted in all three forms of fighting. So the team that wins that fight is the team that harmonizes its strengths and weaknesses. A successful team fight is a stunning display of communication and execution down to the tiniest point. I dare to say that I find these moments in League some of the most beautiful moments of my video gaming life (yes, I have played Skyrim) because the human element to this game is so raw and important that it demands to not be overlooked. That is why I love playing League, win or lose it took a team to do it.</p>\r\n\r\n<p>Sincerely,</p>\r\n\r\n<p>A Nerd with an English Degree</p>', 1, NULL, 'public/Vi2gWIMLw5YV2RqZ4AlsHIBqkoq3QVA5vxBwgAlZ.jpeg', NULL, NULL, '2019-05-29 21:53:18', '2019-05-29 21:53:18'),
(2, 'Barca', 'Football Club', 'Football', '<p>The current crest of FC Barcelona was designed in 1910, until then a diamond shaped crest had been used. The former logo had a crown above the shield analogues to the present logo of Real Madrid. The crest from 1910 was in fact design by a former player, Carles Comamala. Although Comamala&#39;s crest has been modified several times over the years, it is still very alike the first version. The upper left white and blue flag is actually England&rsquo;s and the reason is that England and Catalonia have the same patron saint. The yellow and red flag in the upper right is the Catalonian. The initials have shifted from FCB. to CFB. and back to FCB. again, standing for Club de Futbol Barcelona and Football Club Barcelona, respectively.</p>', 1, NULL, 'public/LaOq7Z703Abreq3giVc3OmfPXGNtLZsnBSu4QQ7c.jpeg', NULL, NULL, '2019-05-29 21:55:45', '2019-05-29 21:55:45'),
(3, 'PUBG Mobile', 'Android Game', 'online games', '<p>How addictive is PUBG?</p>\r\n\r\n<p>What are the service charges for having a savings account in SBI?</p>\r\n\r\n<p>5 Reasons Why PlayerUnknown&rsquo;s Battlegrounds (pubg) Is So Addictive</p>\r\n\r\n<p>In the last few months, we listen to a lot of about . There are the trending memes about PUBG in social media. If few of you do not know what is the PUBG then I tell you that it is a video game. PUBG entered the gaming world like a storm and in a few hours, it became the trending game. This game&rsquo;s main plot is based on lone survivor. Players fight with each other to get ammunition and supplies. The last man standing wins the game.</p>\r\n\r\n<p>#1 straightforward to be told, onerous To Master</p>\r\n\r\n<p>PUBG sounds easy enough. If enjoying solo, begin the plane and head to somewhere obscure and out of the line-of-fire to seek out instrumentation and . That&rsquo;s the straightforward half, and everybody will do that! but, from there on, the stakes drastically increase. It&rsquo;s currently time to survive and players have the selection of concealed into the play space, avoiding confrontation, or get into all guns blazing with associate degree aggressive attitude.</p>\r\n\r\n<p>Whichever you decide on, the result&#39;s invariably a similar. the strain is great, and moving into the highest ten survivors list feels sorta reward able, particularly if you&rsquo;ve bagged a number of kills on the means. It&rsquo;s that increasing problem curve because the match progresses that sort of makes the sport habit-forming. What steps can you are taking otherwise from the last match? that weapons feels right or wrong for you? of these queries get answered with expertise.</p>\r\n\r\n<p>#2 Player Population</p>\r\n\r\n<p>The game has a lot of players across the world. That merely means queue times for matchmaking takes very little or no time the least bit. That&rsquo;s invariably a professional for any FPS or multiplayer game, because it permits you to binge-play round the clock. after all amount doesn&rsquo;t invariably guarantee a high quality play time. From my expertise, the bulk of players I&rsquo;ve compete with no matter region, looks to talk a selected language. That poses a drag if you would like to fancy couple or Squad modes, however that&rsquo;s why you play with friends. rock bottom line is, PlayerUnknown&rsquo;s Battlegrounds is at the highest of the net FPS organic phenomenon at the instant, and as long because it remains there, it suggests that excellent news for players.</p>\r\n\r\n<p>#3 Clear Progression</p>\r\n\r\n<p>What i prefer concerning PUBG is that despite the fact that I&rsquo;m terrible at shooting, a coward and usually don&rsquo;t understand what I&rsquo;m doing, my time enjoying matches isn&rsquo;t progressing to waste. You earn BP for enjoying matches and clearly the BP rewards increase if you&rsquo;re sensible. Finishing within the high ten, winning the match, obtaining additional kills etc square measure all ways that to extend BP. And BP will then be accustomed purchase character customization, crates and additional. the sport positively rewards you for enjoying, however i believe it might use additional of that.</p>\r\n\r\n<p>#4 bit by bit up</p>\r\n\r\n<p>And because the population is big at the instant, revenues are at associate degree all time high. PlayerUnknown&rsquo;s Battlegrounds has spent a number of that into the sport, by introducing a brand new map, new technical schoollike 3D replays, and that we hope this continues. the sport is during a higher state compared to its alpha or early access builds, that&rsquo;s obviously. Personally, i prefer that Bluehole square measure up front and bit by bit increasing the standard over time, albeit it&#39;s slow coming back.</p>\r\n\r\n<p>Take cheating as an example. PUBG over the previous few months have garnered a name for harboring the very best quantity of cheaters in any FPS game ever. That&rsquo;s a record. They ban on the average 1,000,000 players per month for cheating, and that&rsquo;s not sensible. however a minimum of they&rsquo;re doing one thing concerning it, and there may well be additional anti-cheat measures incoming.</p>\r\n\r\n<p>#5 one thing For All Levels</p>\r\n\r\n<p>Ultimately, regardless what critics say or don&rsquo;t say concerning PUBG, in its essence, the sport is improbably fun as a result of the premise is therefore easy. Battle Royale works as a result of it&rsquo;s somewhat sandbox &ndash; every match are going to be practiced in new and alternative ways, with a similar strategy leading to completely different outcomes. That&rsquo;s what makes it habit-forming, and that&rsquo;s what makes American state return thereto from time to time. It doesn&rsquo;t matter if you&rsquo;re a starter to FPS games or a veteran. PUBG will supply the correct quantity of fun and reward with its battle royale.</p>\r\n\r\n<p>Read more on Brainly.in - https://brainly.in/question/8086203#readmore</p>', 1, NULL, 'public/6TPzC3qe0PpxFHFAM0oWQkOkSrIfr8oPOAxgbACh.jpeg', NULL, NULL, '2019-05-29 21:58:33', '2019-05-29 21:58:33'),
(4, 'Laravel', 'MVC Framework', 'Studying', '<p>Laravel is a web application framework with expressive, elegant syntax. We believe development must be an enjoyable, creative experience to be truly fulfilling. Laravel attempts to take the pain out of development by easing common tasks used in the majority of web projects, such as authentication, routing, sessions, and caching.</p>\r\n\r\n<p>Laravel aims to make the development process a pleasing one for the developer without sacrificing application functionality. Happy developers make the best code. To this end, we&#39;ve attempted to combine the very best of what we have seen in other web frameworks, including frameworks implemented in other languages, such as Ruby on Rails, ASP.NET MVC, and Sinatra.</p>\r\n\r\n<p>Laravel is accessible, yet powerful, providing powerful tools needed for large, robust applications. A superb inversion of control container, expressive migration system, and tightly integrated unit testing support give you the tools you need to build any application with which you are tasked.</p>', 1, NULL, 'public/26jFjN0hUatvf43Q96eEWoqoInpGU3EahTnCG1va.jpeg', NULL, NULL, '2019-05-29 21:59:57', '2019-05-29 21:59:57'),
(5, 'PHP', 'Programming Language', 'Studying', '<p>Stands for &quot;Hypertext Preprocessor.&quot; (It is a recursive acronym, if you can understand what that means.) PHP is an HTML-embedded Web scripting language. This means PHP code can be inserted into the HTML of a Web page. When a&nbsp;<a href="https://fileinfo.com/extension/php">PHP page</a>&nbsp;is accessed, the PHP code is read or &quot;parsed&quot; by the server the page resides on. The output from the PHP functions on the page are typically returned as HTML code, which can be read by the browser. Because the PHP code is transformed into HTML before the page is loaded, users cannot view the PHP code on a page. This make PHP pages secure enough to access databases and other secure information.</p>\r\n\r\n<p>A lot of the syntax of PHP is borrowed from other languages such as C, Java and Perl. However, PHP has a number of unique features and specific functions as well. The goal of the language is to allow Web developers to write dynamically generated pages quickly and easily. PHP is also great for creating database-driven Web sites. If you would like to learn more about PHP, the official site is&nbsp;<a href="http://www.php.net/" target="_blank">PHP.net</a>.</p>', 1, NULL, 'public/Ropnp45BnzLBSMADkUauazd01rDbgKTiRqkV0o49.png', NULL, NULL, '2019-05-29 22:03:30', '2019-05-29 22:03:30'),
(6, 'Battle Field', 'Android Game', 'online games', '<p>When I was 19, in the autumn of 1918, I was private Harvey Nottoway, serving in Kitchener&rsquo;s Army on the Western Front in France. In my final, desperate moments, squatting beneath a wall in the mud, I reloaded my rifle, aimed down the sights and fired until the &ldquo;ping&rdquo; of the bolt told me I was out of ammunition and the knife at my throat told me I was out of time.&nbsp;</p>\r\n\r\n<p>In 1918, I was also machine gunner Dean Stevenson, ordered to defend the ruins of a village church, before it was engulfed in flame. I was Paul McClaren, a Lewis gunner in a Mark IV tank&nbsp;when it was annihilated by a German field gun. I was Wyeth Wright and then Needham Jackson. Through their eyes, I was all of them and none.</p>\r\n\r\n<p>In the opening sequence of Electronic Arts&rsquo; blockbuster game&nbsp;<a href="https://www.battlefield.com/en-au">Battlefield I</a>&nbsp;&ndash; released in 2016 to coincide with the centenary of the First World War &ndash; I am told I am not expected to survive. It feels real, but in spite of the bullets and the mud, Battlefield I is not war, merely a convincing replica. Everyone is a hero, nobody really dies. My Lee-Enfield rifle bucks and jams and spits fire, but the game does not simulate the tap of hard tack on billy tin, or the taste of the weevils inside.</p>', 1, NULL, 'public/3Nzjkv138yRck0F4qy74Fc4R6x4SX47mKrd1ar2J.jpeg', NULL, NULL, '2019-05-29 22:05:40', '2019-05-29 22:05:40');

-- --------------------------------------------------------

--
-- Table structure for table `post_tags`
--

CREATE TABLE IF NOT EXISTS `post_tags` (
  `post_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_tags`
--

INSERT INTO `post_tags` (`post_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(1, 2, '2019-05-29 21:53:18', '2019-05-29 21:53:18'),
(2, 3, '2019-05-29 21:55:45', '2019-05-29 21:55:45'),
(3, 2, '2019-05-29 21:58:33', '2019-05-29 21:58:33'),
(4, 1, '2019-05-29 21:59:57', '2019-05-29 21:59:57'),
(5, 1, '2019-05-29 22:03:30', '2019-05-29 22:03:30'),
(6, 2, '2019-05-29 22:05:40', '2019-05-29 22:05:40');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Writer', '2019-05-29 21:22:00', '2019-05-29 21:22:00'),
(2, 'Publisher', '2019-05-29 21:34:08', '2019-05-29 21:34:08'),
(3, 'Editor', '2019-05-29 21:38:58', '2019-05-29 21:38:58');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE IF NOT EXISTS `tags` (
  `id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Learning', 'online courses', '2019-05-29 21:47:34', '2019-05-29 21:50:42'),
(2, 'Gaming', 'online games', '2019-05-29 21:51:01', '2019-05-29 21:51:01'),
(3, 'Football', 'Champions League', '2019-05-29 21:51:29', '2019-05-29 21:51:29');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'ahmed', 'w2@gm.com', NULL, '$2y$10$ofge9HZajOVNz/4Ukwh5SO2T4Q7TslvW1ZzLUrabvTAjhU9agLiC2', NULL, '2019-05-29 21:16:55', '2019-05-29 21:16:55'),
(3, 'Ahmed Ramadan', 'romyo_man65@yahoo.com', NULL, '$2y$10$k0CgkTHkxFMCi7gJU7uXcuLkXyyHsIAiadcQL2zfw5rfTdofWpPpy', NULL, '2019-06-08 22:04:32', '2019-06-08 22:04:32'),
(4, 'romyo man', 'romyo.man65@gmail.com', NULL, '$2y$10$ng4VDM.Fj6bxHciv1UWy7eUqVSYqfdlrNxxQEdkiH3lWwNZVyFySa', NULL, '2019-06-09 02:00:02', '2019-06-09 02:00:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `admin_role`
--
ALTER TABLE `admin_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_posts`
--
ALTER TABLE `category_posts`
  ADD KEY `category_posts_post_id_index` (`post_id`),
  ADD KEY `category_posts_category_id_index` (`category_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_tags`
--
ALTER TABLE `post_tags`
  ADD KEY `post_tags_post_id_index` (`post_id`),
  ADD KEY `post_tags_tag_id_index` (`tag_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `admin_role`
--
ALTER TABLE `admin_role`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `category_posts`
--
ALTER TABLE `category_posts`
  ADD CONSTRAINT `category_posts_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `post_tags`
--
ALTER TABLE `post_tags`
  ADD CONSTRAINT `post_tags_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
