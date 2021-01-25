-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 11, 2020 at 09:49 PM
-- Server version: 5.6.41-84.1
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lovislan_lovislan`
--

-- --------------------------------------------------------

--
-- Table structure for table `affiliates_requests`
--

CREATE TABLE `affiliates_requests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `amount` varchar(100) NOT NULL DEFAULT '0',
  `full_amount` varchar(100) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `announcement`
--

CREATE TABLE `announcement` (
  `id` int(11) NOT NULL,
  `text` text,
  `time` int(32) NOT NULL DEFAULT '0',
  `active` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `announcement`
--

INSERT INTO `announcement` (`id`, `text`, `time`, `active`) VALUES
(1, '<p>FREE FOR ALL THE WOMAN</p>', 1589221375, '1');

-- --------------------------------------------------------

--
-- Table structure for table `announcement_views`
--

CREATE TABLE `announcement_views` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `announcement_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `announcement_views`
--

INSERT INTO `announcement_views` (`id`, `user_id`, `announcement_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `audiocalls`
--

CREATE TABLE `audiocalls` (
  `id` int(11) NOT NULL,
  `call_id` varchar(30) NOT NULL DEFAULT '0',
  `access_token` text,
  `call_id_2` varchar(30) NOT NULL DEFAULT '',
  `access_token_2` text,
  `from_id` int(11) NOT NULL DEFAULT '0',
  `to_id` int(11) NOT NULL DEFAULT '0',
  `room_name` varchar(50) NOT NULL DEFAULT '',
  `active` int(11) NOT NULL DEFAULT '0',
  `called` int(11) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL DEFAULT '0',
  `declined` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bank_receipts`
--

CREATE TABLE `bank_receipts` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `description` tinytext,
  `price` varchar(50) NOT NULL DEFAULT '0',
  `mode` varchar(50) NOT NULL DEFAULT '',
  `approved` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `receipt_file` varchar(250) NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `approved_at` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `banned_ip`
--

CREATE TABLE `banned_ip` (
  `id` int(11) NOT NULL,
  `ip_address` varchar(32) NOT NULL DEFAULT '',
  `time` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `blocks`
--

CREATE TABLE `blocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT '0',
  `block_userid` int(11) UNSIGNED DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

CREATE TABLE `blog` (
  `id` int(11) NOT NULL,
  `title` varchar(120) NOT NULL DEFAULT '',
  `content` text,
  `description` text,
  `posted` varchar(300) DEFAULT '0',
  `category` int(255) DEFAULT '0',
  `thumbnail` varchar(100) DEFAULT 'upload/photos/d-blog.jpg',
  `view` int(11) DEFAULT '0',
  `shared` int(11) DEFAULT '0',
  `tags` varchar(300) DEFAULT '',
  `created_at` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE `conversations` (
  `id` int(11) UNSIGNED NOT NULL,
  `sender_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `receiver_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `from_delete` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `to_delete` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` int(11) UNSIGNED DEFAULT '0',
  `status` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `custom_pages`
--

CREATE TABLE `custom_pages` (
  `id` int(11) NOT NULL,
  `page_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `page_title` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `page_content` text COLLATE utf8_unicode_ci,
  `page_type` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `custom_pages`
--

INSERT INTO `custom_pages` (`id`, `page_name`, `page_title`, `page_content`, `page_type`) VALUES
(1, 'group', 'groupchat', 'groupchat', 1);

-- --------------------------------------------------------

--
-- Table structure for table `emails`
--

CREATE TABLE `emails` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `email_to` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subject` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8_unicode_ci,
  `src` varchar(50) CHARACTER SET utf8mb4 DEFAULT 'site'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `followers`
--

CREATE TABLE `followers` (
  `id` int(11) NOT NULL,
  `following_id` int(11) NOT NULL DEFAULT '0',
  `follower_id` int(11) NOT NULL DEFAULT '0',
  `active` int(255) NOT NULL DEFAULT '1',
  `created_at` int(11) UNSIGNED DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gifts`
--

CREATE TABLE `gifts` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(250) CHARACTER SET utf8 DEFAULT '',
  `media_file` varchar(250) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `time` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `hot`
--

CREATE TABLE `hot` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT '0',
  `hot_userid` int(11) UNSIGNED DEFAULT '0',
  `val` int(11) UNSIGNED DEFAULT '0',
  `created_at` int(11) UNSIGNED DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `langs`
--

CREATE TABLE `langs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ref` varchar(250) NOT NULL DEFAULT '',
  `options` text,
  `lang_key` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `english` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `dutch` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `french` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `portuguese` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `langs`
--

INSERT INTO `langs` (`id`, `ref`, `options`, `lang_key`, `english`, `dutch`, `french`, `portuguese`) VALUES
(1, '', NULL, 'male', 'Male', 'Mannetje', 'Mâle', 'Masculino'),
(2, '', NULL, 'english', 'English', 'Engels', 'Anglais', 'Inglês'),
(4, '', NULL, 'sandy', 'Sandy', 'zanderig', 'Sablonneux', 'Sandy'),
(5, '', NULL, 'about_a_minute_ago', 'about a minute ago', 'ongeveer een minuut geleden', 'Il y a environ une minute', 'cerca de um minuto atrás'),
(6, '', NULL, 'female', 'Female', 'Vrouw', 'Femelle', 'Fêmea'),
(7, '', NULL, '141_cm', '141 cm', '141 cm', '141 cm', '141 cm'),
(8, '', NULL, '143_cm', '143 cm', '143 cm', '143 cm', '143 cm'),
(9, '', NULL, 'white', 'White', 'Wit', 'blanc', 'Branco'),
(11, '', NULL, 'just_now', 'Just now', 'Net nu', 'Juste maintenant', 'Agora mesmo'),
(12, '', NULL, 'about', 'About', 'Wat betreft', 'Sur', 'Sobre'),
(13, '', NULL, 'view_profile', 'View Profile', 'Bekijk profiel', 'Voir le profil', 'Ver perfil'),
(14, '', NULL, '_d_years_ago', '%d years ago', '%d jaar geleden', 'il y a %d années', '%d anos atrás'),
(15, '', NULL, 'find_matches', 'Find Matches', 'Vind overeenkomsten', 'Trouver des allumettes', 'Encontrar correspondências'),
(16, '', NULL, 'premium', 'Premium', 'Premie', 'Prime', 'Prêmio'),
(17, '', NULL, 'boost_me_', 'Boost me!', 'Boost me!', 'Boost moi!', 'Me impulsione!'),
(18, '', NULL, 'credits', 'Credits', 'credits', 'Crédits', 'Créditos'),
(19, '', NULL, 'profile', 'Profile', 'Profiel', 'Profil', 'Perfil'),
(20, '', NULL, 'matches', 'Matches', 'Wedstrijden', 'Allumettes', 'Fósforos'),
(21, '', NULL, 'visits', 'Visitors', 'bezoekers', 'Visiteurs', 'Visitantes'),
(22, '', NULL, 'likes', 'Likes', 'sympathieën', 'Aime', 'Gostos'),
(23, '', NULL, 'people_i_liked', 'People I Liked', 'Mensen die ik leuk vond', 'Les gens que j\'ai aimé', 'Pessoas que eu gostei'),
(24, '', NULL, 'people_i_disliked', 'People I Disliked', 'Mensen met wie ik een hekel had', 'Les gens que je n\'aime pas', 'Pessoas que eu não gostei'),
(25, '', NULL, 'settings', 'Settings', 'instellingen', 'Réglages', 'Definições'),
(26, '', NULL, 'transactions', 'Transactions', 'transacties', 'Transactions', 'Transações'),
(27, '', NULL, 'admin_panel', 'Admin Panel', 'Administratie Paneel', 'panneau d\'administration', 'Painel de administração'),
(28, '', NULL, 'log_out', 'Log Out', 'Uitloggen', 'Connectez - Out', 'Sair'),
(29, '', NULL, 'messenger', 'Messenger', 'Boodschapper', 'Messager', 'Mensageiro'),
(30, '', NULL, 'active_status', 'Active Status', 'Actieve status', 'Statut actif', 'Status ativo'),
(31, '', NULL, 'offline', 'Offline', 'offline', 'Hors ligne', 'desligada'),
(32, '', NULL, 'online', 'Online', 'Online', 'En ligne', 'Conectados'),
(33, '', NULL, 'mark_all_as_read', 'Mark all as read', 'Markeer alles als gelezen', 'tout marquer comme lu', 'marcar tudo como lido'),
(34, '', NULL, 'search_for_chats', 'Search for conversations', 'Zoeken naar gesprekken', 'Rechercher des conversations', 'Pesquisar por conversas'),
(35, '', NULL, 'reset', 'Reset', 'Reset', 'Réinitialiser', 'Restabelecer'),
(36, '', NULL, 'all', 'All', 'Allemaal', 'Tout', 'Todos'),
(37, '', NULL, 'no_more_messages_to_show.', 'No more messages to show.', 'Geen berichten meer om te laten zien.', 'Pas plus de messages à afficher.', 'Não há mais mensagens para mostrar.'),
(38, '', NULL, 'load_more...', 'Load more', 'Meer laden', 'Charger plus', 'Carregue mais'),
(39, '', NULL, 'stickers', 'Stickers', 'stickers', 'Des autocollants', 'Adesivos'),
(40, '', NULL, 'very_low', 'Very low', 'Heel laag', 'Très lent', 'Muito baixo'),
(41, '', NULL, 'popularity', 'Popularity', 'populariteit', 'Popularité', 'Popularidade'),
(42, '', NULL, 'increase', 'Increase', 'Toenemen', 'Augmenter', 'Aumentar'),
(43, '', NULL, 'premium_users', 'Premium Users', 'Premium gebruikers', 'Utilisateurs Premium', 'Usuários Premium'),
(44, '', NULL, 'add_me', 'Add Me', 'Voeg me toe', 'Ajoute moi', 'Me adicione'),
(45, '', NULL, 'who_ages', 'who ages', 'wie ouder wordt', 'qui vieillit', 'quem envelhece'),
(46, '', NULL, 'located_within', 'located within', 'gevestigd binnen', 'située à l\'intérieur', 'localizado dentro'),
(47, '', NULL, 'km_of', 'km of', 'km van', 'km de', 'km de'),
(48, '', NULL, 'apply_filters', 'Apply Filters', 'Filters toepassen', 'Appliquer des filtres', 'Aplicar filtros'),
(49, '', NULL, 'close_filters', 'Close Filters', 'Filters sluiten', 'Fermer les filtres', 'Fechar filtros'),
(50, '', NULL, 'basic', 'Basic', 'basis-', 'De base', 'Basic'),
(51, '', NULL, 'looks', 'Looks', 'looks', 'Regards', 'Parece'),
(52, '', NULL, 'background', 'Background', 'Achtergrond', 'Contexte', 'fundo'),
(53, '', NULL, 'lifestyle', 'Lifestyle', 'Lifestyle', 'Mode de vie', 'Estilo de vida'),
(54, '', NULL, 'more', 'More', 'Meer', 'Plus', 'Mais'),
(55, '', NULL, 'gender', 'Gender', 'Geslacht', 'Le sexe', 'Gênero'),
(56, '', NULL, 'location', 'Location', 'Plaats', 'Emplacement', 'Localização'),
(57, '', NULL, 'start_typing..', 'Start typing..', 'Beginnen met typen..', 'Commencer à écrire..', 'Começe a digitar..'),
(58, '', NULL, 'ages', 'Ages', 'Ages', 'Âge', 'Idades'),
(59, '', NULL, 'distance', 'Distance', 'Afstand', 'Distance', 'Distância'),
(60, '', NULL, 'search', 'Search', 'Zoeken', 'Chercher', 'Procurar'),
(61, '', NULL, 'height', 'Height', 'Hoogte', 'la taille', 'Altura'),
(62, '', NULL, 'body_type', 'Body type', 'Lichaamstype', 'Type de corps', 'Tipo de corpo'),
(63, '', NULL, 'language', 'Language', 'Taal', 'La langue', 'Língua'),
(64, '', NULL, 'ethnicity', 'Ethnicity', 'Afkomst', 'Ethnicité', 'Etnia'),
(65, '', NULL, 'religion', 'Religion', 'Religie', 'Religion', 'Religião'),
(66, '', NULL, 'status', 'Status', 'staat', 'Statut', 'Status'),
(67, '', NULL, 'smokes', 'Smokes', 'Rook', 'Fume', 'Fuma'),
(68, '', NULL, 'drinks', 'Drinks', 'Drankjes', 'Boissons', 'Bebidas'),
(69, '', NULL, 'by_interest', 'By Interest', 'Op interesse', 'Par intérêt', 'Por interesse'),
(70, '', NULL, 'e.g.__singing', 'e.g Singing', 'bijvoorbeeld zingen', 'par exemple chanter', 'por exemplo, cantando'),
(71, '', NULL, 'education', 'Education', 'Opleiding', 'Éducation', 'Educação'),
(72, '', NULL, 'pets', 'Pets', 'Huisdieren', 'Animaux domestiques', 'Animais de estimação'),
(73, '', NULL, 'no_more_users_to_show.', 'No more users to show', 'Geen gebruikers meer om te laten zien', 'Pas plus d\'utilisateurs à montrer', 'Não há mais usuários para mostrar'),
(74, '', NULL, 'random_users', 'Random Users', 'Willekeurige gebruikers', 'Utilisateurs aléatoires', 'Usuários aleatórios'),
(75, '', NULL, 'copyright', 'Copyright', 'auteursrechten', 'droits d\'auteur', 'direito autoral'),
(76, '', NULL, 'all_rights_reserved', 'All rights reserved', 'Alle rechten voorbehouden', 'Tous les droits sont réservés', 'Todos os direitos reservados'),
(77, '', NULL, 'about_us', 'About Us', 'Over ons', 'À propos de nous', 'Sobre nós'),
(78, '', NULL, 'terms', 'Terms', 'Voorwaarden', 'termes', 'Termos'),
(79, '', NULL, 'privacy_policy', 'Privacy Policy', 'Privacybeleid', 'Politique de confidentialité', 'Política de Privacidade'),
(80, '', NULL, 'contact', 'Contact', 'Contact', 'Contact', 'Contato'),
(81, '', NULL, 'get_seen_more_by_people_around_you_in_find_match.', 'Get seen more by people around you in find match.', 'Wordt meer gezien door mensen om je heen in een match.', 'Faites-vous plus voir par les gens autour de vous dans match de recherche.', 'Seja visto mais por pessoas ao seu redor em encontrar correspondência.'),
(82, '', NULL, 'this_service_costs_you', 'This service costs you', 'Deze service kost je', 'Ce service vous coûte', 'Este serviço custa-lhe'),
(83, '', NULL, 'credits_and_will_last_for', 'credits and will last for', 'credits en zal duren voor', 'crédits et durera pour', 'créditos e vai durar por'),
(84, '', NULL, 'miuntes', 'miuntes', 'miuntes', 'miuntes', 'miuntes'),
(85, '', NULL, 'cancel', 'Cancel', 'annuleren', 'Annuler', 'Cancelar'),
(86, '', NULL, 'boost_now', 'Boost Now', 'Boost nu', 'Boost maintenant', 'Aumente Agora'),
(87, '', NULL, 'ago', 'ago', 'geleden', 'depuis', 'atrás'),
(88, '', NULL, 'from_now', 'from now', 'vanaf nu', 'à partir de maintenant', 'a partir de agora'),
(89, '', NULL, 'any_moment_now', 'any moment now', 'elk moment nu', 'n\'importe quel moment maintenant', 'qualquer momento agora'),
(90, '', NULL, '_d_minutes_ago', '%d minutes ago', '%d minuten geleden', 'il y a %d minutes', '%d minutos atrás'),
(91, '', NULL, 'about_an_hour_ago', 'about an hour ago', 'ongeveer een uur geleden', 'il y a à peu près une heure', 'cerca de uma hora atrás'),
(92, '', NULL, '_d_hours_ago', '%d hours ago', '%d uur geleden', 'il y a %d heures', '%d horas atrás'),
(93, '', NULL, 'a_day_ago', 'a day ago', 'een dag geleden', 'il y a un jour', 'um dia atrás'),
(94, '', NULL, '_d_days_ago', '%d days ago', '%d dagen geleden', 'il y a %d jours', '%d dias atrás'),
(95, '', NULL, 'about_a_month_ago', 'about a month ago', 'ongeveer een maand geleden', 'il y a environ un mois', 'mais ou menos um mês atrás'),
(96, '', NULL, '_d_months_ago', '%d months ago', '%d maanden geleden', 'il y a %d mois', '%d meses atrás'),
(97, '', NULL, 'about_a_year_ago', 'about a year ago', 'ongeveer een jaar geleden', 'il y a un an à peu près', 'cerca de um ano atrás'),
(98, '', NULL, 'loading...', 'Loading..', 'Bezig met laden..', 'Chargement..', 'Carregando..'),
(99, '', NULL, 'payment_declined', 'Payment declined', 'Betaling geweigerd', 'Paiement refusé', 'Pagamento Recusado'),
(100, '', NULL, 'amazing', 'Amazing', 'Verbazingwekkend', 'Incroyable', 'Surpreendente'),
(101, '', NULL, 'features_you_can___t_live_without', 'features you can’t live without', 'functies waar je niet zonder kunt', 'fonctionnalités que vous ne pouvez pas vivre sans', 'recursos que você não pode viver sem'),
(102, '', NULL, 'activating_premium_will_help_you_meet_more_people__faster.', 'Activating Premium will help you meet more people, faster.', 'Door Premium te activeren, kunt u sneller meer mensen ontmoeten.', 'L\'activation de Premium vous aidera à rencontrer plus de personnes, plus rapidement.', 'A ativação do Premium ajudará você a conhecer mais pessoas com mais rapidez.'),
(103, '', NULL, 'choose_a_plan', 'Choose a Plan', 'Kies een plan', 'Choisissez un plan', 'Escolha um plano'),
(104, '', NULL, 'weekly', 'Weekly', 'Wekelijks', 'Hebdomadaire', 'Semanal'),
(105, '', NULL, 'monthly', 'Monthly', 'Maandelijks', 'Mensuel', 'Por mês'),
(106, '', NULL, 'most_popular', 'Most popular', 'Meest populair', 'Le plus populaire', 'Mais popular'),
(107, '', NULL, 'yearly', 'Yearly', 'jaar-', 'Annuel', 'Anual'),
(108, '', NULL, 'lifetime', 'Lifetime', 'Levenslang', 'Durée de vie', 'Tempo de vida'),
(109, '', NULL, 'pay_using', 'Pay Using', 'Betaal met', 'Payer en utilisant', 'Pague usando'),
(110, '', NULL, 'paypal', 'PayPal', 'PayPal', 'Pay Pal', 'PayPal'),
(111, '', NULL, 'card', 'Card', 'Kaart', 'Carte', 'Cartão'),
(112, '', NULL, 'why_choose_premium_membership', 'Why Choose Premium Membership', 'Waarom kiezen voor Premium-lidmaatschap', 'Pourquoi choisir un abonnement Premium?', 'Por que escolher uma assinatura premium?'),
(113, '', NULL, 'see_more_stickers_on_chat', 'Get more stickers in chat', 'Krijg meer stickers in de chat', 'Obtenez plus d\'autocollants dans le chat', 'Obtenha mais autocolantes no chat'),
(114, '', NULL, 'show_in_premium_bar', 'Show yourself in premium bar', 'Laat jezelf zien in premium bar', 'Montrez-vous au bar premium', 'Mostre-se na barra premium'),
(115, '', NULL, 'see_likes_notifications', 'View likes notifications', 'Bekijk leuke meldingen', 'Voir les notifications J\'aime', 'Ver notificações de gostos'),
(116, '', NULL, 'get_discount_when_buy_boost_me', 'Get a discount when using \"boost me\"', 'Krijg een korting bij het gebruik van ', 'Obtenez une réduction lorsque vous utilisez ', 'Receba um desconto ao usar '),
(117, '', NULL, 'display_first_in_find_matches', 'Display first in find matches', 'Eerst weergeven in overeenkomsten zoeken', 'Afficher en premier dans les correspondances', 'Exibir primeiro em encontrar correspondências'),
(118, '', NULL, 'display_on_top_in_random_users', 'Display on top in random users', 'Weergave bovenaan in willekeurige gebruikers', 'Afficher sur le dessus des utilisateurs aléatoires', 'Exibir no topo em usuários aleatórios'),
(119, '', NULL, 'your_popularity_', 'Your Popularity:', 'Uw populariteit:', 'Votre Popularité:', 'Sua popularidade:'),
(120, '', NULL, 'increase_your_popularity_with_credits_and_enjoy_the_features.', 'Increase your popularity with credits and enjoy the features.', 'Vergroot je populariteit met credits en geniet van de functies.', 'Augmentez votre popularité avec des crédits et profitez des fonctionnalités.', 'Aumente sua popularidade com créditos e aproveite os recursos.'),
(122, '', NULL, 'x10_visits', 'x10 Visits', 'x10 bezoeken', 'x10 visites', 'x10 visitas'),
(123, '', NULL, 'promote_your_profile_by_get_more_visits', 'Promote your profile by getting more visitors', 'Promoot je profiel door meer bezoekers te krijgen', 'Promouvoir votre profil en obtenant plus de visiteurs', 'Promova seu perfil obtendo mais visitantes'),
(124, '', NULL, 'this_service_will_cost_you', 'this service will cost you', 'deze service kost je', 'ce service vous coûtera', 'este serviço vai custar-lhe'),
(125, '', NULL, 'for', 'For', 'Voor', 'Pour', 'Para'),
(126, '', NULL, 'minutes', 'Minutes', 'Notulen', 'Minutes', 'Minutos'),
(127, '', NULL, 'buy_now', 'Buy Now', 'Koop nu', 'Acheter maintenant', 'Compre'),
(128, '', NULL, 'x3_matches', 'x3 Matches', 'x3 Wedstrijden', 'x3 matchs', 'x3 correspondências'),
(129, '', NULL, 'shown_more_and_rise_up_at_the_same_time', 'Shown more and rise up at the same time', 'Meer weergeven en op hetzelfde moment opstaan', 'Plus montré et se lever en même temps', 'Mostrado mais e se levanta ao mesmo tempo'),
(130, '', NULL, 'x4_likes', 'x4 Likes', 'x4 houdt van', 'x4 j\'aime', 'x4 gostos'),
(131, '', NULL, 'tell_everyone_you_re_online_and_be_seen_by_users_who_want_to_chat', 'Tell everyone you&#039;re online and be seen by users who want to chat', 'Vertel iedereen dat je online bent en wordt gezien door gebruikers die willen chatten', 'Dites à tout le monde que vous êtes en ligne et que les utilisateurs qui veulent chatter soient visibles', 'Diga a todos que você está on-line e seja visto por usuários que querem conversar'),
(132, '', NULL, 'visited_you', 'visited you', 'heb je bezocht', 'vous a rendu visite', 'visitou você'),
(133, '', NULL, 'your', 'Your', 'Jouw', 'Votre', 'Seu'),
(134, '', NULL, 'credits_balance', 'Credits balance', 'Creditsbalans', 'Solde des crédits', 'Saldo de créditos'),
(135, '', NULL, 'use_your_credits_to', 'Use your Credits to', 'Gebruik uw Credits om', 'Utilisez vos crédits pour', 'Use seus créditos para'),
(136, '', NULL, 'boost_your_profile', 'Boost your profile', 'Boost je profiel', 'Boostez votre profil', 'Aumente seu perfil'),
(137, '', NULL, 'send_a_gift', 'Send a gift', 'Stuur een cadeau', 'Envoyer un cadeau', 'Envie um presente'),
(138, '', NULL, 'get_seen_100x_in_discover', 'Get seen 100x in Discover', 'Word 100x gezien in Discover', 'Être vu 100x dans Discover', 'Seja visto 100 vezes no Discover'),
(139, '', NULL, 'put_yourself_first_in_search', 'Put yourself First in Search', 'Zet jezelf op de eerste plaats in zoeken', 'Mettez-vous d\'abord dans la recherche', 'Coloque-se em primeiro lugar na pesquisa'),
(140, '', NULL, 'get_additional_stickers', 'Get additional Stickers', 'Krijg extra stickers', 'Obtenir des autocollants supplémentaires', 'Get adicional Adesivos'),
(141, '', NULL, 'double_your_chances_for_a_friendship', 'Double your chances for a friendship', 'Verdubbel je kansen op een vriendschap', 'Double tes chances d\'amitié', 'Dobre suas chances de amizade'),
(142, '', NULL, 'buy_credits', 'Buy Credits', 'Koop tegoed', 'Acheter des crédits', 'Compre créditos'),
(143, '', NULL, 'bag_of_credits', 'Bag of Credits', 'Zak met Credits', 'Sac de crédits', 'Bolsa de Créditos'),
(144, '', NULL, 'box_of_credits', 'Box of Credits', 'Box of Credits', 'Boîte de crédits', 'Caixa de Créditos'),
(145, '', NULL, 'chest_of_credits', 'Chest of Credits', 'Chest of Credits', 'Coffre de crédits', 'Baú de Créditos'),
(146, '', NULL, 'year', 'year', 'jaar', 'année', 'ano'),
(147, '', NULL, 'month', 'month', 'maand', 'mois', 'mês'),
(148, '', NULL, 'day', 'day', 'dag', 'journée', 'dia'),
(149, '', NULL, 'hour', 'hour', 'uur', 'heure', 'hora'),
(150, '', NULL, 'minute', 'minute', 'minuut', 'minute', 'minuto'),
(151, '', NULL, 'second', 'second', 'tweede', 'seconde', 'segundo'),
(152, '', NULL, 'years', 'years', 'jaar', 'années', 'anos'),
(153, '', NULL, 'months', 'months', 'maanden', 'mois', 'meses'),
(154, '', NULL, 'days', 'days', 'dagen', 'journées', 'dias'),
(155, '', NULL, 'hours', 'hours', 'uur', 'heures', 'horas'),
(156, '', NULL, 'seconds', 'seconds', 'seconden', 'secondes', 'segundos'),
(157, '', NULL, 'please_enable_location_services_on_your_browser.', 'Please enable location services on your browser.', 'Schakel locatiediensten in uw browser in.', 'Veuillez activer les services de localisation sur votre navigateur.', 'Por favor, habilite os serviços de localização no seu navegador.'),
(158, '', NULL, 'change_photo', 'Change Avatar', 'Verander Avatar', 'Changer d\'avatar', 'Mudar Avatar'),
(159, '', NULL, 'upgrade', 'Upgrade', 'Upgrade', 'Améliorer', 'Atualizar'),
(160, '', NULL, 'profile_completion', 'Profile Completion', 'Profiel voltooiing', 'Achèvement du profil', 'Conclusão do perfil'),
(161, '', NULL, 'this_profile_is_verified', 'This profile is verified', 'Dit profiel is geverifieerd', 'Ce profil est vérifié', 'Este perfil é verificado'),
(162, '', NULL, 'edit', 'Edit', 'Bewerk', 'modifier', 'Editar'),
(163, '', NULL, 'views', 'Views', 'Keer bekeken', 'Des vues', 'Views'),
(164, '', NULL, 'add_photos', 'Add Photos', 'Voeg foto\'s toe', 'Ajouter des photos', 'Adicionar fotos'),
(165, '', NULL, 'interests', 'Interests', 'Interesses', 'Intérêts', 'Interesses'),
(166, '', NULL, 'profile_info', 'Profile Info', 'Profielinformatie', 'Information de profil', 'Informações do perfil'),
(167, '', NULL, 'preferred_language', 'Preferred Language', 'Voorkeurstaal', 'langue préférée', 'língua preferida'),
(168, '', NULL, 'hair_color', 'Hair color', 'Haarkleur', 'Couleur de cheveux', 'Cor de cabelo'),
(169, '', NULL, 'upload_completion', 'Upload Completion', 'Upload voltooiing', 'Achèvement du téléchargement', 'Upload Completion'),
(170, '', NULL, 'general', 'General', 'Algemeen', 'Général', 'Geral'),
(171, '', NULL, 'privacy', 'Privacy', 'Privacy', 'Intimité', 'Privacidade'),
(172, '', NULL, 'password', 'Password', 'Wachtwoord', 'Mot de passe', 'Senha'),
(173, '', NULL, 'social_links', 'Social Links', 'Sociale links', 'Liens sociaux', 'Links Sociais'),
(174, '', NULL, 'blocked_users', 'Blocked Users', 'Geblokkeerde gebruikers', 'Utilisateurs bloqués', 'Usuários bloqueados'),
(175, '', NULL, 'first_name', 'First Name', 'Voornaam', 'Prénom', 'Primeiro nome'),
(176, '', NULL, 'last_name', 'Last Name', 'Achternaam', 'Nom de famille', 'Último nome'),
(177, '', NULL, 'username', 'Username', 'Gebruikersnaam', 'Nom d\'utilisateur', 'Nome de usuário'),
(178, '', NULL, 'email', 'Email', 'E-mail', 'Email', 'O email'),
(179, '', NULL, 'choose_your_country', 'Choose your country', 'Kies je land', 'Choisis ton pays', 'Escolha seu país'),
(180, '', NULL, 'country', 'Country', 'land', 'Pays', 'País'),
(181, '', NULL, 'mobile_number', 'Phone Number', 'Telefoonnummer', 'Numéro de téléphone', 'Número de telefone'),
(182, '', NULL, 'birth_date', 'Birthday', 'Verjaardag', 'Anniversaire', 'Aniversário'),
(183, '', NULL, 'free_member', 'Free Member', 'gratis lid', 'Membre gratuit', 'Membro grátis'),
(184, '', NULL, 'pro_member', 'Pro Member', 'Pro Lid', 'Membre Pro', 'Membro Pro'),
(185, '', NULL, 'save', 'Save', 'Opslaan', 'sauvegarder', 'Salve '),
(186, '', NULL, 'about_me', 'About Me', 'Over mij', 'À propos de moi', 'Sobre mim'),
(187, '', NULL, 'relationship_status', 'Relationship status', 'Relatie status', 'Statut de la relation', 'Status de relacionamento'),
(188, '', NULL, 'work_status', 'Work status', 'Werk status', 'Statut de travail', 'Status de trabalho'),
(189, '', NULL, 'education_level', 'Education Level', 'Opleidingsniveau', 'niveau d\'éducation', 'Nível de educação'),
(190, '', NULL, 'character', 'Character', 'Karakter', 'Personnage', 'Personagem'),
(191, '', NULL, 'children', 'Children', 'Kinderen', 'Les enfants', 'Crianças'),
(192, '', NULL, 'friends', 'Friends', 'vrienden', 'copains', 'Amigos'),
(193, '', NULL, 'i_live_with', 'I live with', 'ik woon met', 'je vis avec', 'eu moro com'),
(194, '', NULL, 'car', 'Car', 'Auto', 'Voiture', 'Carro'),
(195, '', NULL, 'smoke', 'Smoke', 'Rook', 'Fumée', 'Fumaça'),
(196, '', NULL, 'drink', 'Drink', 'Drinken', 'Boisson', 'Bebida'),
(197, '', NULL, 'travel', 'Travel', 'Reizen', 'Voyage', 'Viagem'),
(198, '', NULL, 'music_genre', 'Music Genre', 'Muziek genre', 'Genre de musique', 'Gênero musical'),
(199, '', NULL, 'dish', 'Dish', 'Schotel', 'Plat', 'Prato'),
(200, '', NULL, 'song', 'Song', 'lied', 'Chanson', 'Canção'),
(201, '', NULL, 'hobby', 'Hobby', 'Hobby', 'Loisir', 'Passatempo'),
(202, '', NULL, 'city', 'City', 'stad', 'Ville', 'Cidade'),
(203, '', NULL, 'sport', 'Sport', 'Sport', 'sport', 'Esporte'),
(204, '', NULL, 'book', 'Book', 'Boek', 'Livre', 'Livro'),
(205, '', NULL, 'movie', 'Movie', 'Film', 'Film', 'Filme'),
(206, '', NULL, 'color', 'Color', 'Kleur', 'Couleur', 'Cor'),
(207, '', NULL, 'tv_show', 'TV Show', 'Tv programma', 'Émission de télévision', 'Programa de TV'),
(208, '', NULL, 'show_my_profile_on_google', 'Show my profile on search engines?', 'Toon mijn profiel op zoekmachines?', 'Afficher mon profil sur les moteurs de recherche?', 'Mostrar meu perfil nos mecanismos de pesquisa?'),
(209, '', NULL, 'show_my_profile_in_random_users', 'Show my profile in random users?', 'Toon mijn profiel in willekeurige gebruikers?', 'Afficher mon profil dans des utilisateurs aléatoires?', 'Mostrar meu perfil em usuários aleatórios?'),
(210, '', NULL, 'show_my_profile_in_match_profiles', 'Show my profile in find match page?', 'Toon mijn profiel op zoek match pagina?', 'Afficher mon profil dans la page de correspondance?', 'Mostrar meu perfil na página de correspondência?'),
(211, '', NULL, 'new_password', 'New Password', 'nieuw paswoord', 'nouveau mot de passe', 'Nova senha'),
(212, '', NULL, 'confirm_new_password', 'Confirm New Password', 'Bevestig nieuw wachtwoord', 'Confirmer le nouveau mot de passe', 'Confirme a nova senha'),
(213, '', NULL, 'change', 'Change', 'Verandering', 'Changement', 'mudança'),
(214, '', NULL, 'facebook', 'Facebook', 'Facebook', 'Facebook', 'Facebook'),
(215, '', NULL, 'twitter', 'Twitter', 'tjilpen', 'Gazouillement', 'Twitter'),
(216, '', NULL, 'google_plus', 'Google Plus', 'Google Plus', 'Google Plus', 'Google Plus'),
(217, '', NULL, 'instagrem', 'instagrem', 'instagrem', 'instagrem', 'instagrem'),
(218, '', NULL, 'linkedin', 'LinkedIn', 'LinkedIn', 'LinkedIn', 'LinkedIn'),
(219, '', NULL, 'website', 'Website', 'Website', 'Site Internet', 'Local na rede Internet'),
(220, '', NULL, 'there_is_no_blocked_user_yet.', 'There are no blocked users found.', 'Er zijn geen geblokkeerde gebruikers gevonden.', 'Aucun utilisateur bloqué n\'a été trouvé.', 'Não há usuários bloqueados encontrados.'),
(221, '', NULL, 'no_transactions_found.', 'No transactions found.', 'Geen transacties gevonden.', 'Aucune transaction trouvée.', 'Nenhuma transação encontrada.'),
(222, '', NULL, 'login', 'Login', 'Log in', 'S\'identifier', 'Entrar'),
(223, '', NULL, 'register', 'Register', 'Registreren', 'registre', 'registo'),
(224, '', NULL, 'meet_new_and_interesting_people.', 'Meet new and interesting people.', 'Ontmoet nieuwe en interessante mensen.', 'Rencontrez des personnes nouvelles et intéressantes.', 'Conheça pessoas novas e interessantes.'),
(225, '', NULL, 'join', 'Join', 'toetreden', 'Joindre', 'Junte-se'),
(226, '', NULL, 'where_you_could_meet_anyone__anywhere_', 'where you could meet anyone, anywhere!', 'waar je iemand kon ontmoeten, overal!', 'où vous pourriez rencontrer n\'importe qui, n\'importe où!', 'onde você poderia encontrar alguém, em qualquer lugar!'),
(227, '', NULL, 'get_started', 'Get Started', 'Begin', 'Commencer', 'Iniciar'),
(228, '', NULL, 'know_more', 'Know More', 'Meer weten', 'Savoir plus', 'Saber mais'),
(229, '', NULL, 'i_am_a', 'I am a', 'ik ben een', 'je suis un', 'eu sou um'),
(230, '', NULL, 'i_m_looking_for_a', 'I&#039;m looking for a', 'ik zoek een', 'je recherche un', 'eu estou procurando uma'),
(231, '', NULL, 'between_ages', 'Between ages', 'Tussen de leeftijden', 'Entre les âges', 'Entre idades'),
(232, '', NULL, 'and', 'and', 'en', 'et', 'e'),
(233, '', NULL, 'let_s_begin', 'Let&#039;s Begin', 'Laten we beginnen', 'Commençons', 'Vamos começar'),
(234, '', NULL, 'how', 'How', 'Hoe', 'Comment', 'Como'),
(235, '', NULL, 'works', 'Works', 'Werken', 'Travaux', 'Trabalho'),
(236, '', NULL, 'create_account', 'Create Account', 'Maak een account aan', 'Créer un compte', 'Criar Conta em portugues-Brasil'),
(237, '', NULL, 'register_for_free___create_up_your_good_looking_profile.', 'Register for free &amp; create up your good looking Profile.', 'Registreer gratis & amp; creëer je mooie profiel.', 'Inscrivez-vous gratuitement & amp; créez votre beau profil.', 'Inscreva-se gratuitamente e & amp; crie o seu perfil de boa aparência.'),
(238, '', NULL, 'search___connect_with_matches_which_are_perfect_for_you.', 'Search &amp; Connect with Matches which are perfect for you.', 'Zoeken & amp; Maak verbinding met overeenkomsten die perfect zijn voor jou.', 'Rechercher & amp; Connectez-vous avec des matchs qui sont parfaits pour vous.', 'Pesquisar & amp; Conecte-se com jogos que são perfeitos para você.'),
(239, '', NULL, 'start_dating', 'Start Dating', 'Begin te daten', 'Commencer à dater', 'Comece a namorar'),
(240, '', NULL, 'start_doing_conversations_and_date_your_best_match.', 'Start doing conversations and date your best match.', 'Begin met het voeren van gesprekken en date met je beste match.', 'Commencez à faire des conversations et datez votre meilleur match.', 'Comece a fazer conversas e date seu melhor par.'),
(241, '', NULL, 'users_loves_us', 'Users Loves Us', 'Gebruikers houden van ons', 'Les utilisateurs nous aiment', 'Usuários nos ama'),
(243, '', NULL, 'best_match', 'Best Match', 'Beste overeenkomst', 'Meilleure correspondance', 'Melhor partida'),
(244, '', NULL, 'based_on_your_location__we_find_best_and_suitable_matches_for_you.', 'Based on your location, we find best and suitable matches for you.', 'Op basis van uw locatie vinden we de beste en geschikte matches voor u.', 'En fonction de votre emplacement, nous trouvons les correspondances les plus appropriées pour vous.', 'Com base na sua localização, encontramos correspondências melhores e adequadas para você.'),
(245, '', NULL, 'fully_secure', 'Fully Secure', 'Volledig veilig', 'Entièrement sécurisé', 'Totalmente seguro'),
(247, '', NULL, '100__privacy', '100% Privacy', '100% privacy', '100% confidentialité', '100% de privacidade'),
(248, '', NULL, 'you_have_full_control_over_your_personal_information_that_you_share.', 'You have full control over your personal information that you share.', 'U hebt volledige controle over uw persoonlijke gegevens die u deelt.', 'Vous avez un contrôle total sur vos informations personnelles que vous partagez.', 'Você tem controle total sobre suas informações pessoais compartilhadas.'),
(250, '', NULL, 'don_t_have_an_account_', 'Don&#039;t have an account?', 'Heb je geen account?', 'Vous n\'avez pas de compte?', 'Não tem uma conta?'),
(251, '', NULL, 'welcome_back_', 'Welcome back,', 'Welkom terug,', 'Nous saluons le retour,', 'Bem vindo de volta,'),
(252, '', NULL, 'please_login_to_your_account.', 'Login to your account to continue. ', 'Log in op uw account om verder te gaan.', 'Connectez-vous à votre compte pour continuer.', 'Entre na sua conta para continuar.'),
(253, '', NULL, 'username_or_email', 'Username or Email', 'Gebruikersnaam of email', 'Nom d\'utilisateur ou email', 'Nome de usuário ou email'),
(254, '', NULL, 'forgot_password_', 'Forgot Password?', 'Wachtwoord vergeten?', 'Mot de passe oublié?', 'Esqueceu a senha?'),
(255, '', NULL, 'login_with_facebook', 'Login with Facebook', 'Inloggen met Facebook', 'Se connecter avec Facebook', 'Entrar com o Facebook'),
(256, '', NULL, 'login_with_twitter', 'Login with Twitter', 'Inloggen met Twitter', 'Se connecter avec Twitter', 'Entre com o Twitter'),
(257, '', NULL, 'login_with_google', 'Login with Google', 'Inloggen met Google', 'Connectez-vous avec Google', 'Entre com o Google'),
(258, '', NULL, 'login_with_vk', 'Login with VK', 'Inloggen met VK', 'Se connecter avec VK', 'Faça o login com VK'),
(259, '', NULL, 'already_have_an_account_', 'Already have an account?', 'Heb je al een account?', 'Vous avez déjà un compte?', 'já tem uma conta?'),
(260, '', NULL, 'password_recovery_', 'Password recovery,', 'Wachtwoord herstel,', 'Récupération de mot de passe,', 'Recuperação de senha,'),
(261, '', NULL, 'please_enter_your_registered_email_to_proceed.', 'Please enter your registered email address to proceed. ', 'Voer uw geregistreerde e-mailadres in om door te gaan.', 'Veuillez entrer votre adresse e-mail enregistrée pour continuer.', 'Por favor, digite seu endereço de e-mail cadastrado para continuar.'),
(262, '', NULL, 'proceed', 'Proceed', 'Doorgaan', 'Procéder', 'Prosseguir'),
(263, '', NULL, 'contact_us', 'Contact Us', 'Neem contact met ons op', 'Contactez nous', 'Contate-Nos'),
(264, '', NULL, 'how_can_we_help_', 'How can we help?', 'Hoe kunnen we helpen?', 'Comment pouvons nous aider?', 'Como podemos ajudar?'),
(265, '', NULL, 'send', 'Send', 'Sturen', 'Envoyer', 'Mandar'),
(266, '', NULL, 'terms_of_use', 'Terms of use', 'Gebruiksvoorwaarden', 'Conditions d\'utilisation', 'Termos de uso'),
(267, '', NULL, 'get_started_', 'Get started,', 'Begin,', 'Commencer,', 'Iniciar,'),
(268, '', NULL, 'please_signup_to_continue_your_account.', 'Sign up to get started finding your partner!', 'Meld je aan om aan de slag te gaan met het vinden van je partner!', 'Inscrivez-vous pour commencer à trouver votre partenaire!', 'Inscreva-se para começar a encontrar seu parceiro!'),
(269, '', NULL, 'confirm_password', 'Confirm Password', 'bevestig wachtwoord', 'Confirmez le mot de passe', 'Confirme a Senha'),
(270, '', NULL, 'people_who_are_interested_in__', 'People who are interested in:', 'Mensen die geïnteresseerd zijn in:', 'Les personnes intéressées par:', 'Pessoas que estão interessadas em:'),
(271, '', NULL, 'no_interested_people_found.', 'No interested people found.', 'Geen geïnteresseerde mensen gevonden.', 'Aucune personne intéressée trouvée.', 'Nenhuma pessoa interessada encontrou.'),
(272, '', NULL, 'like', 'Like', 'Net zoals', 'Comme', 'Gostar'),
(273, '', NULL, 'dislike', 'Dislike', 'Afkeer', 'Ne pas aimer', 'Antipatia'),
(274, '', NULL, 'disliked', 'Disliked', 'bevallen', 'N\'a pas aimé', 'Não gostei'),
(275, '', NULL, 'you_disliked', 'you disliked', 'je had een hekel aan', 'tu n\'aimais pas', 'você não gostou'),
(276, '', NULL, 'delete_account', 'Delete Account', 'Account verwijderen', 'Supprimer le compte', 'Deletar conta'),
(277, '', NULL, 'liked', 'Liked', 'vond', 'Aimé', 'Gostei'),
(278, '', NULL, 'you_liked', 'you liked', 'jij hield van', 'tu as aimé', 'você gostou'),
(279, '', NULL, 'message', 'Message', 'Bericht', 'Message', 'mensagem'),
(280, '', NULL, 'report_user.', 'Report user.', 'Rapporteer gebruiker.', 'Dénoncer un utilisateur.', 'Reportar usuário.'),
(281, '', NULL, 'type_here_why_you_want_to_report_this_user.', 'Please let us know why you want to report this person.', 'Laat ons weten waarom je deze persoon wilt melden.', 'S\'il vous plaît laissez-nous savoir pourquoi vous souhaitez signaler cette personne.', 'Por favor, deixe-nos saber por que você deseja denunciar essa pessoa.'),
(282, '', NULL, 'report', 'Report', 'Verslag doen van', 'rapport', 'Relatório'),
(283, '', NULL, 'send_gift_costs_', 'Send gift costs', 'Verzend geschenkkosten', 'Envoyer les frais de cadeau', 'Envie os custos do presente'),
(284, '', NULL, 'chat', 'Chat', 'babbelen', 'Bavarder', 'Bate-papo'),
(285, '', NULL, 'you_have_reached_your_daily_limit', 'You have reached your daily limit', 'Je hebt je dagelijkse limiet bereikt', 'Vous avez atteint votre limite quotidienne', 'Você atingiu seu limite diário'),
(286, '', NULL, 'you_can_chat_to_new_people_after', 'you can chat to new people after', 'je kunt na afloop chatten met nieuwe mensen', 'vous pouvez discuter avec de nouvelles personnes après', 'você pode conversar com novas pessoas depois'),
(287, '', NULL, 'can_t_wait__this_service_costs_you', 'can&#039;t wait? this service costs you', 'kan niet wachten? deze service kost je', 'ne peut pas attendre? ce service vous coûte', 'não pode esperar este serviço custa você'),
(288, '', NULL, 'likes_you', 'likes you', 'vind je leuk', 't\'aime bien', 'gosta de você'),
(289, '', NULL, 'this_profile_is_not_verified', 'This profile is not verified yet', 'Dit profiel is nog niet geverifieerd', 'Ce profil n\'a pas encore été vérifié', 'Este perfil ainda não foi verificado'),
(290, '', NULL, 'block_user', 'Block', 'Blok', 'Bloc', 'Quadra'),
(291, '', NULL, 'report_user', 'Report', 'Verslag doen van', 'rapport', 'Relatório'),
(292, '', NULL, 'buy_now.', 'Buy Now.', 'Koop nu.', 'Acheter maintenant.', 'Compre.'),
(293, '', NULL, 'low', 'Low', 'Laag', 'Faible', 'Baixo'),
(294, '', NULL, 'matched_you', 'matched you', 'matched jou', 'vous correspondait', 'combinou com você'),
(295, '', NULL, 'user__1', 'User #1', 'Gebruiker # 1', 'Utilisateur n ° 1', 'Utilizador # 1'),
(297, '', NULL, 'user__2', 'User #2', 'Gebruiker # 2', 'Utilisateur n ° 2', 'Utilizador # 2'),
(298, '', NULL, 'user__3', 'User #3', 'Gebruiker # 3', 'Utilisateur n ° 3', 'Utilizador # 3'),
(299, '', NULL, 'user__4', 'User #4', 'Gebruiker # 4', 'Utilisateur n ° 4', 'Utilizador # 4'),
(308, '', NULL, 'unread_messages', 'Unread Messages', 'ongelezen berichten', 'Messages non lus', 'Mensagens não lidas'),
(309, '', NULL, 'there_is_no_new_notifications.', 'There are no new notifications', 'Er zijn geen nieuwe meldingen', 'Il n\'y a pas de nouvelles notifications', 'Não há novas notificações'),
(310, '', NULL, '183_cm__6__039__0__', '183 cm (6 \'0\')', '183 cm (6 \'0\')', '183 cm (6 \'0\')', '183 cm (6 \'0\')'),
(311, '', NULL, '184_cm', '184 cm', '184 cm', '184 cm', '184 cm'),
(312, '', NULL, '180_cm__5__039__11__', '180 cm (5 \'11\')', '180 cm (5 \'11\')', '180 cm (5 \'11 ', '180 cm (5 \'11\')'),
(313, '', NULL, 'wanna_get_more__get_premium__or_get_new_stickers_for', 'Wanna get more? get premium! OR get new stickers for', 'Wil je meer krijgen? krijg premie! OF krijg nieuwe stickers voor', 'Tu veux en avoir plus? obtenir des primes! OU obtenez de nouveaux autocollants pour', 'Queres mais? obtenha prémio! OU obtenha novos adesivos para'),
(314, '', NULL, 'get_premium', 'Get premium', 'Krijg premium', 'Obtenir des primes', 'Receba premium'),
(315, '', NULL, 'buy_now_', 'Buy Now!', 'Koop nu!', 'Acheter maintenant!', 'Compre!'),
(316, '', NULL, 'liked_you', 'liked you', 'vond je leuk', 'aimé vous', 'gostei de você'),
(317, '', NULL, 'arabic', 'Arabic', 'Arabisch', 'arabe', 'árabe'),
(318, '', NULL, 'dutch', 'Dutch', 'Nederlands', 'néerlandais', 'holandês'),
(319, '', NULL, 'french', 'French', 'Frans', 'français', 'francês'),
(320, '', NULL, 'german', 'German', 'Duitse', 'allemand', 'alemão'),
(321, '', NULL, 'italian', 'Italian', 'Italiaans', 'italien', 'italiano'),
(322, '', NULL, 'portuguese', 'Portuguese', 'Portugees', 'Portugais', 'Português'),
(323, '', NULL, 'russian', 'Russian', 'Russisch', 'russe', 'russo'),
(324, '', NULL, 'spanish', 'Spanish', 'Spaans', 'Espanol', 'espanhol'),
(325, '', NULL, 'turkish', 'Turkish', 'Turks', 'turc', 'turco'),
(405, '', NULL, 'brown', 'Brown', 'Bruin', 'marron', 'Castanho'),
(406, '', NULL, 'black', 'Black', 'Zwart', 'Noir', 'Preto'),
(407, '', NULL, 'gray_or_partially_gray', 'Gray or Partially Gray', 'Grijs of gedeeltelijk grijs', 'Gris ou partiellement gris', 'Cinza ou parcialmente cinza'),
(408, '', NULL, 'red_auburn', 'Red/Auburn', 'Rood / Auburn', 'Rouge / Auburn', 'Vermelho / castanho-avermelhado'),
(409, '', NULL, 'blond_strawberry', 'Blond/Strawberry', 'Blond / aardbei', 'Blond / Fraise', 'Loiro / Morango'),
(410, '', NULL, 'blue', 'Blue', 'Blauw', 'Bleu', 'Azul'),
(411, '', NULL, 'green', 'Green', 'Groen', 'vert', 'Verde'),
(412, '', NULL, 'orange', 'Orange', 'Oranje', 'Orange', 'laranja'),
(413, '', NULL, 'pink', 'Pink', 'Roze', 'Rose', 'Rosa'),
(414, '', NULL, 'purple', 'Purple', 'Purper', 'Violet', 'Roxa'),
(415, '', NULL, 'partly_or_completely_bald', 'Partly or Completely Bald', 'Gedeeltelijk of volledig kaal', 'Partiellement ou complètement chauve', 'Parcial ou Completamente Careca'),
(416, '', NULL, 'other', 'Other', 'anders', 'Autre', 'De outros'),
(417, '', NULL, 'single', 'Single', 'single', 'Unique', 'solteiro'),
(418, '', NULL, 'married', 'Married', 'Getrouwd', 'Marié', 'Casado'),
(419, '', NULL, 'i_m_studying', 'I&#039;m studying', 'ik ben aan het studeren', 'j\'étudie', 'Estou estudando'),
(420, '', NULL, 'i_m_working', 'I&#039;m working', 'ik ben aan het werk', 'je travaille', 'estou trabalhando'),
(421, '', NULL, 'i_m_looking_for_work', 'I&#039;m looking for work', 'ik zoek naar werk', 'je cherche du travail', 'Estou procurando trabalho'),
(422, '', NULL, 'i_m_retired', 'I&#039;m retired', 'ik ben met pensioen', 'Je suis à la retraite', 'estou aposentado'),
(423, '', NULL, 'self-employed', 'Self-Employed', 'Eigen baas', 'Travailleur indépendant', 'Trabalhadores por conta própria'),
(424, '', NULL, 'secondary_school', 'Secondary school', 'Middelbare school', 'École secondaire', 'Ensino Médio'),
(425, '', NULL, 'iti', 'ITI', 'ITI', 'ITI', 'ITI'),
(426, '', NULL, 'college', 'College', 'College', 'Université', 'Faculdade'),
(427, '', NULL, 'university', 'University', 'Universiteit', 'Université', 'Universidade'),
(428, '', NULL, 'advanced_degree', 'Advanced degree', 'Geavanceerde graad', 'Degré avancé', 'Grau avançado'),
(429, '', NULL, 'middle_eastern', 'Middle Eastern', 'Midden Oosten', 'Moyen-orientale', 'Oriente médio'),
(430, '', NULL, 'north_african', 'North African', 'Noord-Afrikaans', 'Nord-africain', 'Norte-africano'),
(431, '', NULL, 'latin_american', 'Latin American', 'Latijns-Amerikaans', 'latino-américain', 'latino Americano'),
(432, '', NULL, 'mixed', 'Mixed', 'Gemengd', 'Mixte', 'Misturado'),
(433, '', NULL, 'asian', 'Asian', 'Aziatisch', 'asiatique', 'Asiáticos'),
(434, '', NULL, 'slim', 'Slim', 'Slank', 'Svelte', 'Magro'),
(435, '', NULL, 'sporty', 'Sporty', 'sportieve', 'Sportif', 'Desportivo'),
(436, '', NULL, 'curvy', 'Curvy', 'curvy', 'Courbée', 'Curvy'),
(437, '', NULL, 'round', 'Round', 'Ronde', 'Rond', 'Volta'),
(438, '', NULL, 'supermodel', 'Supermodel', 'Supermodel', 'Supermodel', 'Supermodelo'),
(439, '', NULL, 'average', 'Average', 'Gemiddelde', 'Moyenne', 'Média'),
(440, '', NULL, 'accommodating', 'Accommodating', 'Meegaand', 'Accommodant', 'Acomodando'),
(441, '', NULL, 'adventurous', 'Adventurous', 'Avontuurlijk', 'Aventureux', 'Aventureiro'),
(442, '', NULL, 'calm', 'Calm', 'Kalmte', 'Calme', 'calma'),
(443, '', NULL, 'careless', 'Careless', 'zorgeloos', 'Négligent', 'Descuidado'),
(444, '', NULL, 'cheerful', 'Cheerful', 'Vrolijk', 'De bonne humeur', 'Alegre'),
(445, '', NULL, 'demanding', 'Demanding', 'veeleisende', 'Exigeant', 'Exigente'),
(446, '', NULL, 'extroverted', 'Extroverted', 'extroverted', 'Extraverti', 'Extrovertido'),
(447, '', NULL, 'honest', 'Honest', 'Eerlijk', 'Honnête', 'Honesto'),
(448, '', NULL, 'generous', 'Generous', 'genereus', 'généreuse', 'Generoso'),
(449, '', NULL, 'humorous', 'Humorous', 'Humoristisch', 'Humoristique', 'Cómico'),
(450, '', NULL, 'introverted', 'Introverted', 'Introvert', 'Introverti', 'Introvertido'),
(451, '', NULL, 'liberal', 'Liberal', 'Liberaal', 'Libéral', 'Liberal'),
(452, '', NULL, 'lively', 'Lively', 'levendig', 'Animé', 'Animada'),
(453, '', NULL, 'loner', 'Loner', 'eenzame', 'Solitaire', 'Solitário'),
(454, '', NULL, 'nervous', 'Nervous', 'Nerveus', 'Nerveux', 'Nervoso'),
(455, '', NULL, 'possessive', 'Possessive', 'bezittelijk', 'Possessif', 'Possessivo'),
(456, '', NULL, 'quiet', 'Quiet', 'Stil', 'Silencieux', 'Quieto'),
(457, '', NULL, 'reserved', 'Reserved', 'Gereserveerd', 'Réservé', 'Reservado'),
(458, '', NULL, 'sensitive', 'Sensitive', 'Gevoelig', 'Sensible', 'Sensível'),
(459, '', NULL, 'shy', 'Shy', 'Verlegen', 'Timide', 'Tímido'),
(460, '', NULL, 'social', 'Social', 'sociaal', 'Social', 'Social'),
(461, '', NULL, 'spontaneous', 'Spontaneous', 'Spontaan', 'Spontané', 'Espontâneo'),
(462, '', NULL, 'stubborn', 'Stubborn', 'Eigenwijs', 'Têtu', 'Teimoso'),
(463, '', NULL, 'suspicious', 'Suspicious', 'Verdacht', 'Méfiant', 'Suspeito'),
(464, '', NULL, 'thoughtful', 'Thoughtful', 'nadenkend', 'Réfléchi', 'Pensativo'),
(465, '', NULL, 'proud', 'Proud', 'Trots', 'Fier', 'Orgulhoso'),
(466, '', NULL, 'considerate', 'Considerate', 'Attent', 'Prévenant', 'Atencioso'),
(467, '', NULL, 'friendly', 'Friendly', 'Vriendelijk', 'Amical', 'Amigáveis'),
(468, '', NULL, 'polite', 'Polite', 'Beleefd', 'Poli', 'Educado'),
(469, '', NULL, 'reliable', 'Reliable', 'Betrouwbaar', 'Fiable', 'Confiável'),
(470, '', NULL, 'careful', 'Careful', 'Voorzichtig', 'Prudent', 'Cuidado'),
(471, '', NULL, 'helpful', 'Helpful', 'Nuttig', 'Utile', 'Útil'),
(472, '', NULL, 'patient', 'Patient', 'Geduldig', 'Patient', 'Paciente'),
(473, '', NULL, 'optimistic', 'Optimistic', 'Optimistisch', 'Optimiste', 'Otimista'),
(474, '', NULL, 'no__never', 'No, never', 'Nee nooit', 'Non jamais', 'Não nunca'),
(475, '', NULL, 'someday__maybe', 'Someday, maybe', 'Ooit misschien', 'Un jour peut-être', 'Algum dia talvez'),
(476, '', NULL, 'expecting', 'Expecting', 'Ervan uitgaand', 'Attendant', 'Esperando'),
(477, '', NULL, 'i_already_have_kids', 'I already have kids', 'Ik heb al kinderen', 'J\'ai déjà des enfants', 'Eu já tenho filhos'),
(478, '', NULL, 'i_have_kids_and_don_t_want_more', 'I have kids and don&#039;t want more', 'Ik heb kinderen en wil niet meer', 'J\'ai des enfants et je ne veux plus', 'Eu tenho filhos e não quero mais'),
(479, '', NULL, 'no_friends', 'No friends', 'Geen vrienden', 'Pas d\'amis', 'Sem amigos'),
(480, '', NULL, 'some_friends', 'Some friends', 'Een paar vrienden', 'Quelques amis', 'Alguns amigos'),
(481, '', NULL, 'many_friends', 'Many friends', 'Veel vrienden', 'Beaucoup d\'amis', 'Muitos amigos'),
(482, '', NULL, 'only_good_friends', 'Only good friends', 'Alleen goede vrienden', 'Seulement de bons amis', 'Apenas bons amigos'),
(483, '', NULL, 'none', 'None', 'Geen', 'Aucun', 'Nenhum'),
(484, '', NULL, 'have_pets', 'Have pets', 'Huisdieren hebben', 'Avoir des animaux de compagnies', 'Tenha animais de estimação'),
(485, '', NULL, 'alone', 'Alone', 'Alleen', 'Seul', 'Sozinho'),
(486, '', NULL, 'parents', 'Parents', 'Ouders', 'Parents', 'Pais'),
(487, '', NULL, 'partner', 'Partner', 'Partner', 'Partenaire', 'Parceiro'),
(488, '', NULL, 'my_own_car', 'My own car', 'Mijn eigen auto', 'Ma propre voiture', 'Meu próprio carro'),
(489, '', NULL, 'muslim', 'Muslim', 'moslim', 'musulman', 'muçulmano'),
(490, '', NULL, 'atheist', 'Atheist', 'Atheïst', 'Athée', 'Ateu'),
(491, '', NULL, 'buddhist', 'Buddhist', 'Boeddhist', 'bouddhiste', 'budista'),
(492, '', NULL, 'catholic', 'Catholic', 'Katholiek', 'catholique', 'católico'),
(493, '', NULL, 'christian', 'Christian', 'Christelijk', 'Christian', 'cristão'),
(494, '', NULL, 'hindu', 'Hindu', 'Hindoe', 'hindou', 'hindu'),
(495, '', NULL, 'jewish', 'Jewish', 'Jewish', 'juif', 'judaico'),
(496, '', NULL, 'agnostic', 'Agnostic', 'Agnostisch', 'Agnostique', 'Agnóstico'),
(497, '', NULL, 'sikh', 'Sikh', 'Sikh', 'Sikh', 'Sikh'),
(498, '', NULL, 'never', 'Never', 'Nooit', 'Jamais', 'Nunca'),
(499, '', NULL, 'i_smoke_sometimes', 'I smoke sometimes', 'Ik rook soms', 'Je fume parfois', 'Eu fumo às vezes'),
(500, '', NULL, 'chain_smoker', 'Chain Smoker', 'Kettingroker', 'Chaîne fumeur', 'Fumante De Corrente'),
(501, '', NULL, 'i_drink_sometimes', 'I drink sometimes', 'Ik drink soms', 'Je bois parfois', 'Eu bebo as vezes'),
(502, '', NULL, 'yes__all_the_time', 'Yes, all the time', 'Ja altijd', 'Oui tout le temps', 'Sim o tempo todo'),
(503, '', NULL, 'yes__sometimes', 'Yes, sometimes', 'Ja soms', 'Oui, parfois', 'Sim as vezes'),
(504, '', NULL, 'not_very_much', 'Not very much', 'Niet heel erg', 'Pas beaucoup', 'Não muito'),
(505, '', NULL, 'no', 'No', 'Nee', 'Non', 'Não'),
(507, '', NULL, 'avatar', 'Avatar', 'avatar', 'Avatar', 'Avatar'),
(508, '', NULL, 'info', 'Info', 'info', 'Info', 'Info'),
(509, '', NULL, 'finish', 'Finish', 'Af hebben', 'terminer', 'Terminar'),
(510, '', NULL, 'people_want_to_see_what_you_look_like_', 'people want to see what you look like!', 'mensen willen zien hoe je eruit ziet!', 'les gens veulent voir à quoi vous ressemblez!', 'as pessoas querem ver como você é!'),
(511, '', NULL, 'upload_images_to_set_your_profile_picture_image.', 'Upload photos to set your profile picture.', 'Upload foto\'s om uw profielfoto in te stellen.', 'Téléchargez des photos pour définir votre photo de profil.', 'Envie fotos para definir sua foto de perfil.'),
(512, '', NULL, 'next', 'Next', 'volgende', 'Suivant', 'Próximo'),
(513, '', NULL, 'birthdate', 'Birthday', 'Geboortedatum', 'Anniversaire', 'Aniversário'),
(514, '', NULL, 'congratulations_', 'Congratulations!', 'Gefeliciteerd!', 'Toutes nos félicitations!', 'Parabéns!'),
(515, '', NULL, 'you_have_successfully_registered.', 'You have successfully created your account, please wait..', 'Je bent succesvol geregistreerd.', 'Vous avez créé votre compte avec succès, veuillez patienter ..', 'Você criou sua conta com sucesso, aguarde ..'),
(516, '', NULL, 'images_uploaded', 'Photos successfully uploaded.', 'Afbeeldingen geüpload', 'Photos téléchargées avec succès.', 'Fotos carregadas com sucesso.'),
(517, '', NULL, 'now__select_any_one_image_that_you_want_to_set_as_your_profile_picture.', 'Now, choose which image you would like to be your avatar.', 'Selecteer nu een afbeelding die u wilt instellen als uw profielfoto.', 'Maintenant, choisissez quelle image vous voulez être votre avatar.', 'Agora, escolha qual imagem você gostaria de ser seu avatar.'),
(518, '', NULL, 'apply', 'Apply', 'Van toepassing zijn', 'Appliquer', 'Aplique'),
(519, '', NULL, 'please_verify_your_phone_number', 'Please verify your phone number.', 'Verifieer uw telefoonnummer', 'Veuillez vérifier votre numéro de téléphone.', 'Por favor, verifique o seu número de telefone.'),
(520, '', NULL, 'verify_now', 'verify now', 'nu verifiëren', 'Vérifiez maintenant', 'Verifique agora'),
(522, '', NULL, 'user', 'User', 'Gebruiker', 'Utilisateur', 'Do utilizador'),
(523, '', NULL, 'admin', 'Admin', 'beheerder', 'Admin', 'Admin'),
(524, '', NULL, 'unreport', 'Delete report', 'UnReport', 'Annuler le rapport', 'Excluir relatório'),
(525, '', NULL, 'user_has_been_reported_successfully.', 'Your report has been record, thank you.', 'Gebruiker is succesvol gemeld.', 'L\'utilisateur a été signalé avec succès.', 'Seu relatório foi gravado, obrigado.'),
(526, '', NULL, 'remove_report', 'Remove report', 'Verwijder rapport', 'Supprimer le rapport', 'Remover relatório'),
(527, '', NULL, 'sent_image_to_you.', 'sent an image to you.', 'Verzonden afbeelding naar jou.', 'Image envoyée à vous.', 'Imagem enviada para você.'),
(528, '', NULL, 'very_high', 'Very high', 'Heel hoog', 'Très haut', 'Muito alto'),
(529, '', NULL, 'high', 'High', 'hoog', 'Haute', 'Alto'),
(530, '', NULL, '180_cm__5__039__11_quot__', '180 cm (5&#039; 11&amp;quot;)', '180 cm (5 \'11 & amp; quot;)', '180 cm (5 \'11 & quot;)', '180 cm (5 \'11 & amp; quot)'),
(531, '', NULL, 'get_premium_to_view_who_liked_you_', 'Get premium to view who liked you!', 'Krijg premie om te zien wie jou leuk vond!', 'Obtenez premium pour voir qui vous a aimé!', 'Obtenha premium para ver quem gostou de você!'),
(532, '', NULL, '__sitename___brings_out_the_sense_of_adventure_in_me__the_website_is_so_easy_to_use_and_the_possibility_of_meeting_someone_from_another_culture_that_r', '{{sitename}} brings out the sense of adventure in me! The website is so easy to use and the possibility of meeting someone from another culture that relates to me is simply thrilling.', '{{sitename}} brengt het gevoel van avontuur in mij naar boven! De website is zo gemakkelijk te gebruiken en de mogelijkheid om iemand uit een andere cultuur te ontmoeten die op mij betrekking heeft, is gewoon opwindend.', '{{sitename}} fait ressortir le sens de l\'aventure en moi! Le site Web est si facile à utiliser et la possibilité de rencontrer quelqu\'un d\'une autre culture qui me concerne est tout simplement excitante.', '{{sitename}} traz a sensação de aventura em mim! O site é tão fácil de usar e a possibilidade de conhecer alguém de outra cultura que se relaciona comigo é simplesmente emocionante.'),
(533, '', NULL, 'why___sitename___is_best', 'Why {{sitename}} is Best', 'Waarom {{sitename}} het beste is', 'Pourquoi {{sitename}} est le meilleur', 'Por que {{sitename}} é melhor'),
(534, '', NULL, 'your_account_is_safe_on___sitename__._we_never_share_your_data_with_third_party.', 'Your account is Safe on {{sitename}}. We never share your data with third party.', 'Uw account is veilig op {{sitename}}. Wij delen uw gegevens nooit met derden.', 'Votre compte est en sécurité sur {{sitename}}. Nous ne partageons jamais vos données avec des tiers.', 'Sua conta é segura em {{sitename}}. Nós nunca compartilhamos seus dados com terceiros.'),
(535, '', NULL, 'connect_with_your_perfect_soulmate_here__on___sitename__.', 'Connect with your perfect Soulmate here, on {{sitename}}.', 'Maak hier verbinding met je perfecte Soulmate, op {{sitename}}.', 'Connectez-vous avec votre âme sœur parfaite ici, le {{sitename}}.', 'Conecte-se com seu Soulmate perfeito aqui, em {{sitename}}.'),
(539, '', NULL, '142_cm__4__039__8_quot__', '142 cm (4&#039; 8&amp;quot;)', '142 cm (4 \'8 & amp; quot;)', '142 cm (4 \'8 & quot;)', '142 cm (4 \'8 & amp; quot)'),
(588, '', NULL, 'users', 'users', 'gebruikers', 'utilisateurs', 'Comercial'),
(590, '', NULL, 'login_with_wowonder', 'Login with Wowonder', 'Log in met Wowonder', 'Se connecter avec Wowonder', 'Entrar com o Wowonder'),
(592, '', NULL, 'meet_more_people_with___sitename___credits', 'Meet more People with {{sitename}} Credits', 'Ontmoet meer mensen met {{sitename}} Credits', 'Rencontrer plus de personnes avec des {{sitename}} crédits', 'Conheça mais Pessoas com {{sitename}} Créditos');
INSERT INTO `langs` (`id`, `ref`, `options`, `lang_key`, `english`, `dutch`, `french`, `portuguese`) VALUES
(595, '', NULL, 'meet_more_people_with___sitename___credits.', 'Meet more People with {{sitename}} Credits.', 'Ontmoet meer mensen met {{sitename}} Credits.', 'Rencontrez plus de personnes avec des {{sitename}} crédits.', 'Conheça mais Pessoas com Créditos de {{sitename}}.'),
(598, '', NULL, 'hack_attempt.', 'Hack attempt.', 'Hackpoging.', 'Tentative de piratage.', 'Tentativa de hack.'),
(599, '', NULL, 'forbidden', 'Forbidden', 'Verboden', 'Interdit', 'Proibido'),
(600, '', NULL, 'no_from_id_found.', 'No from id found.', 'Geen van id gevonden.', 'Aucun identifiant trouvé.', 'Não do id encontrado.'),
(601, '', NULL, 'please_recharge_your_credits.', 'please recharge your credits.', 'laad alsjeblieft je credits op.', 'veuillez recharger vos crédits.', 'por favor, recarregue seus créditos.'),
(602, '', NULL, 'message_sent', 'Message sent', 'Bericht verzonden', 'Message envoyé', 'Mensagem enviada'),
(603, '', NULL, 'bad_request', 'Bad Request', 'Foutief verzoek', 'Mauvaise Demande', 'Pedido ruim'),
(604, '', NULL, 'no_user_id_found.', 'No user ID found.', 'Geen gebruikers-ID gevonden.', 'Aucun ID utilisateur trouvé.', 'Nenhum ID de usuário encontrado.'),
(605, '', NULL, 'no_credit_available.', 'No credit available.', 'Geen tegoed beschikbaar.', 'Aucun crédit disponible.', 'Nenhum crédito disponível.'),
(606, '', NULL, 'user_buy_stickers_successfully.', 'User buy stickers successfully.', 'Gebruiker koopt stickers met succes.', 'Utilisateur acheter des autocollants avec succès.', 'O usuário compra adesivos com sucesso.'),
(607, '', NULL, 'error_while_save_like.', 'Error while save like.', 'Fout tijdens opslaan zoals.', 'Erreur lors de la sauvegarde comme.', 'Erro enquanto salvar como.'),
(608, '', NULL, 'no_chat_user_id_found.', 'No chat user ID found.', 'Geen chat-gebruikers-ID gevonden.', 'Aucun ID utilisateur de chat trouvé.', 'Nenhum ID de usuário de bate-papo encontrado.'),
(609, '', NULL, 'user_buy_new_chat_successfully.', 'User buy new chat successfully.', 'Gebruiker koopt nieuwe chat met succes.', 'L\'utilisateur achète un nouveau chat avec succès.', 'O usuário compra um novo bate-papo com sucesso.'),
(610, '', NULL, 'error_while_buy_more_chat_credit.', 'Error while buy more chat credit.', 'Fout bij het kopen van meer chatkrediet.', 'Erreur lors de l\'achat de plus de crédit de discussion.', 'Erro ao comprar mais créditos de bate-papo.'),
(611, '', NULL, 'no_page_number_found.', 'no page number found.', 'geen paginanummer gevonden.', 'aucun numéro de page trouvé.', 'Nenhum número de página encontrado.'),
(612, '', NULL, 'no_content', 'No Content', 'Geen inhoud', 'Pas content', 'Nenhum conteúdo'),
(613, '', NULL, 'no_amount_passed', 'No amount passed', 'Er is geen bedrag verstreken', 'Aucun montant passé', 'Nenhuma quantia passada'),
(614, '', NULL, 'amount_is_not_number', 'Amount is not number', 'Bedrag is geen nummer', 'Le montant n\'est pas un nombre', 'Quantidade não é número'),
(615, '', NULL, 'no_description_passed', 'No description passed', 'Er is geen beschrijving opgegeven', 'Aucune description transmise', 'Nenhuma descrição passada'),
(616, '', NULL, 'there_is_no_mode_set_for_this_call', 'There is no mode set for this call', 'Er is geen modus ingesteld voor deze oproep', 'Il n\'y a pas de mode défini pour cet appel', 'Não há modo definido para esta chamada'),
(617, '', NULL, 'link_generated_successfully', 'Link generated successfully', 'Link met succes gegenereerd', 'Lien généré avec succès', 'Link gerado com sucesso'),
(618, '', NULL, 'transaction_user_not_match_current_active_user', 'Transaction user not match current active user', 'Transactie gebruiker komt niet overeen met huidige actieve gebruiker', 'L\'opérateur de transaction ne correspond pas à l\'utilisateur actif actuel', 'Usuário da transação não corresponde ao usuário ativo atual'),
(619, '', NULL, 'error_while_update_balance_after_charging', 'Error While update balance after charging', 'Fout Tijdens update-balans na opladen', 'Erreur lors de la mise à jour de la balance après le chargement', 'Erro ao atualizar o saldo após o carregamento'),
(620, '', NULL, 'missing__url__parameter.', 'Missing `url` parameter.', 'Ontbrekende parameter `url`.', 'Paramètre `url` manquant.', 'Parâmetro '),
(621, '', NULL, 'you_can_not_delete_your_profile_image__but_you_can_change_it_first.', 'You can not delete your profile image, but you can change it first.', 'U kunt uw profielafbeelding niet verwijderen, maar u kunt deze eerst wijzigen.', 'Vous ne pouvez pas supprimer votre image de profil, mais vous pouvez d\'abord la modifier.', 'Você não pode excluir sua imagem de perfil, mas pode alterá-la primeiro.'),
(622, '', NULL, 'file_deleted_successfully', 'File deleted successfully', 'Bestand met succes verwijderd', 'Fichier supprimé avec succès', 'Arquivo excluído com sucesso'),
(623, '', NULL, 'you_can_not_use_more_than_30_character_for_first_name.', 'you can not use more than 30 character for first name.', 'je kunt niet meer dan 30 tekens gebruiken voor voornaam.', 'vous ne pouvez pas utiliser plus de 30 caractères pour le prénom.', 'você não pode usar mais de 30 caracteres para o primeiro nome.'),
(624, '', NULL, 'you_can_not_use_more_than_30_character_for_last_name.', 'you can not use more than 30 character for last name.', 'je kunt niet meer dan 30 tekens gebruiken voor de achternaam.', 'vous ne pouvez pas utiliser plus de 30 caractères pour le nom de famille.', 'você não pode usar mais de 30 caracteres para o sobrenome.'),
(625, '', NULL, 'this_user_name_is_already_exist.', 'This User name is Already exist.', 'Deze gebruikersnaam bestaat al.', 'Ce nom d\'utilisateur est déjà existant.', 'Este nome de usuário já existe.'),
(626, '', NULL, 'this_user_name_is_reserved_word._please_choose_anther_username.', 'This User name is reserved word. please choose anther username.', 'Deze gebruikersnaam is gereserveerd woord. kies alstublieft de anther-gebruikersnaam.', 'Ce nom d\'utilisateur est un mot réservé. veuillez choisir un autre nom d\'utilisateur.', 'Este nome de usuário é uma palavra reservada. Por favor, escolha anher username.'),
(627, '', NULL, 'empty_user_name.', 'empty user name.', 'lege gebruikersnaam.', 'Nom d\'utilisateur vide.', 'nome de usuário vazio.'),
(628, '', NULL, 'this_e-mail_is_invalid.', 'This e-mail is invalid.', 'Deze email is ongeldig.', 'Cette adresse email est invalide.', 'Este email é inválido.'),
(629, '', NULL, 'this_email_is_already_exist.', 'This email is Already exist.', 'Deze e-mail bestaat al.', 'Cet email existe déjà.', 'Este email já existe.'),
(630, '', NULL, 'profile_general_data_saved_successfully.', 'Profile general data saved successfully.', 'Profiel algemene gegevens succesvol opgeslagen.', 'Les données générales du profil ont été enregistrées avec succès.', 'Dados gerais do perfil salvos com sucesso.'),
(631, '', NULL, 'error_while_saving_general_profile_settings.', 'Error while saving general profile settings.', 'Fout tijdens het opslaan van algemene profielinstellingen.', 'Erreur lors de l\'enregistrement des paramètres de profil généraux.', 'Erro ao salvar as configurações gerais do perfil.'),
(632, '', NULL, 'profile_data_saved_successfully.', 'Profile data saved successfully.', 'Profielgegevens zijn succesvol opgeslagen.', 'Les données de profil ont été enregistrées avec succès.', 'Dados do perfil salvos com sucesso.'),
(633, '', NULL, 'error_while_saving_profile_settings.', 'Error while saving profile settings.', 'Fout tijdens het opslaan van profielinstellingen.', 'Erreur lors de l\'enregistrement des paramètres de profil.', 'Erro ao salvar as configurações do perfil.'),
(634, '', NULL, 'profile_privacy_data_saved_successfully.', 'Profile privacy data saved successfully.', 'Profielprivacygegevens zijn succesvol opgeslagen.', 'Les données de confidentialité du profil ont été enregistrées avec succès.', 'Dados de privacidade do perfil salvos com sucesso.'),
(635, '', NULL, 'passwords_don_t_match.', 'Passwords Don&#039;t Match.', 'Wachtwoorden komen niet overeen.', 'Les mots de passe ne correspondent pas.', 'Senhas não combinam.'),
(636, '', NULL, 'missing_new_password.', 'Missing New password.', 'Ontbrekend nieuw wachtwoord.', 'Nouveau mot de passe manquant.', 'Nova senha ausente.'),
(637, '', NULL, 'password_is_too_short.', 'Password is too short.', 'Wachtwoord is te kort.', 'Le mot de passe est trop court.', 'A senha é muito curta.'),
(638, '', NULL, 'current_password_missing_.', 'Current password missing .', 'Huidig ​​wachtwoord ontbreekt.', 'Mot de passe actuel manquant.', 'Senha atual ausente.'),
(639, '', NULL, 'current_password_is_wrong__please_check_again.', 'Current password is wrong, please check again.', 'Huidig ​​wachtwoord klopt niet, controleer nogmaals.', 'Le mot de passe actuel est incorrect, veuillez vérifier à nouveau.', 'A senha atual está errada, por favor, verifique novamente.'),
(640, '', NULL, 'password_updated_successfully.', 'Password updated successfully.', 'wachtwoord succesvol bijgewerkt.', 'Mot de passe mis à jour avec succès.', 'Senha atualizada com sucesso.'),
(641, '', NULL, 'error_while_update_your_password__please_check_again.', 'Error while update your password, please check again.', 'Fout tijdens het bijwerken van uw wachtwoord, controleer nogmaals.', 'Erreur lors de la mise à jour de votre mot de passe, veuillez vérifier à nouveau.', 'Erro ao atualizar sua senha, verifique novamente.'),
(642, '', NULL, 'please_enter_just_facebook_profile_user.', 'Please enter just facebook profile user.', 'Voer alstublieft gewoon Facebook-profielgebruiker in.', 'S\'il vous plaît entrer seulement l\'utilisateur de profil facebook.', 'Por favor, digite apenas o usuário do perfil do facebook.'),
(643, '', NULL, 'please_enter_just_twitter_profile_user.', 'Please enter just twitter profile user.', 'Voer alstublieft alleen de twitter-profielgebruiker in.', 'S\'il vous plaît entrer juste utilisateur de profil twitter.', 'Por favor, digite apenas o usuário do perfil do twitter.'),
(644, '', NULL, 'please_enter_just_google_profile_user.', 'Please enter just google profile user.', 'Voer alstublieft alleen een google profielgebruiker in.', 'S\'il vous plaît entrer seulement utilisateur de profil google.', 'Por favor, digite apenas o usuário do perfil do Google.'),
(645, '', NULL, 'please_enter_just_instagrem_profile_user.', 'Please enter just instagrem profile user.', 'Voer alstublieft alleen de gebruiker van het instagremprofiel in.', 'S\'il vous plaît entrer seulement utilisateur de profil instagrem.', 'Por favor, insira apenas o usuário do perfil instagrem.'),
(646, '', NULL, 'please_enter_just_linkedin_profile_user.', 'Please enter just linkedin profile user.', 'Voer alstublieft een linkedin-gebruikersprofiel in.', 'S\'il vous plaît entrer seulement utilisateur de profil linkedin.', 'Por favor, digite apenas o usuário do perfil do linkedin.'),
(647, '', NULL, 'please_enter_valid_domain_name.', 'Please enter valid domain name.', 'Voer een geldige domeinnaam in.', 'Veuillez entrer un nom de domaine valide.', 'Por favor, insira um nome de domínio válido.'),
(648, '', NULL, 'social_setting_updated_successfully.', 'Social setting updated successfully.', 'Sociale instellingen zijn succesvol bijgewerkt.', 'Paramètre social mis à jour avec succès.', 'Configuração social atualizada com sucesso.'),
(649, '', NULL, 'error_while_saving_social_setting.', 'Error while saving social setting.', 'Fout bij het opslaan van sociale instellingen.', 'Erreur lors de la sauvegarde du contexte social.', 'Erro ao salvar a configuração social.'),
(650, '', NULL, 'emails_setting_saved_successfully.', 'Emails setting saved successfully.', 'E-mails instellen succesvol opgeslagen.', 'Réglage des e-mails enregistré avec succès.', 'Configuração de e-mails salva com sucesso.'),
(651, '', NULL, 'error_while_saving_email_setting.', 'Error while saving email setting.', 'Fout tijdens het opslaan van de e-mailinstelling.', 'Erreur lors de l\'enregistrement du paramètre de courrier électronique.', 'Erro ao salvar a configuração de e-mail.'),
(652, '', NULL, 'missing__to__parameter.', 'Missing `to` parameter.', 'Ontbrekende `to`-parameter.', 'Paramètre `to` manquant.', 'Parâmetro `to` em falta.'),
(653, '', NULL, 'missing__gift_id__parameter.', 'Missing `gift_id` parameter.', 'Ontbrekende `gift_id` parameter.', 'Paramètre `gift_id` manquant.', 'Parâmetro `gift_id` em falta.'),
(654, '', NULL, 'gift_send_successfully.', 'Gift send successfully.', 'Gift verzend met succes.', 'Cadeau envoyé avec succès.', 'Dom enviar com sucesso.'),
(655, '', NULL, 'gift_send_failed.', 'Gift send failed.', 'Het verzenden van geschenken is mislukt.', 'L\'envoi du cadeau a échoué.', 'Envio de presente falhou.'),
(656, '', NULL, 'missing__id__parameter.', 'Missing `id` parameter.', 'Ontbrekende `id` parameter.', 'Paramètre `id` manquant.', 'Parâmetro `id` em falta.'),
(657, '', NULL, 'user_buy_more_visits_successfully.', 'User buy more visits successfully.', 'Gebruiker koopt meer bezoeken met succes.', 'L\'utilisateur achète plus de visites avec succès.', 'O usuário compra mais visitas com sucesso.'),
(658, '', NULL, 'error_while_buy_more_visits.', 'Error while buy more visits.', 'Fout bij het kopen van meer bezoeken.', 'Erreur lors de l\'achat de plus de visites.', 'Erro ao comprar mais visitas.'),
(659, '', NULL, 'user_buy_more_matches_successfully.', 'User buy more matches successfully.', 'Gebruiker koopt meer wedstrijden met succes.', 'L\'utilisateur achète plus de correspondances avec succès.', 'O usuário compra mais correspondências com sucesso.'),
(660, '', NULL, 'error_while_buy_more_matches.', 'Error while buy more matches.', 'Fout bij het kopen van meer overeenkomsten.', 'Erreur lors de l\'achat de plusieurs correspondances.', 'Erro ao comprar mais correspondências.'),
(661, '', NULL, 'user_buy_more_likes_successfully.', 'User buy more likes successfully.', 'Gebruiker koopt meer likes met succes.', 'L\'utilisateur achète plus de goûts avec succès.', 'O usuário compra mais curtidas com sucesso.'),
(662, '', NULL, 'error_while_buy_more_likes.', 'Error while buy more likes.', 'Fout bij het kopen van meer likes.', 'Erreur lors de l\'achat de plus de goûts.', 'Erro ao comprar mais curtidas.'),
(663, '', NULL, 'current_password_missing.', 'Current password missing.', 'Huidig ​​wachtwoord ontbreekt.', 'Mot de passe actuel manquant.', 'Senha atual ausente.'),
(664, '', NULL, 'your_account_deleted_successfully.', 'Your account deleted successfully.', 'Uw account is succesvol verwijderd.', 'Votre compte a bien été supprimé.', 'Sua conta foi excluída com sucesso.'),
(665, '', NULL, 'missing_e-mail', 'Missing E-mail', 'Ontbrekende e-mail', 'E-mail manquant', 'E-mail ausente'),
(666, '', NULL, 'this_e-mail_is_invalid', 'This E-mail is invalid', 'Deze email is ongeldig', 'Cette adresse email est invalide', 'Este email é inválido'),
(667, '', NULL, 'missing_message', 'Missing message', 'Bericht ontbreekt', 'Message manquant', 'Mensagem perdida'),
(668, '', NULL, 'thank_you_for_contacting_us', 'Thank you for contacting us', 'Bedankt dat je contact met ons hebt opgenomen', 'Merci de nous contacter', 'Obrigado por nos contatar'),
(669, '', NULL, 'message_sent_successfully', 'message sent successfully', 'Bericht succesvol verzonden', 'message envoyé avec succès', 'mensagem enviada com sucesso'),
(670, '', NULL, 'can_not_send_message', 'can not send message', 'kan geen bericht verzenden', 'ne peut pas envoyer de message', 'não pode enviar mensagem'),
(671, '', NULL, 'no_token', 'No Token', 'Geen token', 'Pas de jeton', 'Nenhum token'),
(672, '', NULL, 'no_description', 'No description', 'Geen beschrijving', 'Pas de description', 'Nenhuma descrição'),
(673, '', NULL, 'no_paytype', 'No payType', 'Geen payType', 'Aucun payType', 'Sem payType'),
(674, '', NULL, 'payment_successfully', 'Payment successfully', 'Betaling succesvol', 'Paiement réussi', 'Pagamento com sucesso'),
(675, '', NULL, 'missing_username.', 'Missing username.', 'Ontbrekende gebruikersnaam.', 'Nom d\'utilisateur manquant.', 'Nome de usuário ausente.'),
(676, '', NULL, 'missing_password.', 'Missing password.', 'Ontbrekend wachtwoord.', 'Mot de passe manquant', 'Senha ausente.'),
(677, '', NULL, 'this_e-mail_is_already_exist.', 'This E-mail is Already exist.', 'Deze e-mail bestaat al.', 'Cet e-mail est déjà existant.', 'Este e-mail já existe.'),
(678, '', NULL, 'username_must_be_between_5_32.', 'Username must be between 5/32.', 'Gebruikersnaam moet tussen 5/32 zijn.', 'Le nom d\'utilisateur doit être compris entre 5/32.', 'O nome de usuário deve estar entre 5/32.'),
(679, '', NULL, 'invalid_username_characters.', 'Invalid username characters.', 'Ongeldige gebruikersnaamtekens.', 'Nom d\'utilisateur invalide.', 'Caracteres de nome de usuário inválidos.'),
(680, '', NULL, 'registration_successfully', 'Registration successfully', 'Registratie succesvol', 'Enregistrement réussi', 'Registro com sucesso'),
(681, '', NULL, 'incorrect_username_or_password.', 'Incorrect username or password.', 'Foute gebruikersnaam of wachtwoord.', 'Identifiant ou mot de passe incorrect.', 'Usuário ou senha incorretos.'),
(682, '', NULL, 'resource_endpoint_class_file_not_found.', 'Resource endpoint class file not found.', 'Resource-eindpunt klassefile niet gevonden.', 'Fichier de classe de point de terminaison de ressource introuvable.', 'Arquivo de classe de terminal do recurso não localizado.'),
(683, '', NULL, 'login_successfully', 'Login successfully', 'Inloggen succesvol', 'Se connecter avec succès', 'Login com sucesso'),
(684, '', NULL, 'an_error_occurred_while_processing_the_form.', 'An error occurred while processing the form.', 'Er is een fout opgetreden tijdens het verwerken van het formulier.', 'Une erreur s\'est produite lors du traitement du formulaire.', 'Ocorreu um erro durante o processamento do formulário.'),
(685, '', NULL, 'missing_e-mail.', 'Missing E-mail.', 'Ontbrekende e-mail.', 'E-mail manquant.', 'E-mail ausente.'),
(686, '', NULL, 'this_e-mail', 'This E-mail', 'Deze e-mail', 'Cet e-mail', 'Este email'),
(687, '', NULL, 'is_not_registered.', 'is not registered.', 'is niet geregistreerd.', 'n\'est pas enregistré.', 'não está registrado.'),
(688, '', NULL, 'password_reset.', 'password reset.', 'wachtwoord reset.', 'réinitialiser le mot de passe.', 'resetar a senha.'),
(689, '', NULL, 'reset_password_email_sent_successfully.', 'Reset password email sent successfully.', 'Reset wachtwoord e-mail succesvol verzonden.', 'Réinitialiser l\'email de mot de passe envoyé avec succès.', 'Redefinir o email de senha enviado com sucesso.'),
(690, '', NULL, 'server_can_t_send_email_to', 'Server can&#039;t send email to', 'Server kan geen e-mail sturen naar', 'Le serveur ne peut pas envoyer d\'email à', 'O servidor não pode enviar email para'),
(691, '', NULL, 'right_now__please_try_again_later.', 'right now, please try again later.', 'Probeer het later opnieuw.', 'maintenant, veuillez réessayer plus tard.', 'agora, por favor, tente novamente mais tarde.'),
(692, '', NULL, 'missing_email_code.', 'Missing email code.', 'Ontbrekende e-mailcode.', 'Code email manquant.', 'Código de email ausente.'),
(693, '', NULL, 'email_verified_successfully', 'Email verified successfully', 'Email geverifieerd met succes', 'Email vérifié avec succès', 'E-mail verificado com sucesso'),
(694, '', NULL, 'wrong_email_verification_code.', 'Wrong email verification code.', 'Verkeerde e-mailverificatiecode.', 'Mauvais code de vérification de courrier électronique.', 'Código de verificação de e-mail incorreto.'),
(695, '', NULL, 'no_user_found_with_this_email_or_code.', 'No user found with this email or code.', 'Geen gebruiker gevonden met deze e-mail of code.', 'Aucun utilisateur trouvé avec cet email ou code.', 'Nenhum usuário encontrado com este e-mail ou código.'),
(696, '', NULL, 'you_are_not_allowed_to_open_this_page_directly.', 'You are not allowed to open this page directly.', 'U mag deze pagina niet rechtstreeks openen.', 'Vous n\'êtes pas autorisé à ouvrir cette page directement.', 'Você não tem permissão para abrir esta página diretamente.'),
(697, '', NULL, 'this_email_code_is_invalid.', 'This Email code is invalid.', 'Deze e-mailcode is ongeldig.', 'Ce code email est invalide.', 'Este código de email é inválido.'),
(698, '', NULL, 'empty_password.', 'Empty password.', 'Leeg wachtwoord.', 'Mot de passe vide.', 'Senha vazia.'),
(699, '', NULL, 'password_reset_successfully', 'Password reset successfully', 'Wachtwoord resetten succesvol', 'Mot de passe réinitialisé avec succès', 'Senha redefinida com sucesso'),
(700, '', NULL, 'error_while_login_with_new_password.', 'Error While login with new password.', 'Fout tijdens inloggen met nieuw wachtwoord.', 'Erreur lors de la connexion avec un nouveau mot de passe.', 'Erro ao entrar com nova senha.'),
(701, '', NULL, 'error_while_save_new_password.', 'Error While save new password.', 'Fout bij opslaan nieuw wachtwoord.', 'Erreur lors de la sauvegarde du nouveau mot de passe.', 'Erro Enquanto salvar nova senha.'),
(702, '', NULL, 'missing_phone_number.', 'Missing phone number.', 'Ontbrekend telefoonnummer.', 'Numéro de téléphone manquant.', 'Número de telefone ausente.'),
(703, '', NULL, 'please_provide_international_number_with_your_area_code_starting_with__.', 'Please provide international number with your area code starting with +.', 'Geef het internationale nummer op met uw netnummer beginnend met +.', 'Veuillez fournir un numéro international avec votre indicatif régional commençant par +.', 'Por favor, forneça o número internacional com o seu código de área começando com +.'),
(704, '', NULL, 'please_enter_valid_number.', 'Please enter valid number.', 'Voer een geldig nummer in.', 'S\'il vous plaît entrer un numéro valide.', 'Por favor, insira um número válido.'),
(705, '', NULL, 'invalid_phone_number_characters.', 'Invalid phone number characters.', 'Ongeldige telefoonnummers.', 'Caractères de numéro de téléphone non valides.', 'Caracteres de números de telefone inválidos.'),
(706, '', NULL, 'this_mobile_number_is_already_exist.', 'This Mobile number is Already exist.', 'Dit mobiele nummer bestaat al.', 'Ce numéro de téléphone portable existe déjà.', 'Este número de celular já existe.'),
(707, '', NULL, 'mobile_activation_code.', 'Mobile Activation code.', 'Mobiele activeringscode.', 'Code d\'activation mobile.', 'Código de Ativação Móvel.'),
(708, '', NULL, 'verification_sms_sent_successfully.', 'Verification sms sent successfully.', 'Verificatie sms succesvol verzonden.', 'Vérification SMS envoyé avec succès.', 'Sms de verificação enviados com sucesso.'),
(709, '', NULL, 'can_t_send_verification_sms__please_try_again_later.', 'Can&#039;t send verification sms, please try again later.', 'Kan verificatie-sms niet verzenden. Probeer het later opnieuw.', 'Impossible d\'envoyer un SMS de vérification, veuillez réessayer ultérieurement.', 'Não é possível enviar sms de verificação. Tente novamente mais tarde.'),
(710, '', NULL, 'missing_email.', 'Missing email.', 'Ontbrekende e-mail.', 'Email manquant.', 'E-mail ausente.'),
(711, '', NULL, 'thank_you_for_your_registration.', 'Thank you for your registration.', 'Bedankt voor uw registratie.', 'Merci pour votre inscription.', 'Obrigado por sua inscrição.'),
(712, '', NULL, 'can_t_send_verification_email__please_try_again_later.', 'Can&#039;t send verification email, please try again later.', 'Ik kan geen verificatie-e-mail verzenden. Probeer het later opnieuw.', 'Impossible d\'envoyer un e-mail de vérification, veuillez réessayer ultérieurement.', 'Não é possível enviar o e-mail de verificação. Tente novamente mais tarde.'),
(713, '', NULL, 'you_can_not_like_your_self.', 'You can not like your self.', 'Je kunt jezelf niet goed vinden.', 'Vous ne pouvez pas vous aimer.', 'Você não pode gostar de si mesmo.'),
(714, '', NULL, 'you_can_not_perform_this_action.', 'You can not perform this action.', 'U kunt deze actie niet uitvoeren.', 'Vous ne pouvez pas effectuer cette action.', 'Você não pode executar esta ação.'),
(715, '', NULL, 'error_while_deleting_dislike.', 'Error while deleting dislike.', 'Fout tijdens het verwijderen van afkeer.', 'Erreur lors de la suppression de l\'aversion.', 'Erro ao excluir antipatia.'),
(716, '', NULL, 'user_has_been_blocked_successfully.', 'User has been blocked successfully.', 'Gebruiker is succesvol geblokkeerd.', 'L\'utilisateur a été bloqué avec succès.', 'Usuário foi bloqueado com sucesso.'),
(717, '', NULL, 'error_while_save_block.', 'Error while save block.', 'Fout tijdens opslaan blokkeren.', 'Erreur lors de la sauvegarde du bloc.', 'Erro ao salvar bloco.'),
(718, '', NULL, 'user_has_been_unblocked_successfully.', 'User has been unblocked successfully.', 'Gebruiker is succesvol gedeblokkeerd.', 'L\'utilisateur a été débloqué avec succès.', 'Usuário foi desbloqueado com sucesso.'),
(719, '', NULL, 'error_while_delete_user_block.', 'Error while delete user block.', 'Fout tijdens verwijderen gebruikersblok.', 'Erreur lors de la suppression du bloc utilisateur.', 'Erro ao excluir o bloqueio do usuário.'),
(720, '', NULL, 'error_while_save_report.', 'Error while save report.', 'Fout tijdens opslaan rapport.', 'Erreur lors de la sauvegarde du rapport.', 'Erro ao salvar o relatório.'),
(721, '', NULL, 'user_has_been_unreported_successfully.', 'User has been unreported successfully.', 'Gebruiker is niet succesvol gerapporteerd.', 'L\'utilisateur n\'a pas été signalé avec succès.', 'O usuário não foi reportado com sucesso.'),
(722, '', NULL, 'error_while_delete_user_report.', 'Error while delete user report.', 'Fout bij verwijderen gebruikersrapport.', 'Erreur lors de la suppression du rapport utilisateur.', 'Erro ao excluir o relatório do usuário.'),
(723, '', NULL, 'email_verification.', 'Email Verification.', 'Email verificatie.', 'Vérification de l\'E-mail.', 'Verificação de e-mail.'),
(724, '', NULL, 'verification_email_sent_successfully.', 'Verification email sent successfully.', 'Verificatie e-mail succesvol verzonden.', 'Email de vérification envoyé avec succès.', 'E-mail de verificação enviado com sucesso.'),
(725, '', NULL, 'error_while_update_email_activation.', 'Error while update email activation.', 'Fout bij het bijwerken van de e-mailactivering.', 'Erreur lors de la mise à jour de l\'activation du courrier électronique.', 'Erro durante a ativação do email de atualização.'),
(726, '', NULL, 'missing_sms_code.', 'Missing sms code.', 'Ontbrekende sms-code.', 'Code SMS manquant.', 'Falta de código sms.'),
(727, '', NULL, 'phone_verified_successfully', 'Phone verified successfully', 'Telefoon geverifieerd', 'Téléphone vérifié avec succès', 'Telefone confirmado com sucesso'),
(728, '', NULL, 'error_while_update_phone_activation.', 'Error while update phone activation.', 'Fout bij activering van activeringscode.', 'Erreur lors de l\'activation du téléphone.', 'Erro durante a ativação do telefone de atualização.'),
(729, '', NULL, 'wrong_phone_verification_code.', 'Wrong phone verification code.', 'Verkeerde telefoonverificatiecode.', 'Mauvais code de vérification téléphonique.', 'Código de verificação errado do telefone.'),
(730, '', NULL, 'no_user_found_with_this_phone_number_or_code.', 'No user found with this phone number or code.', 'Geen gebruiker gevonden met dit telefoonnummer of code.', 'Aucun utilisateur trouvé avec ce numéro de téléphone ou code.', 'Nenhum usuário encontrado com este número de telefone ou código.'),
(731, '', NULL, 'user_boosted_successfully.', 'User boosted successfully.', 'Gebruiker succesvol gesteund.', 'Utilisateur boosté avec succès.', 'Usuário reforçado com sucesso.'),
(732, '', NULL, 'error_while_boost_user.', 'Error while boost user.', 'Fout bij het verhogen van de gebruiker.', 'Erreur lors de l\'augmentation de l\'utilisateur.', 'Erro ao impulsionar o usuário.'),
(733, '', NULL, 'user_unmatched_successfully.', 'User unmatched successfully.', 'Gebruiker is succesvol geëvenaard.', 'Utilisateur sans correspondance.', 'Usuário incomparável com sucesso.'),
(734, '', NULL, 'method_not_allowed', 'Method Not Allowed', 'methode niet toegestaan', 'Méthode Non Autorisée', 'Método não permitido'),
(735, '', NULL, 'this_call_from_test_function', 'this call from test function', 'deze oproep van testfunctie', 'cet appel de la fonction de test', 'esta chamada da função de teste'),
(736, '', NULL, 'credit', 'Credit', 'Credit', 'Crédit', 'Crédito'),
(737, '', NULL, 'forgot_password', 'Forgot password', 'Wachtwoord vergeten', 'Mot de passe oublié', 'Esqueceu a senha'),
(738, '', NULL, 'home', 'Home', 'Huis', 'Accueil', 'Casa'),
(739, '', NULL, 'interest', 'Interest', 'Interesseren', 'Intérêt', 'Interesse'),
(740, '', NULL, 'people_liked_me', 'People liked me', 'Mensen vonden me leuk', 'Les gens m\'ont aimé', 'Pessoas gostavam de mim'),
(741, '', NULL, 'email_code_verification', 'Email code verification', 'Verificatie van e-mailcode', 'Vérification du code email', 'Verificação do código de email'),
(742, '', NULL, 'premium_membership', 'Premium Membership', 'Premium lidmaatschap', 'Abonnement Premium', 'Assinatura especial'),
(743, '', NULL, 'premium_membership_success', 'Premium Membership Success', 'Premium lidmaatschapssucces', 'Succès d\'adhésion Premium', 'Sucesso Premium da Associação'),
(744, '', NULL, 'reset_password', 'Reset Password', 'Reset wachtwoord', 'réinitialiser le mot de passe', 'Redefinir Senha'),
(745, '', NULL, 'general_settings', 'General Settings', 'Algemene instellingen', 'réglages généraux', 'Configurações Gerais'),
(746, '', NULL, 'profile_settings_blocked', 'Profile Settings Blocked', 'Profielinstellingen geblokkeerd', 'Paramètres de profil bloqués', 'Configurações de perfil bloqueadas'),
(747, '', NULL, 'delete_profile', 'Delete Profile', 'Verwijder profiel', 'Supprimer le profil', 'Excluir perfil'),
(748, '', NULL, 'profile_email_settings', 'Profile Email Settings', 'Profiel e-mailinstellingen', 'Paramètres de messagerie de profil', 'Configurações de email do perfil'),
(749, '', NULL, 'account_password_settings', 'Account Password Settings', 'Account wachtwoord instellingen', 'Paramètres du mot de passe du compte', 'Configurações de senha da conta'),
(750, '', NULL, 'privacy_setting', 'Privacy Setting', 'Privacy-instelling', 'Paramètre de confidentialité', 'Configuração de privacidade'),
(751, '', NULL, 'profile_setting', 'Profile Setting', 'Profiel instelling', 'Paramétrage du profil', 'Configuração de perfil'),
(752, '', NULL, 'social_setting', 'Social Setting', 'Sociale situatie', 'Cadre social', 'Cenário Social'),
(753, '', NULL, 'profile_steps', 'Profile steps', 'Profielstappen', 'Étapes du profil', 'Etapas do perfil'),
(754, '', NULL, 'verify_your_account', 'Verify your account', 'Verifieer uw account', 'Vérifiez votre compte', 'Verifique sua conta'),
(755, '', NULL, 'verify_e-mail_address', 'Verify E-Mail address', 'Bevestig e-mail adres', 'Vérifier l\'adresse e-mail', 'Verificar endereço de e-mail'),
(756, '', NULL, 'verify_phone', 'Verify Phone', 'Verifieer telefoon', 'Vérifier le téléphone', 'Verificar telefone'),
(757, '', NULL, 'sms_code_verification', 'SMS code verification', 'Verificatie van sms-codes', 'Vérification du code SMS', 'Verificação de código SMS'),
(758, '', NULL, 'id_cannot_be_empty__or_character._only_numbers_allowed__or_you_have_call_undefined_method', 'ID cannot be empty, or character. only numbers allowed, or you have call undefined method', 'ID mag niet leeg zijn, of karakter. alleen toegestane aantallen, of u hebt aanroep ongedefinieerde methode', 'ID ne peut pas être vide ou caractère. seuls les nombres sont autorisés ou vous avez appelé une méthode indéfinie', 'O ID não pode estar vazio ou caractere. somente números permitidos, ou você tem o método de chamada indefinida'),
(759, '', NULL, 'bad_request__invalid_or_missing_parameter', 'Bad Request, Invalid or missing parameter', 'Slecht verzoek, ongeldige of ontbrekende parameter', 'Requête incorrecte, paramètre invalide ou manquant', 'Solicitação incorreta, parâmetro inválido ou ausente'),
(760, '', NULL, 'user_in_black_list', 'User in black list', 'Gebruiker in zwarte lijst', 'Utilisateur en liste noire', 'Usuário na lista negra'),
(761, '', NULL, 'message_sent_successfully.', 'Message sent successfully.', 'Bericht succesvol verzonden.', 'Message envoyé avec succès.', 'Mensagem enviada com sucesso.'),
(762, '', NULL, 'operation_successfully.', 'Operation successfully.', 'Operatie succesvol.', 'Opération réussie.', 'Operação com sucesso.'),
(763, '', NULL, 'options_loaded_successfully.', 'Options loaded successfully.', 'Opties zijn succesvol geladen.', 'Options chargées avec succès.', 'Opções carregadas com sucesso.'),
(764, '', NULL, 'user_name_cannot_be_empty', 'User name cannot be empty', 'Gebruikersnaam mag niet leeg zijn', 'Le nom d\'utilisateur ne peut pas être vide', 'O nome do usuário não pode estar vazio'),
(765, '', NULL, 'password_cannot_be_empty', 'Password cannot be empty', 'Wachtwoord mag niet leeg zijn', 'Le mot de passe ne peut pas être vide', 'A senha não pode estar vazia'),
(766, '', NULL, 'login_successfully__please_wait..', 'Login successfully, Please wait..', 'Inloggen succesvol, even geduld aub ..', 'Connectez-vous avec succès, veuillez patienter ..', 'Login com sucesso, por favor aguarde ..'),
(767, '', NULL, 'could_not_save_session', 'Could not save session', 'Kon de sessie niet opslaan', 'Impossible de sauvegarder la session', 'Não foi possível salvar a sessão'),
(768, '', NULL, 'user_not_exist', 'User Not Exist', 'Gebruiker bestaat niet', 'Utilisateur non existant', 'Usuário não existe'),
(769, '', NULL, 'wrong_password', 'Wrong password', 'Verkeerd wachtwoord', 'Mauvais mot de passe', 'Senha incorreta'),
(770, '', NULL, 'user_data_unset', 'User data unset', 'Gebruikersgegevens worden uitgeschakeld', 'Données utilisateur non définies', 'Dados do usuário não definidos'),
(771, '', NULL, 'username_must_be_between_5_32', 'Username must be between 5/32', 'Gebruikersnaam moet tussen 5/32 zijn', 'Le nom d\'utilisateur doit être compris entre 5/32', 'O nome de usuário deve estar entre 5 e 32'),
(772, '', NULL, 'invalid_username_characters', 'Invalid username characters', 'Ongeldige gebruikersnaamtekens', 'Nom d\'utilisateur invalide', 'Caracteres de nome de usuário inválidos'),
(773, '', NULL, 'user_name_exists', 'User Name Exists', 'Gebruikersnaam bestaat', 'Le nom d\'utilisateur existe', 'Nome de usuário existente'),
(774, '', NULL, 'email_cannot_be_empty', 'Email cannot be empty', 'E-mail mag niet leeg zijn', 'L\'email ne peut pas être vide', 'E-mail não pode estar vazio'),
(775, '', NULL, 'email_already_exists', 'Email Already Exists', 'Email bestaat al', 'L\'email existe déjà', 'E-mail já existe'),
(776, '', NULL, 'registration_failed', 'Registration Failed', 'Registratie mislukt', 'Échec de l\'enregistrement', 'Registração falhou'),
(777, '', NULL, 'successfully_joined.', 'Successfully joined.', 'Succesvol toegetreden.', 'Rejoint avec succès.', 'Entrou com sucesso.'),
(778, '', NULL, 'could_not_send_verification_email', 'Could not send verification email', 'Kon verificatie-e-mail niet verzenden', 'Impossible d\'envoyer le courrier électronique de vérification', 'Não foi possível enviar o e-mail de verificação'),
(779, '', NULL, 'successfully_joined__please_wait..', 'Successfully joined, Please wait..', 'Met succes toegetreden, Even geduld aub ..', 'Avec succès rejoint, S\'il vous plaît patienter ..', 'Com sucesso, por favor, aguarde ..'),
(780, '', NULL, 'error__an_unknown_error_occurred._please_try_again_later', 'Error: an unknown error occurred. Please try again later', 'Fout: er is een onbekende fout opgetreden. Probeer het later opnieuw', 'Erreur: une erreur inconnue s\'est produite. Veuillez réessayer plus tard', 'Erro: ocorreu um erro desconhecido. Por favor, tente novamente mais tarde'),
(781, '', NULL, 'registration_success', 'Registration Success', 'Registratie succes', 'Succès d\'inscription', 'Sucesso no registro'),
(782, '', NULL, 'error_400_-_session_does_not_exist', 'Error 400 - Session does not exist', 'Fout 400 - Sessie bestaat niet', 'Erreur 400 - La session n\'existe pas', 'Erro 400 - a sessão não existe'),
(783, '', NULL, 'successfully_logged_out', 'Successfully logged out', 'Succesvol afgemeld', 'Déconnecté avec succès', 'Logout com sucesso'),
(784, '', NULL, 'no_user_email__sent', 'No user email  sent', 'Geen e-mail van gebruiker verzonden', 'Aucun email d\'utilisateur envoyé', 'Nenhum email de usuário enviado'),
(785, '', NULL, 'e-mail_is_not_exists', 'E-mail is not exists', 'E-mail bestaat niet', 'E-mail n\'est pas existe', 'E-mail não existe'),
(786, '', NULL, 'a_reset_password_link_has_been_sent_to_your_e-mail_address', 'A reset password link has been sent to your e-mail address', 'Een link voor het opnieuw instellen van het wachtwoord is naar uw e-mailadres verzonden', 'Un lien de réinitialisation du mot de passe a été envoyé à votre adresse e-mail.', 'Um link de redefinição de senha foi enviado para o seu endereço de e-mail'),
(787, '', NULL, 'you_enter_wrong_password', 'You enter wrong password', 'U voert een verkeerd wachtwoord in', 'Vous entrez un mot de passe incorrect', 'Você digita a senha errada'),
(788, '', NULL, 'profile_fetch_successfully', 'Profile fetch successfully', 'Profiel ophalen succesvol', 'Récupération du profil avec succès', 'Perfil buscar com sucesso'),
(789, '', NULL, 'empty_username', 'Empty username', 'Lege gebruikersnaam', 'Nom d\'utilisateur vide', 'Nome de usuário vazio'),
(790, '', NULL, 'empty_password', 'Empty password', 'Leeg wachtwoord', 'Mot de passe vide', 'Senha vazia'),
(791, '', NULL, 'id_cannot_be_empty__or_character._only_numbers_allowed', 'ID cannot be empty, or character. only numbers allowed', 'ID mag niet leeg zijn, of karakter. alleen cijfers toegestaan', 'ID ne peut pas être vide ou caractère. seuls les nombres autorisés', 'O ID não pode estar vazio ou caractere. somente números permitidos'),
(792, '', NULL, 'session_add_failed', 'Session add failed', 'Sessie toevoegen mislukt', 'L\'ajout de session a échoué', 'Falha ao adicionar sessão'),
(793, '', NULL, 'username_cannot_be_empty', 'Username cannot be empty', 'Gebruikersnaam kan niet leeg zijn', 'Le nom d\'utilisateur ne peut pas être vide', 'O nome de usuário não pode estar vazio'),
(794, '', NULL, 'token_cannot_be_empty', 'Token cannot be empty', 'Token kan niet leeg zijn', 'Le jeton ne peut pas être vide', 'O token não pode estar vazio'),
(795, '', NULL, 'could_not_ave_session', 'Could not ave session', 'Kan niet ave sessie', 'Je n\'ai pas pu avoir de session', 'Não foi possível uma sessão'),
(796, '', NULL, 'user_not_found', 'User not found', 'Gebruiker niet gevonden', 'Utilisateur non trouvé', 'Usuário não encontrado'),
(797, '', NULL, 'id_cannot_be_empty__or_character._only_numbers_allowed.', 'ID cannot be empty, or character. only numbers allowed.', 'ID mag niet leeg zijn, of karakter. alleen cijfers toegestaan.', 'ID ne peut pas être vide ou caractère. seuls les nombres sont autorisés.', 'O ID não pode estar vazio ou caractere. apenas números permitidos.'),
(798, '', NULL, 'error_while_deleting__blocks__data.', 'Error while deleting &quot;Blocks&quot; data.', 'Fout bij het verwijderen van & quot; Blokken & quot; gegevens.', 'Erreur lors de la suppression de ', 'Erro ao excluir & quot; Blocos & quot; dados.'),
(799, '', NULL, 'error_while_deleting__conversations__data.', 'Error while deleting &quot;Conversations&quot; data.', 'Fout tijdens het verwijderen van & quot; Conversaties & quot; gegevens.', 'Erreur lors de la suppression de & quot; Conversations & quot; Les données.', 'Erro ao excluir & quot; conversas & quot; dados.'),
(800, '', NULL, 'error_while_deleting__likes__data.', 'Error while deleting &quot;Likes&quot; data.', 'Fout tijdens het verwijderen van & quot; Likes & quot; gegevens.', 'Erreur lors de la suppression de & L; Aime & quot; Les données.', 'Erro ao excluir & quot; Curtidas & quot; dados.'),
(801, '', NULL, 'error_while_deleting__media_files__data.', 'Error while deleting &quot;Media files&quot; data.', 'Fout bij het verwijderen van & quot; Mediabestanden & quot; gegevens.', 'Erreur lors de la suppression de & quot; Fichiers multimédias & quot; Les données.', 'Erro ao excluir os arquivos & quot; Arquivos de mídia & quot; dados.'),
(802, '', NULL, 'error_while_deleting__messages__data.', 'Error while deleting &quot;Messages&quot; data.', 'Fout tijdens het verwijderen van & quot; Berichten & quot; gegevens.', 'Erreur lors de la suppression de & Messages; Messages & quot; Les données.', 'Erro ao excluir & quot; Mensagens & quot; dados.'),
(803, '', NULL, 'error_while_deleting__notifications__data.', 'Error while deleting &quot;Notifications&quot; data.', 'Fout bij het verwijderen van & quot; Meldingen & quot; gegevens.', 'Erreur lors de la suppression de & Notifications; Notifications & quot; Les données.', 'Erro ao excluir & quot; Notificações & quot; dados.'),
(804, '', NULL, 'error_while_deleting__reports__data.', 'Error while deleting &quot;Reports&quot; data.', 'Fout bij het verwijderen van & quot; Rapporten & quot; gegevens.', 'Erreur lors de la suppression de & Reports; Rapports & quot; Les données.', 'Erro ao excluir & quot; Relatórios & quot; dados.'),
(805, '', NULL, 'error_while_deleting__gifts__data.', 'Error while deleting &quot;Gifts&quot; data.', 'Fout tijdens het verwijderen van & quot; Gifts & quot; gegevens.', 'Erreur lors de la suppression de & quot; Cadeaux & quot; Les données.', 'Erro ao excluir os & quot; Presentes & quot; dados.'),
(806, '', NULL, 'error_while_deleting__visits__data.', 'Error while deleting &quot;Visits&quot; data.', 'Fout bij het verwijderen van & quot; Bezoeken & quot; gegevens.', 'Erreur lors de la suppression de & quot; Visites & quot; Les données.', 'Erro ao excluir & quot; Visitas & quot; dados.'),
(807, '', NULL, 'error_while_deleting__user__data.', 'Error while deleting &quot;User&quot; data.', 'Fout tijdens het verwijderen van & quot; Gebruiker & quot; gegevens.', 'Erreur lors de la suppression de ', 'Erro ao excluir o & quot; Usuário & quot; dados.'),
(808, '', NULL, 'error_while_deleting__sessions__data.', 'Error while deleting &quot;Sessions&quot; data.', 'Fout tijdens het verwijderen van & quot; Sessions & quot; gegevens.', 'Erreur lors de la suppression de & quot; Sessions & quot; Les données.', 'Erro ao excluir & quot; Sessões & quot; dados.'),
(809, '', NULL, 'error_while_deleting__payments__data.', 'Error while deleting &quot;Payments&quot; data.', 'Fout bij het verwijderen van & quot; Betalingen & quot; gegevens.', 'Erreur lors de la suppression de ', 'Erro ao excluir & quot; Pagamentos & quot; dados.'),
(810, '', NULL, 'like_delete_successfully.', 'Like delete successfully.', 'Net als succesvol verwijderen.', 'Comme supprimer avec succès.', 'Como excluir com sucesso.'),
(811, '', NULL, 'dislike_delete_successfully.', 'Dislike delete successfully.', 'Houden niet van succesvol verwijderen.', 'N\'aime pas supprimer avec succès.', 'Não gosto de excluir com sucesso.'),
(812, '', NULL, 'user_unblocked_successfully.', 'User unblocked successfully.', 'Gebruiker de blokkering opgeheven.', 'Utilisateur débloqué avec succès.', 'Usuário desbloqueado com sucesso.'),
(813, '', NULL, 'user_blocked_successfully.', 'User blocked successfully.', 'Gebruiker is succesvol geblokkeerd.', 'Utilisateur bloqué avec succès.', 'Usuário bloqueado com sucesso.'),
(814, '', NULL, 'user_unreported_successfully.', 'User unreported successfully.', 'Gebruiker niet succesvol gemeld.', 'Utilisateur non signalé avec succès.', 'Usuário não relatado com sucesso.'),
(815, '', NULL, 'user_reported_successfully.', 'User reported successfully.', 'Gebruiker succesvol gemeld.', 'Utilisateur signalé avec succès.', 'Usuário relatado com sucesso.'),
(816, '', NULL, 'user_visited_successfully.', 'User visited successfully.', 'Gebruiker met succes bezocht.', 'Utilisateur visité avec succès.', 'Usuário visitado com sucesso.'),
(817, '', NULL, 'could_not_save_user_visit', 'Could not save user visit', 'Kan gebruikersbezoek niet opslaan', 'Impossible d\'enregistrer la visite de l\'utilisateur', 'Não foi possível salvar a visita do usuário'),
(818, '', NULL, 'gift_sent_successfully.', 'Gift sent successfully.', 'Gift succesvol verzonden.', 'Cadeau envoyé avec succès.', 'Presente enviado com sucesso.'),
(819, '', NULL, 'could_not_save_user_gift', 'Could not save user gift', 'Kan gebruikerscadeau niet opslaan', 'Impossible d\'enregistrer le cadeau de l\'utilisateur', 'Não foi possível salvar o presente do usuário'),
(820, '', NULL, 'search_fetch_successfully', 'Search fetch successfully', 'Zoekopdracht succesvol ophalen', 'Recherche réussie avec succès', 'Buscar busca com sucesso'),
(821, '', NULL, 'profile_updated_successfully.', 'Profile updated successfully.', 'Profiel succesvol bijgewerkt.', 'Mise à jour du profil réussie.', 'Perfil atualizado com sucesso.'),
(822, '', NULL, 'can_not_update_profile.', 'Can not update profile.', 'Kan profiel niet bijwerken.', 'Impossible de mettre à jour le profil.', 'Não é possível atualizar o perfil.'),
(823, '', NULL, 'profile_avatar_updated_successfully.', 'Profile avatar updated successfully.', 'Profiel avatar succesvol bijgewerkt.', 'Avatar de profil mis à jour avec succès.', 'Avatar do perfil atualizado com sucesso.'),
(824, '', NULL, 'can_not_upload_avatar_file.', 'Can not upload avatar file.', 'Kan avatar-bestand niet uploaden.', 'Impossible de télécharger le fichier d\'avatar.', 'Não é possível carregar o arquivo do avatar.'),
(825, '', NULL, 'google_key__post__is_missing', 'google_key (POST) is missing', 'google_key (POST) ontbreekt', 'google_key (POST) est manquant', 'google_key (POST) está faltando'),
(826, '', NULL, 'login_success', 'Login Success', 'Succesvol ingelogd', 'Connexion réussie', 'Sucesso de Login'),
(827, '', NULL, 'empty_social_id', 'Empty social id', 'Leeg sociaal ID', 'Identifiant social vide', 'ID social vazia'),
(828, '', NULL, 'payment_processed_successfully', 'Payment processed successfully', 'Betaling succesvol verwerkt', 'Paiement traité avec succès', 'Pagamento processado com sucesso'),
(829, '', NULL, 'error_while_payment_process', 'Error While Payment process', 'Fout tijdens betalingsproces', 'Erreur lors du processus de paiement', 'Erro durante o processo de pagamento'),
(830, '', NULL, 'visit_you', 'Visit you', 'Jou bezoeken', 'Te rendre visite', 'Visitar você'),
(831, '', NULL, 'like_you', 'Like you', 'Zoals jij', 'Comme toi', 'Gosto de voce'),
(832, '', NULL, 'dislike_you', 'Dislike you', 'Ik vind je niet leuk', 'Te déteste', 'Não gosta de você'),
(833, '', NULL, 'send_gift_to_you', 'Send gift to you', 'Stuur cadeau aan jou', 'Envoyer un cadeau à vous', 'Envie um presente para você'),
(834, '', NULL, 'you_got_a_new_match__click_to_view_', 'You got a new match, click to view!', 'Je hebt een nieuwe match, klik om te bekijken!', 'Vous avez un nouveau match, cliquez pour voir!', 'Você tem um novo jogo, clique para ver!'),
(835, '', NULL, 'choose_your_relationship_status', 'Choose your Relationship status', 'Kies uw Relatiestatus', 'Choisissez votre statut de relation', 'Escolha o seu status de relacionamento'),
(836, '', NULL, 'choose_your_preferred_language', 'Choose your Preferred Language', 'Kies uw voorkeurstaal', 'Choisissez votre langue préférée', 'Escolha o seu idioma preferido'),
(837, '', NULL, 'choose_your_work_status', 'Choose your Work status', 'Kies uw werkstatus', 'Choisissez votre statut de travail', 'Escolha seu status de trabalho'),
(838, '', NULL, 'choose_your_hair_color', 'Choose your Hair Color', 'Kies je haarkleur', 'Choisissez votre couleur de cheveux', 'Escolha sua cor de cabelo'),
(839, '', NULL, 'live_with', 'Live with', 'Leef met', 'Vivre avec', 'Viver com'),
(840, '', NULL, 'enter_a_tag__then_hit_enter', 'Enter a tag, then hit enter', 'Voer een tag in en druk op Enter', 'Entrez une balise, puis appuyez sur Entrée', 'Insira uma tag e pressione Enter'),
(841, '', NULL, '_tag__hit_enter_to_add_more', '+Tag, Hit enter to add more', '+ Tag, druk op Enter om meer toe te voegen', '+ Tag, appuyez sur Entrée pour ajouter plus', '+ Tag, pressione Enter para adicionar mais'),
(842, '', NULL, 'i__039_m_studying', 'I&#039;m studying', 'ik ben aan het studeren', 'j\'étudie', 'Estou estudando'),
(843, '', NULL, 'i__039_m_working', 'I&#039;m working', 'ik ben aan het werk', 'je travaille', 'estou trabalhando'),
(844, '', NULL, 'i__039_m_looking_for_work', 'I&#039;m looking for work', 'ik zoek naar werk', 'je cherche du travail', 'Estou procurando trabalho'),
(845, '', NULL, 'i__039_m_retired', 'I&#039;m retired', 'ik ben met pensioen', 'Je suis à la retraite', 'estou aposentado'),
(877, '', NULL, 'i_have_kids_and_don__039_t_want_more', 'I have kids and don&#039;t want more', 'Ik heb kinderen en wil niet meer', 'J\'ai des enfants et je ne veux plus', 'Eu tenho filhos e não quero mais'),
(878, '', NULL, 'personality', 'Personality', 'Persoonlijkheid', 'Personnalité', 'Personalidade'),
(879, '', NULL, 'favourites', 'Favourites', 'favorieten', 'Favoris', 'Favoritos'),
(880, '', NULL, 'notification_saved_successfully', 'Notification saved successfully', 'Notificatie succesvol opgeslagen', 'Notification enregistrée avec succès', 'Notificação salva com sucesso'),
(881, '', NULL, 'error_found__please_try_again_later.', 'Error found, please try again later.', 'Fout gevonden, probeer het later opnieuw.', 'Erreur trouvée, veuillez réessayer plus tard.', 'Erro encontrado, por favor, tente novamente mais tarde.'),
(882, '', NULL, 'return_back', 'Return back', 'Terugkeren', 'Retour', 'Devolver'),
(1103, '', NULL, 'choose_your_gender', 'Choose your Gender', 'Kies je geslacht', 'Choisissez votre genre', 'Escolha o seu sexo'),
(1111, '', NULL, 'enter_a_location', 'Enter a location', 'Voer een locatie in', 'Entrez un lieu', 'Digite um local'),
(1116, '', NULL, 'by_creating_your_account__you_agree_to_our', 'By creating your account, you agree to our', 'Door uw account aan te maken, gaat u akkoord met onze', 'En créant votre compte, vous acceptez notre', 'Ao criar sua conta, você concorda com nossos'),
(1117, '', NULL, 'this_phone_number_is_already_exist.', 'This Phone number is Already exist.', 'Dit telefoonnummer bestaat al.', 'Ce numéro de téléphone est déjà existant.', 'Este número de telefone já existe.');
INSERT INTO `langs` (`id`, `ref`, `options`, `lang_key`, `english`, `dutch`, `french`, `portuguese`) VALUES
(1120, '', NULL, 'current_password', 'Current Password', 'huidig ​​wachtwoord', 'Mot de passe actuel', 'senha atual'),
(1153, '', NULL, 'delete_account_', 'Delete account?', 'Account verwijderen?', 'Supprimer le compte?', 'Deletar conta?'),
(1154, '', NULL, 'are_you_sure_you_want_to_delete_your_account__all_content_including_published_photos_and_other_data_will_be_permanetly_removed_', 'Are you sure you want to delete your account? All content including published photos and other data will be permanetly removed!', 'Weet je zeker dat je je account wilt verwijderen? Alle inhoud inclusief gepubliceerde foto\'s en andere gegevens worden permanent verwijderd!', 'Êtes-vous sûr de vouloir supprimer votre compte? Tout le contenu, y compris les photos publiées et autres données, sera définitivement supprimé!', 'Tem certeza de que deseja excluir sua conta? Todo o conteúdo, incluindo fotos publicadas e outros dados, será permanentemente removido.'),
(1155, '', NULL, 'delete', 'Delete', 'Verwijder', 'Effacer', 'Excluir'),
(1156, '', NULL, 'chat_conversations_fetch_successfully', 'Chat conversations fetch successfully', 'Chatgesprekken worden met succes opgehaald', 'Conversations de conversation réussies', 'Conversas de bate-papo buscam com sucesso'),
(1158, '', NULL, 'bank_transfer', 'Bank Transfer', 'Overschrijving', 'Virement', 'Transferência bancária'),
(1159, '', NULL, 'close', 'Close', 'Dichtbij', 'Fermer', 'Perto'),
(1160, '', NULL, 'bank_information', 'Bank Information', 'Bank informatie', 'Information bancaire', 'Informação bancária'),
(1161, '', NULL, 'please_transfer_the_amount_of', 'Please transfer the amount of', 'Gelieve het bedrag over te maken', 'S\'il vous plaît transférer le montant de', 'Por favor, transfira a quantidade de'),
(1162, '', NULL, 'to_this_bank_account_to_buy', 'to this bank account to purchase', 'om deze bankrekening te kopen', 'à ce compte bancaire pour acheter', 'para esta conta bancária para comprar'),
(1163, '', NULL, 'upload_receipt', 'Upload Receipt', 'Upload ontvangst', 'Télécharger le reçu', 'Carregar Recibo'),
(1164, '', NULL, 'confirm', 'Confirm', 'Bevestigen', 'Confirmer', 'confirme'),
(1165, '', NULL, 'your_receipt_uploaded_successfully.', 'Your was receipt successfully uploaded.', 'Uw kwitantie is succesvol geüpload.', 'Votre reçu a été téléchargé avec succès.', 'Seu recibo foi enviado com sucesso.'),
(1166, '', NULL, 'date', 'Date', 'Datum', 'Rendez-vous amoureux', 'Encontro'),
(1167, '', NULL, 'processed_by', 'Processed By', 'Verwerkt door', 'Traité par', 'Processado por'),
(1168, '', NULL, 'amount', 'Amount', 'Bedrag', 'Montant', 'Montante'),
(1169, '', NULL, 'type', 'Type', 'Type', 'Type', 'Tipo'),
(1170, '', NULL, 'notes', 'Notes', 'Notes', 'Remarques', 'Notas'),
(1171, '', NULL, 'plan_premium_membership', 'Plan Premium Membership', 'Plan Premium-lidmaatschap', 'Planifier l\'abonnement Premium', 'Planeje a filiação Premium'),
(1172, '', NULL, 'your_boost_will_expire_in', 'Your boost will expire in', 'Je boost verloopt over', 'Votre boost expirera dans', 'Seu impulso expirará em'),
(1173, '', NULL, 'hide', 'Hide', 'Verbergen', 'Cacher', 'ocultar'),
(1174, '', NULL, 'you_reach_the_max_of_swipes_per_day._you_have_to_wait__0__hours_before_you_can_redo_likes_or_upgrade_to_pro_to_for_unlimited.', 'You have reached the maximum amuont of swipes per day, you have to wait {0} hours before you can redo swipes, OR upgrade now to Pro Membership for unlimited swipes and likes.', 'Je hebt de maximale hoeveelheid swipes per dag bereikt, je moet {0} uur wachten voordat je veegbewegingen opnieuw kunt uitvoeren OF OF nu upgraden naar Pro-lidmaatschap voor onbeperkte swipes en vind-ik-leuks.', 'Vous avez atteint le maximum de balayages par jour, vous devez patienter {0} heures avant de pouvoir refaire les balayages, OU passer maintenant à l’abonnement Pro pour des balayages et des goûts illimités.', 'Você atingiu a quantidade máxima de furtos por dia, precisa esperar {0} horas antes de refazer furtos ou fazer upgrade agora para a Associação Pro para furtos e curtidas ilimitados.'),
(1175, '', NULL, 'your_payment_was_processed_successfully.', 'Your payment was successfully processed.', 'Uw betaling is verwerkt.', 'Votre paiement a été traité avec succès.', 'Seu pagamento foi processado com sucesso.'),
(1176, '', NULL, 'sms', 'SMS', 'sms', 'SMS', 'SMS'),
(1177, '', NULL, 'sent_you_message_', 'sent you a message!', 'heeft je een bericht gestuurd!', 'Vous a envoyé un message!', 'lhe enviou uma mensagem!'),
(1178, '', NULL, 'sent_you_a_message_', 'sent you a message!', 'heeft je een bericht gestuurd!', 'Vous a envoyé un message!', 'lhe enviou uma mensagem!'),
(1179, '', NULL, 'accept', 'Accept', 'Aanvaarden', 'Acceptez', 'Aceitar'),
(1180, '', NULL, 'decline', 'Decline', 'Afwijzen', 'Déclin', 'Declínio'),
(1181, '', NULL, 'calling', 'Calling', 'Roeping', 'Appel', 'Chamando'),
(1182, '', NULL, 'please_wait_for_your_friend_answer.', 'Please wait for your friend\'s answer.', 'Wacht alstublieft op het antwoord van uw vriend.', 'S\'il vous plaît attendre la réponse de votre ami.', 'Por favor, aguarde a resposta do seu amigo.'),
(1183, '', NULL, 'no_answer', 'No answer', 'Geen antwoord', 'Pas de réponse', 'Sem resposta'),
(1184, '', NULL, 'please_try_again_later.', 'Please try again later.', 'Probeer het later opnieuw.', 'Veuillez réessayer plus tard.', 'Por favor, tente novamente mais tarde.'),
(1185, '', NULL, 'new_video_call', 'New incoming video call', 'Nieuw binnenkomend videogesprek', 'Nouvel appel vidéo entrant', 'Nova chamada de vídeo recebida'),
(1186, '', NULL, 'wants_to_video_chat_with_you.', 'wants to video chat with you.', 'wil videochatten met jou.', 'veut discuter par vidéo avec vous.', 'quer bater papo por vídeo com você.'),
(1187, '', NULL, 'call_declined', 'Call declined', 'Oproep geweigerd', 'Appel refusé', 'Chamada recusada'),
(1188, '', NULL, 'the_recipient_has_declined_the_call__please_try_again_later.', 'The recipient has declined the call, please try again later.', 'De ontvanger heeft de oproep geweigerd. Probeer het later opnieuw.', 'Le destinataire a refusé l\'appel. Veuillez réessayer ultérieurement.', 'O destinatário recusou a chamada, tente novamente mais tarde.'),
(1189, '', NULL, 'accept___start', 'Accept & Start', 'Accepteren en starten', 'Accepter et démarrer', 'Aceitar e começar'),
(1190, '', NULL, 'answered__', 'Answered!', 'Beantwoord!', 'Répondu!', 'Respondidas!'),
(1191, '', NULL, 'please_wait..', 'Please wait..', 'Even geduld aub..', 'S\'il vous plaît, attendez..', 'Por favor, espere..'),
(1192, '', NULL, 'video_call', 'Video Call', 'Video-oproep', 'Appel vidéo', 'Video chamada'),
(1193, '', NULL, 'new_audio_call', 'New incoming audio call', 'Nieuwe inkomende audio-oproep', 'Nouvel appel audio entrant', 'Nova chamada de áudio recebida'),
(1194, '', NULL, 'wants_to_talk_with_you.', 'wants to talk with you.', 'wil met je praten.', 'veut parler avec toi.', 'quer falar com você.'),
(1195, '', NULL, 'audio_call', 'Audio call', 'Audio-oproep', 'Appel audio', 'Chamada de áudio'),
(1196, '', NULL, 'talking_with', 'talking with', 'praten met', 'parler avec', 'conversando com'),
(1197, '', NULL, 'this_website_uses_cookies_to_ensure_you_get_the_best_experience_on_our_website.', 'This website uses cookies to ensure you get the best experience on our website.', 'Deze website maakt gebruik van cookies om ervoor te zorgen dat u de beste ervaring op onze website krijgt.', 'Ce site utilise des cookies pour vous garantir la meilleure expérience sur notre site.', 'Este site usa cookies para garantir que você obtenha a melhor experiência em nosso site.'),
(1198, '', NULL, 'got_it_', 'Got It!', 'Begrepen!', 'Je l\'ai!', 'Consegui!'),
(1199, '', NULL, 'learn_more', 'Learn More', 'Kom meer te weten', 'Apprendre encore plus', 'Saber mais'),
(1200, '', NULL, 'no_result_found', 'No result found', 'geen resultaat gevonden', 'Aucun résultat trouvé', 'nenhum resultado encontrado'),
(1201, '', NULL, 'send_gif', 'Send GIF', 'Verzend GIF', 'Envoyer un GIF', 'Enviar GIF'),
(1202, '', NULL, 'search_gifs', 'Search GIFs', 'Zoek GIF\'s', 'Rechercher des GIF', 'Pesquisar GIFs'),
(1203, '', NULL, 'sticker_added', 'Sticker added', 'Sticker toegevoegd', 'Sticker ajouté', 'Etiqueta adicionada'),
(1204, '', NULL, 'your_phone_number_is_required.', 'Your phone number is required.', 'Uw telefoonnummer is verplicht', 'Votre numéro de téléphone est requis.', 'Seu número de telefone é obrigatório.'),
(1205, '', NULL, 'select_your_country.', 'Please select your country.', 'Selecteer uw land alstublieft.', 'S\'il vous plaît sélectionnez votre pays.', 'Por favor selecione seu país.'),
(1206, '', NULL, 'select_your_birth_date.', 'Please select your birthday.', 'Selecteer alstublieft uw geboortedatum', 'S\'il vous plaît sélectionnez votre anniversaire.', 'Por favor, selecione seu aniversário.'),
(1207, '', NULL, 'my_location', 'My Location', 'Mijn locatie', 'Ma position', 'Minha localização'),
(1208, '', NULL, 'or', 'OR', 'OF', 'OU', 'OU'),
(1209, '', NULL, 'instagram', 'Instagram', 'Instagram', 'Instagram', 'Instagram'),
(1210, '', NULL, 'disable', 'disable', 'onbruikbaar maken', 'désactiver', 'desativar'),
(1211, '', NULL, 'enable', 'enable', 'in staat stellen', 'activer', 'habilitar'),
(1212, '', NULL, 'travel_to_another_country__and_relocate_', 'Travel to another country, and relocate!', 'Reis naar een ander land en verplaats je!', 'Voyagez dans un autre pays et déplacez-vous!', 'Viaje para outro país e mude de lugar!'),
(1213, 'gender', NULL, '4525', 'Male', 'Mannetje', 'Mâle', 'Masculino'),
(1214, 'gender', NULL, '4526', 'Female', 'Vrouw', 'Femelle', 'Fêmea'),
(1215, '', NULL, 'about_you', 'About You', 'Over jou', 'Au propos de vous', 'Sobre você'),
(1216, '', NULL, 'km', 'km', 'km', 'km', 'km'),
(1217, '', NULL, 'message_requests', 'Message requests', 'Berichtverzoeken', 'Demandes de message', 'Pedidos de mensagem'),
(1218, '', NULL, 'all_conversations', 'All conversations', 'Alle gesprekken', 'Toutes les conversations', 'Todas as conversas'),
(1219, '', NULL, 'you_can_chat_with_this_user_after', 'You can chat with this profile after', 'Je kunt na dit chatten met dit profiel', 'Vous pouvez discuter avec ce profil après', 'Você pode conversar com este perfil depois'),
(1220, '', NULL, 'hours.', 'hours.', 'uur.', 'heures.', 'horas.'),
(1221, '', NULL, 'this_user_decline_your_chat_before_so_you_can_chat_with_this_user_after', 'This user has declined your chat before, you\'ll be able to chat with this user after', 'Deze gebruiker heeft je chat eerder afgewezen, je kunt hierna met deze gebruiker chatten', 'Cet utilisateur a déjà refusé votre chat, vous pourrez discuter avec lui après', 'Este utilizador recusou o seu chat antes, poderá conversar com este utilizador depois'),
(1222, '', NULL, 'active', 'active', 'actief', 'actif', 'ativo'),
(1223, '', NULL, 'declined', 'Declined', 'Afgewezen', 'Diminué', 'Recusado'),
(1224, '', NULL, 'pending', 'Pending', 'In afwachting', 'en attendant', 'Pendente'),
(1225, '', NULL, 'night_mode', 'Night mode', 'Nachtstand', 'Mode nuit', 'Modo noturno'),
(1226, '', NULL, 'day_mode', 'Day mode', 'Dagmodus', 'Mode jour', 'Modo dia'),
(1227, '', NULL, 'we___ll_be_back_soon_', 'We’ll be back soon!', 'We zullen snel terug zijn!', 'Nous reviendrons bientôt!', 'Voltaremos em breve!'),
(1228, '', NULL, 'sorry_for_the_inconvenience_but_we_rsquo_re_performing_some_maintenance_at_the_moment._if_you_need_help_you_can_always', 'Sorry for the inconvenience but we\'re performing some maintenance at the moment. If you need help you can always', 'Sorry voor het ongemak maar we voeren momenteel wat onderhoud uit. Als je hulp nodig hebt, kan dat altijd', 'Désolé pour le désagrément, mais nous effectuons actuellement des travaux de maintenance. Si vous avez besoin d\'aide, vous pouvez toujours', 'Desculpe pela inconveniência, mas estamos realizando alguma manutenção no momento. Se você precisar de ajuda, você sempre pode'),
(1229, '', NULL, 'otherwise_we_rsquo_ll_be_back_online_shortly_', 'otherwise we\'ll be back online shortly!', 'anders zijn we binnenkort weer online!', 'sinon nous serons de retour en ligne sous peu!', 'caso contrário, estaremos de volta online em breve!'),
(1230, '', NULL, 'declined_your_message_request_', 'declined your message request!', 'heeft uw berichtverzoek geweigerd!', 'a refusé votre demande de message!', 'recusou o seu pedido de mensagem!'),
(1231, '', NULL, 'accepted_your_message_request_', 'accepted your message request!', 'accepteerde uw berichtaanvraag!', 'accepté votre demande de message!', 'aceitou o seu pedido de mensagem!'),
(1232, '', NULL, 'we_have_rejected_your_bank_transfer__please_contact_us_for_more_details', 'We have rejected your bank transfer, please contact us for more details.', 'We hebben uw overboeking geweigerd. Neem contact met ons op voor meer informatie.', 'Nous avons refusé votre virement bancaire, veuillez nous contacter pour plus de détails.', 'Rejeitamos sua transferência bancária. Entre em contato para mais detalhes.'),
(1233, '', NULL, 'we_approved_your_bank_transfer_of__d_', 'We approved your bank transfer of %d!', 'We hebben uw overboeking van %d goedgekeurd!', 'Nous avons approuvé votre virement bancaire de %d!', 'Nós aprovamos sua transferência bancária de %d!'),
(1234, '', NULL, 'note', 'Note', 'Notitie', 'Remarque', 'Nota'),
(1235, '', NULL, 'delete_chat', 'Delete chat', 'Verwijder chat', 'Supprimer le chat', 'Excluir bate-papo'),
(1236, '', NULL, 'your_x3_matches_will_expire_in', 'Your x3 matches will expire in', 'Je x3-wedstrijden verlopen in', 'Vos matchs x3 expireront dans', 'Suas partidas x3 expiram em'),
(1237, '', NULL, 'to_get_your_profile_verified_you_have_to_verify_these.', 'To get your profile verified you have to verify these.', 'Om je profiel geverifieerd te krijgen, moet je deze verifiëren.', 'Pour que votre profil soit vérifié, vous devez les vérifier.', 'Para ter seu perfil verificado, você precisa verificar isso.'),
(1238, '', NULL, 'upload_at_least_5_image.', 'Upload at least 5 image.', 'Upload minimaal 5 afbeeldingen.', 'Téléchargez au moins 5 images.', 'Carregue pelo menos 5 imagens.'),
(1239, '', NULL, 'unblock', 'Unblock', 'deblokkeren', 'Débloquer', 'Desbloquear'),
(1240, '', NULL, 'phone_number__e.g__90..', 'Phone number, e.g +90..', 'Telefoonnummer, bijvoorbeeld +90 ..', 'Numéro de téléphone, par exemple +90 ..', 'Número de telefone, por exemplo, +90.'),
(1241, '', NULL, 'phone_verification_needed', 'Phone verification required', 'Telefonische verificatie vereist', 'Vérification téléphonique requise', 'Confirmação de telefone necessária'),
(1242, '', NULL, 'phone', 'Phone', 'Telefoon', 'Téléphone', 'telefone'),
(1243, '', NULL, 'send_otp', 'Send OTP', 'Stuur OTP', 'Envoyer OTP', 'Enviar OTP'),
(1244, '', NULL, 'phone_activiation_', 'Phone activiation,', 'Telefoonactivatie,', 'Activation du téléphone,', 'Ativação por telefone,'),
(1245, '', NULL, 'please_enter_the_verification_code_sent_to_your_phone', 'Please enter the verification code that was sent to your phone. ', 'Voer de verificatiecode in die naar uw telefoon is verzonden.', 'Veuillez entrer le code de vérification qui a été envoyé sur votre téléphone.', 'Digite o código de verificação que foi enviado para o seu telefone.'),
(1246, '', NULL, 'resend', 'Re-send', 'Opnieuw versturen', 'Renvoyer', 'Reenviar'),
(1247, '', NULL, 'please_verify_your_email_address', 'Please verify your email address.', 'Verifieer uw email adres alstublieft.', 'Veuillez vérifier votre adresse e-mail.', 'Por favor verifique seu endereço de email.'),
(1248, '', NULL, 'error_while_sending_an_sms__please_try_again_later.', 'Error while sending the SMS, please try again later.', 'Fout tijdens het verzenden van de sms, probeer het later opnieuw.', 'Erreur lors de l\'envoi du SMS, veuillez réessayer ultérieurement.', 'Erro ao enviar o SMS, tente novamente mais tarde.'),
(1249, '', NULL, 'error_while_submitting_form.', 'Error while submitting form.', 'Fout bij het verzenden van het formulier.', 'Erreur lors de la soumission du formulaire.', 'Erro ao enviar o formulário.'),
(1250, '', NULL, 'email_verification_needed', 'Email verification required', 'E-mailverificatie vereist', 'Vérification d\'email requise', 'Confirmação de email obrigatória'),
(1251, '', NULL, 'email_activiation_', 'Email activiation,', 'E-mailactivatie,', 'Activation du courrier électronique,', 'Ativação de email,'),
(1252, '', NULL, 'please_enter_the_verification_code_sent_to_your_email', 'Please enter the verification code that was sent to your E-mail.', 'Voer de verificatiecode in die naar uw e-mailadres is verzonden.', 'Veuillez entrer le code de vérification qui a été envoyé à votre adresse e-mail.', 'Por favor insira o código de verificação que foi enviado para o seu E-mail.'),
(1253, '', NULL, 'video_and_audio_calls_to_all_users', 'Create unlimited video and audio calls.', 'Creëer onbeperkt video- en audio-oproepen.', 'Créez des appels vidéo et audio illimités.', 'Crie chamadas ilimitadas de vídeo e áudio.'),
(1254, '', NULL, 'latest_users', 'Latest Users', 'Laatste gebruikers', 'Derniers utilisateurs', 'Usuários mais recentes'),
(1255, '', NULL, 'wanna_get_more__get_new_stickers_for', 'Wanna get more? get new stickers for', 'Wil je meer krijgen? krijg nieuwe stickers voor', 'Tu veux en avoir plus? obtenir de nouveaux autocollants pour', 'Queres mais? obter novos adesivos para'),
(1256, '', NULL, 'this_image_now_is_private.', 'This photo is private.', 'Deze foto is privé.', 'Cette photo est privée.', 'Esta foto é privada.'),
(1257, '', NULL, 'emails', 'Emails', 'emails', 'Courriels', 'Emails'),
(1258, '', NULL, 'email_me_when_someone_views_your_profile', 'Email me when someone views my profile.', 'E-mail mij als iemand mijn profiel bekijkt.', 'Envoyez-moi un email quand quelqu\'un regarde mon profil.', 'Envie-me um email quando alguém visualizar meu perfil.'),
(1259, '', NULL, 'email_me_when_you_get_a_new_message', 'Email me when I get a new message.', 'E-mail mij als ik een nieuw bericht ontvang.', 'Email moi quand je reçois un nouveau message.', 'Envie-me um email quando receber uma nova mensagem.'),
(1260, '', NULL, 'email_me_when_someone_like_your_profile', 'Email me when someone like me.', 'E-mail mij als iemand zoals ik.', 'Email moi quand quelqu\'un comme moi.', 'Envie-me um email quando alguém como eu.'),
(1261, '', NULL, 'email_me_purchase_notifications', 'Email me my purchase notifications.', 'Stuur me een e-mail met mijn aankoopmeldingen.', 'Envoyez-moi mes notifications d\'achat.', 'Envie-me minhas notificações de compra.'),
(1262, '', NULL, 'email_me_special_offers___promotions', 'Email me special offers & promotions.', 'E-mail mij speciale aanbiedingen & promoties.', 'Envoyez-moi des offres spéciales & promotions.', 'Envie-me um email com ofertas especiais & promoções.'),
(1263, '', NULL, 'email_me_feature_announcements', 'Email me future announcements.', 'E-mail mij toekomstige aankondigingen.', 'Envoyez-moi des annonces futures.', 'Envie-me futuros anúncios.'),
(1264, '', NULL, 'email_me_when_someone_like_my_profile', 'Email me when someone like my profile.', 'E-mail mij als iemand mijn profiel leuk vindt.', 'Envoyez-moi un courriel lorsque quelqu\'un aime mon profil.', 'Envie-me um email quando alguém gostar do meu perfil.'),
(1265, '', NULL, 'email_me_when_i_get_new_gift', 'Email me when I get a new gift.', 'E-mail mij als ik een nieuw cadeau ontvang.', 'Email moi quand je reçois un nouveau cadeau.', 'Envie-me um email quando eu receber um novo presente.'),
(1266, '', NULL, 'email_me_when_i_get_new_match', 'Email me when I get a new match.', 'E-mail mij als ik een nieuwe match krijg.', 'Ecrivez-moi quand je reçois un nouveau match.', 'Envie-me um email quando obtiver um novo jogo.'),
(1267, '', NULL, 'email_me_when_i_get_new_chat_request', 'Email me when I get a new chat request.', 'E-mail mij als ik een nieuw chatverzoek ontvang.', 'Envoyez-moi un email quand je reçois une nouvelle demande de chat.', 'Envie-me um email quando obtiver um novo pedido de chat.'),
(1268, '', NULL, 'why__0__is_best', 'Why {0} is Best', 'Waarom {0} het beste is', 'Pourquoi {0} est le meilleur', 'Por que {0} é o melhor'),
(1269, '', NULL, 'your_account_is_safe_on__0_._we_never_share_your_data_with_third_party.', 'Your account is safe on {0}. We never share your data with third party.', 'Je account is veilig op {0}. Wij delen uw gegevens nooit met derden.', 'Votre compte est en sécurité le {0}. Nous ne partageons jamais vos données avec des tiers.', 'Sua conta está segura em {0}. Nós nunca compartilhamos seus dados com terceiros.'),
(1270, '', NULL, 'connect_with_your_perfect_soulmate_here__on__0_.', 'Connect with your perfect Soulmate here, on {0}.', 'Maak hier verbinding met je perfecte Soulmate, op {0}.', 'Connectez-vous avec votre âme sœur parfaite ici, sur {0}.', 'Conecte-se com seu Soulmate perfeito aqui, em {0}.'),
(1271, '', NULL, 'verification', 'Verification', 'Verificatie', 'Vérification', 'Verificação'),
(1272, '', NULL, 'you_have_been_exceed_the_activation_request_limit.', 'You have exceeded the activation request limit.', 'U hebt de activeringsverzoeklimiet overschreden.', 'Vous avez dépassé la limite de demande d\'activation.', 'Você excedeu o limite de solicitações de ativação.'),
(1273, '', NULL, 'you_have_to_wait', 'You have to wait', 'Je moet wachten', 'Vous devez attendre', 'Você tem que esperar'),
(1274, '', NULL, 'minutes_before_you_try_to_activate_again.', 'minutes before you try to activate again.', 'minuten voordat u opnieuw probeert te activeren.', 'minutes avant d\'essayer d\'activer à nouveau.', 'minutos antes de tentar ativar novamente.'),
(1275, '', NULL, 'we_have_rejected_your_bank_transfer__please_contact_us_for_more_details.', 'We have rejected your bank transfer, please contact us for more details.', 'We hebben uw overboeking afgewezen. Neem contact met ons op voor meer informatie.', 'Nous avons refusé votre virement bancaire, veuillez nous contacter pour plus de détails.', 'Rejeitamos sua transferência bancária. Entre em contato para mais detalhes.'),
(1276, '', NULL, 'you_transmitting_spam_messages._the_system_automatically_restricts_chat_for_you__so_you_can_chat_again_after', 'You transmitting spam messages. the system automatically restricts chat for you, so you can chat again after', 'U verzendt spam-berichten. het systeem beperkt automatisch de chat voor u, zodat u later opnieuw kunt chatten', 'Vous transmettez des messages de spam. le système restreint automatiquement le chat pour que vous puissiez discuter à nouveau après', 'Você está transmitindo mensagens de spam. o sistema restringe automaticamente o bate-papo para você, para que você possa conversar novamente depois'),
(1277, '', NULL, 'options', 'options', 'opties', 'options', 'opções'),
(1278, '', NULL, 'blog', 'Blog', 'blog', 'Blog', 'Blog'),
(1279, '', NULL, 'success_stories', 'Success stories', 'Succesverhalen', 'Réussites', 'Histórias de sucesso'),
(1280, '', NULL, 'add_new_story', 'Add your story', 'Voeg je verhaal toe', 'Ajoutez votre histoire', 'Adicione sua história'),
(1281, '', NULL, 'create_story', 'Create story', 'Maak een verhaal', 'Créer une histoire', 'Criar história'),
(1282, '', NULL, 'no_more_stories_to_show.', 'No more stories to show.', 'Geen verhalen meer om te laten zien.', 'Pas plus d\'histoires à montrer.', 'Não há mais histórias para mostrar.'),
(1283, '', NULL, 'add_new_success_stories', 'Add your successful story', 'Voeg uw succesvolle verhaal toe', 'Ajoutez votre histoire réussie', 'Adicione sua história de sucesso'),
(1284, '', NULL, 'story__html_allowed_', 'Story (HTML allowed)', 'Verhaal (HTML toegestaan)', 'Histoire (HTML autorisé)', 'História (HTML permitido)'),
(1285, '', NULL, 'quote', 'Quote', 'Citaat', 'Citation', 'Citar'),
(1286, '', NULL, 'story_date', 'When this story happened?', 'Toen dit verhaal gebeurde?', 'Quand cette histoire s\'est-elle passée?', 'Quando esta história aconteceu?'),
(1287, '', NULL, 'please_select_user_first.', 'Please choose with whom you had this story.', 'Kies met wie je dit verhaal had.', 'S\'il vous plaît choisir avec qui vous avez eu cette histoire.', 'Por favor, escolha com quem você teve essa história.'),
(1288, '', NULL, 'please_select_when_story_started.', 'Please select when the story occurred.', 'Selecteer wanneer het verhaal zich voordeed.', 'Veuillez choisir quand l\'histoire a eu lieu.', 'Por favor, selecione quando a história ocorreu.'),
(1289, '', NULL, 'please_enter_quote.', 'Please enter a quote.', 'Voer een offerte in.', 'S\'il vous plaît entrer un devis.', 'Por favor insira uma cotação.'),
(1290, '', NULL, 'please_enter_your_story.', 'Please enter your story.', 'Voer je verhaal in.', 'S\'il vous plaît entrez votre histoire.', 'Por favor, insira sua história.'),
(1291, '', NULL, 'story_add_successfully', 'Your story has been added successfully.', 'Je verhaal is succesvol toegevoegd.', 'Votre histoire a été ajoutée avec succès.', 'Sua história foi adicionada com sucesso.'),
(1292, '', NULL, 'story_add_successfully__please_wait_while_admin_approve_this_story_and_it_will_show_on_site.', 'Your story has been added successfully, please wait while we review your story and approve it.', 'Je verhaal is succesvol toegevoegd. Een ogenblik geduld. We beoordelen je verhaal en keuren het goed.', 'Votre récit a été ajouté avec succès. Veuillez patienter pendant que nous examinons votre récit et l’approuvons.', 'Sua história foi adicionada com sucesso. Aguarde enquanto analisamos sua história e a aprovamos.'),
(1293, '', NULL, 'story', 'Story', 'Verhaal', 'Récit', 'História'),
(1294, '', NULL, '1309', 'Comedy', 'Komedie', 'La comédie', 'Comédia'),
(1295, '', NULL, '1310', 'Cars and Vehicles', 'Auto\'s en voertuigen', 'Voitures et véhicules', 'Carros e Veículos'),
(1296, '', NULL, '1311', 'Economics and Trade', 'Economie en handel', 'Économie et commerce', 'Economia e Comércio'),
(1297, '', NULL, '1312', 'Education', 'Opleiding', 'Éducation', 'Educação'),
(1298, '', NULL, '1313', 'Entertainment', 'vermaak', 'Divertissement', 'Entretenimento'),
(1299, '', NULL, '1314', 'Movies & Animation', 'Films & amp; animatie', 'Films & amp; Animation', 'Filmes e amp; Animação'),
(1300, '', NULL, '1315', 'Gaming', 'gaming', 'Jeu', 'Jogos'),
(1301, '', NULL, '1316', 'History and Facts', 'Geschiedenis en feiten', 'Histoire et faits', 'História e Fatos'),
(1302, '', NULL, '1317', 'Live Style', 'Levensstijl', 'Style de vie', 'Estilo Vivo'),
(1303, '', NULL, '1318', 'Natural', 'natuurlijk', 'Naturel', 'Natural'),
(1304, '', NULL, '1319', 'News and Politics', 'Nieuws en politiek', 'Nouvelles et politique', 'Notícias e Política'),
(1305, '', NULL, '1320', 'People and Nations', 'Mensen en naties', 'Peuples et Nations', 'Pessoas e Nações'),
(1306, '', NULL, '1321', 'Pets and Animals', 'Huisdieren en dieren', 'Animaux et Animaux', 'Animais de Estimação e Animais'),
(1307, '', NULL, '1322', 'Places and Regions', 'Plaatsen en regio\'s', 'Lieux et régions', 'Lugares e Regiões'),
(1308, '', NULL, '1323', 'Science and Technology', 'Wetenschap en technologie', 'Science et technologie', 'Ciência e Tecnologia'),
(1309, '', NULL, '1324', 'Sport', 'Sport', 'sport', 'Esporte'),
(1310, '', NULL, '1325', 'Travel and Events', 'Reizen en evenementen', 'Voyage et événements', 'Viagens e Eventos'),
(1311, '', NULL, '1326', 'Other', 'anders', 'Autre', 'De outros'),
(1312, '', NULL, 'read_more', 'Read more', 'Lees verder', 'Lire la suite', 'Consulte Mais informação'),
(1313, '', NULL, 'categories', 'Categories', 'Categorieën', 'Les catégories', 'Categorias'),
(1314, '', NULL, 'no_more_articles_to_show.', 'No more articles to show.', 'Geen artikelen meer om te tonen.', 'Pas plus d\'articles à montrer.', 'Não há mais artigos para mostrar.'),
(1315, '', NULL, 'article', 'Article', 'Artikel', 'Article', 'Artigo'),
(1316, '', NULL, 'share_to', 'Share to', 'Delen naar', 'Partager à', 'Compartilhar com'),
(1317, '', NULL, 'hot_or_not', 'Hot OR Not', 'Heet of niet', 'Chaud ou pas', 'Quente ou não'),
(1318, '', NULL, 'image_verification', 'Image Verification', 'foto verificatie', 'verification de l\'image', 'Verificação de Imagem'),
(1319, '', NULL, 'verify_your', 'Verify your', 'Verifieer jouw', 'Vérifier votre', 'Verificar o seu'),
(1320, '', NULL, 'account', 'account', 'account', 'Compte', 'conta'),
(1321, '', NULL, 'you_will_be_required_to_take_a_selfie_holding_the_id_document_next_to_your_face__so_we_can_compare_your_photo_with_your_actual_look.this_is_just_an_additional_security_measure', 'You will be required to take a selfie holding the ID document next to your face, so we can compare your photo with your actual look. This is just an additional security measure.', 'U moet een selfie maken met het ID-document naast uw gezicht, zodat we uw foto kunnen vergelijken met uw werkelijke look. Dit is slechts een extra beveiligingsmaatregel.', 'Il vous sera demandé de prendre un selfie avec le document d\'identité à côté de votre visage afin que nous puissions comparer votre photo avec votre apparence réelle. Ceci est juste une mesure de sécurité supplémentaire.', 'Você será solicitado a tirar uma selfie segurando o documento de identificação ao lado do seu rosto, para que possamos comparar sua foto com sua aparência real. Esta é apenas uma medida de segurança adicional.'),
(1322, '', NULL, 'take_snapshot', 'Take Snapshot', 'Maak snapshot', 'Prendre un instantané', 'Tire uma foto rápida'),
(1323, '', NULL, 'retake_snapshot', 'Retake Snapshot', 'Snapshot opnieuw maken', 'Reprendre un instantané', 'Recolher instantâneo'),
(1324, '', NULL, 'back', 'Back', 'Terug', 'Retour', 'De volta'),
(1325, '', NULL, 'keyword', 'Keyword', 'keyword', 'Mot-clé', 'Palavra chave'),
(1326, '', NULL, 'no_articles_found', 'No articles found', 'Geen artikelen gevonden', 'Aucun article trouvé', 'Nenhum artigo encontrado'),
(1327, '', NULL, 'tags', 'Tags', 'Tags', 'Mots clés', 'Tag'),
(1328, '', NULL, 'free', 'Free', 'Gratis', 'Libre', 'Livre'),
(1329, '', NULL, 'brings_out_the_sense_of_adventure_in_me__the_website_is_so_easy_to_use_and_the_possibility_of_meeting_someone_from_another_culture_that_relates_to_me_is_simply_thrilling.', 'Brings out the sense of adventure in me! The website is so easy to use and the possibility of meeting someone from another culture that relates to me is simply thrilling.', 'Brengt het gevoel van avontuur in mij naar boven! De website is zo gemakkelijk te gebruiken en de mogelijkheid om iemand te ontmoeten uit een andere cultuur die op mij betrekking heeft, is gewoon opwindend.', 'Fait ressortir le sens de l\'aventure en moi! Le site Web est si facile à utiliser et la possibilité de rencontrer quelqu\'un d\'une autre culture qui me concerne est tout simplement excitante.', 'Traz a sensação de aventura em mim! O site é tão fácil de usar e a possibilidade de conhecer alguém de outra cultura que se relaciona comigo é simplesmente emocionante.'),
(1330, '', NULL, 'brings_out_the_feelings_of_adventure_in_me__the_website_is_so_easy_to_use_and_the_possibility_of_meeting_someone_from_another_culture_that_relates_to_me_is_simply_thrilling.', 'Brings out the feelings of adventure in me! The website is so easy to use and the possibility of meeting someone from another culture that relates to me is simply thrilling.', 'Brengt de gevoelens van avontuur in mij naar boven! De website is zo gemakkelijk te gebruiken en de mogelijkheid om iemand te ontmoeten uit een andere cultuur die op mij betrekking heeft, is gewoon opwindend.', 'Fait ressortir les sentiments d\'aventure en moi! Le site Web est si facile à utiliser et la possibilité de rencontrer quelqu\'un d\'une autre culture qui me concerne est tout simplement excitante.', 'Traz os sentimentos de aventura em mim! O site é tão fácil de usar e a possibilidade de conhecer alguém de outra cultura que se relaciona comigo é simplesmente emocionante.'),
(1331, '', NULL, 'produce_out_the_sense_of_adventure_in_me__the_website_is_so_easy_to_use_and_the_possibility_of_meeting_someone_from_another_culture_that_relates_to_me_is_simply_thrilling.', 'produce out the sense of adventure in me! The website is so easy to use and the possibility of meeting someone from another culture that relates to me is simply thrilling.', 'produceer het gevoel van avontuur in mij! De website is zo gemakkelijk te gebruiken en de mogelijkheid om iemand te ontmoeten uit een andere cultuur die op mij betrekking heeft, is gewoon opwindend.', 'Produire le sens de l\'aventure en moi! Le site Web est si facile à utiliser et la possibilité de rencontrer quelqu\'un d\'une autre culture qui me concerne est tout simplement excitante.', 'produzir o senso de aventura em mim! O site é tão fácil de usar e a possibilidade de conhecer alguém de outra cultura que se relaciona comigo é simplesmente emocionante.'),
(1332, '', NULL, 'bring_out_the_sense_of_adventure_in_me__the_website_is_so_easy_to_use_and_the_possibility_of_meeting_someone_from_another_culture_that_relates_to_me_is_simply_thrilling.', 'bring out the sense of adventure in me! The website is so easy to use and the possibility of meeting someone from another culture that relates to me is simply thrilling.', 'breng het gevoel van avontuur in mij naar boven! De website is zo gemakkelijk te gebruiken en de mogelijkheid om iemand te ontmoeten uit een andere cultuur die op mij betrekking heeft, is gewoon opwindend.', 'faire ressortir le sens de l\'aventure en moi! Le site Web est si facile à utiliser et la possibilité de rencontrer quelqu\'un d\'une autre culture qui me concerne est tout simplement excitante.', 'traga a sensação de aventura em mim! O site é tão fácil de usar e a possibilidade de conhecer alguém de outra cultura que se relaciona comigo é simplesmente emocionante.'),
(1333, '', NULL, 'this_profile_is_verified_by_photos', 'This profile is verified by user picture. ', 'Dit profiel is geverifieerd door gebruikersfoto.', 'Ce profil est vérifié par la photo de l\'utilisateur.', 'Este perfil é verificado pela foto do usuário.'),
(1334, '', NULL, 'your_account_wait_admin_photo_verification._please_try_again_later.', 'Your account is under review, Please wait until we review your picture and try again later.', 'Uw account wordt beoordeeld. Wacht tot we uw foto hebben beoordeeld en probeer het later opnieuw.', 'Votre compte est en cours de révision. Veuillez patienter jusqu\'à ce que nous examinions votre photo, puis réessayez ultérieurement.', 'Sua conta está em revisão. Aguarde até revisarmos sua foto e tentarmos mais tarde.'),
(1335, '', NULL, 'your_camera_is_off_or_disconnected__please_connect_your_camera_and_try_again.', 'Your camera is off or disconnected, Please connect your camera and try again.', 'Uw camera is uitgeschakeld of de verbinding is verbroken. Sluit uw camera aan en probeer het opnieuw.', 'Votre appareil photo est éteint ou déconnecté. Veuillez connecter votre appareil photo et réessayer.', 'Sua câmera está desligada ou desconectada. Conecte sua câmera e tente novamente.'),
(1336, '', NULL, 'try_again', 'Try again', 'Probeer het opnieuw', 'Réessayer', 'Tente novamente'),
(1337, '', NULL, 'you_have_previous_story_with_this_user', 'You have previous story with this user', 'Je hebt een eerder verhaal met deze gebruiker', 'Vous avez une histoire précédente avec cet utilisateur', 'Você tem uma história anterior com este usuário'),
(1338, '', NULL, 'with', 'With', 'Met', 'Avec', 'Com'),
(1339, '', NULL, 'create_story_with_you', 'created a story with you.', 'creëerde een verhaal met jou.', 'créé une histoire avec vous.', 'criou uma história com você.'),
(1340, '', NULL, 'approved_your_story_', 'approved your story!', 'heeft je verhaal goedgekeurd!', 'approuvé votre histoire!', 'aprovou sua história!'),
(1341, '', NULL, 'has_rejected_your_story.', 'has rejected your story.', 'heeft je verhaal afgewezen.', 'a rejeté votre histoire.', 'rejeitou sua história.'),
(1342, '', NULL, 'approve_story', 'Approve story', 'Goedkeuren verhaal', 'Approuver l\'histoire', 'Aprovar história'),
(1343, '', NULL, 'disapprove_story', 'Disapprove story', 'Verwerp verhaal', 'Désapprouver l\'histoire', 'Reprovar história'),
(1344, '', NULL, 'you_have_story_with', 'You have a story with', 'Je hebt een verhaal met', 'Vous avez une histoire avec', 'Você tem uma história com'),
(1345, '', NULL, 'on', 'on', 'op', 'sur', 'em'),
(1346, '', NULL, 'story_approved_successfully.', 'Your story has been approved.', 'Je verhaal is goedgekeurd.', 'Votre histoire a été approuvée.', 'Sua história foi aprovada.'),
(1347, '', NULL, 'story_disapproved_successfully.', 'Your story has been declined.', 'Je verhaal is afgewezen.', 'Votre histoire a été refusée.', 'Sua história foi recusada.'),
(1348, '', NULL, 'social_accounts', 'Social accounts', 'Sociale accounts', 'Comptes sociaux', 'Contas sociais'),
(1349, '', NULL, 'publish', 'Publish', 'Publiceren', 'Publier', 'Publicar'),
(1350, '', NULL, 'thank_you_for_your_story__we_have_sent_the_story_to__0___once_approved_your_story_will_be_published.', 'Thank you for your story, we have sent the story to {0}, once approved your story will be published.', 'Bedankt voor je verhaal, we hebben het verhaal naar {0} gestuurd, zodra goedgekeurd zal je verhaal worden gepubliceerd.', 'Merci pour votre histoire. Nous l’avons envoyée à {0}. Une fois approuvée, votre histoire sera publiée.', 'Obrigado pela sua história, enviamos a história para {0}, uma vez aprovada, sua história será publicada.'),
(1351, '', NULL, 'no_user_found_with_this_name', 'No user found with this name', 'Geen gebruiker gevonden met deze naam', 'Aucun utilisateur trouvé avec ce nom', 'Nenhum usuário encontrado com este nome'),
(1352, '', NULL, 'vk', 'VK', 'VK', 'VK', 'VK'),
(1353, '', NULL, 'type_a_message', 'Type a message', 'Type een bericht', 'Tapez un message', 'Digite uma mensagem'),
(1354, '', NULL, 'boost_for_free', 'Boost For Free', 'Boost For Free', 'Boostez gratuitement', 'Impulsionar For Free'),
(1355, '', NULL, 'boost_your_profile_for_free_for', 'Boost your profile for free for', 'Boost je profiel gratis voor', 'Boostez votre profil gratuitement pour', 'Impulsionar o seu perfil de graça para'),
(1356, '', NULL, 'this_profile_is_verified_by_phone', 'This profile is verified by phone', 'Dit profiel wordt gecontroleerd via de telefoon', 'Ce profil est vérifié par téléphone', 'Este perfil é verificada por telefone'),
(1357, '', NULL, 'your_height_is_required.', 'Your height is required.', 'Uw lengte is vereist.', 'Votre taille est nécessaire.', 'Sua altura é necessária.'),
(1358, '', NULL, 'name', 'Name', 'Naam', 'Nom', 'Nome'),
(1359, '', NULL, 'card_number', 'Card Number', 'Kaartnummer', 'Numéro de carte', 'Número do cartão'),
(1360, '', NULL, 'pay', 'Pay', 'Betalen', 'Payer', 'Pagar'),
(1361, '', NULL, 'please_check_your_details', 'Please check your details', 'Kijk alsjeblieft je gegevens na', 'S\'il vous plaît vérifier vos informations', 'Por favor, verifique seus dados'),
(1362, '', NULL, 'manage_sessions', 'Manage Sessions', 'Sessies beheren', 'Manage Sessions', 'Gerenciar sessões'),
(1363, '', NULL, 'platform', 'Platform', 'Platform', 'Plate-forme', 'Plataforma'),
(1364, '', NULL, 'last_seen', 'Last seen', 'Laatst gezien', 'Vu pour la dernière fois', 'Visto pela última vez'),
(1365, '', NULL, 'os', 'OS', 'DE', 'OS', 'OS'),
(1366, '', NULL, 'browser', 'Browser', 'browser', 'Navigateur', ''),
(1367, '', NULL, 'action', 'Action', 'Actie', 'Action', 'Açao'),
(1368, '', NULL, 'error_while_deleting_session__please_try_again_later.', 'Error while deleting session, please try again later.', 'Fout tijdens het verwijderen van de sessie. Probeer het later opnieuw.', 'Erreur lors de la suppression de la session, veuillez réessayer plus tard.', 'Erro ao excluir a sessão, tente novamente mais tarde.'),
(1369, '', NULL, 'session_deleted_successfully.', 'Session has been deleted successfully.', 'Sessie is succesvol verwijderd.', 'La session a été supprimée avec succès.', 'A sessão foi excluída com sucesso.'),
(1370, '', NULL, 'two-factor_authentication', 'Two-factor authentication', 'Twee-factor authenticatie', 'Authentification à deux facteurs', 'Autenticação de dois fatores'),
(1371, '', NULL, 'turn_on_2-step_login_to_level-up_your_account_s_security__once_turned_on__you_ll_use_both_your_password_and_a_6-digit_security_code_sent_to_your_phone_or_email_to_log_in.', 'Turn on 2-step login to level-up your account&#039;s security, Once turned on, you&#039;ll use both your password and a 6-digit security code sent to your phone or email to log in.', 'Schakel inloggen in twee stappen in om uw account een hoger niveau te geven', 'Activez la connexion en deux étapes pour augmenter votre compte', 'Ative o login em duas etapas para aumentar o nível da sua conta'),
(1372, '', NULL, 'two-factor_authentication_data_saved_successfully.', 'Two-factor authentication data saved successfully.', 'Twee-factor authenticatiegegevens succesvol opgeslagen.', 'Les données d&#39;authentification à deux facteurs ont bien été enregistrées.', 'Dados de autenticação de dois fatores salvos com sucesso.'),
(1373, '', NULL, 'a_confirmation_email_has_been_sent.', 'A confirmation email has been sent.', '', 'Un e-mail de confirmation a été envoyé.', 'Um email de confirmação foi enviado.'),
(1374, '', NULL, 'we_have_sent_an_email_that_contains_the_confirmation_code_to_enable_two-factor_authentication.', 'We have sent an email that contains the confirmation code to enable Two-factor authentication.', 'We hebben een e-mail verzonden met de bevestigingscode om tweefactorauthenticatie in te schakelen.', 'Nous avons envoyé un e-mail contenant le code de confirmation pour activer l&#39;authentification à deux facteurs.', 'Enviamos um email que contém o código de confirmação para ativar a autenticação de dois fatores.'),
(1375, '', NULL, 'confirmation_code', 'Confirmation code', 'Bevestigingscode', 'Confirmation code', 'Código de confirmação'),
(1376, '', NULL, 'please_check_your_details.', 'Please check your details.', 'Check alsjeblieft je gegevens.', 'S&#39;il vous plaît vérifier vos informations.', 'Por favor, verifique seus detalhes.'),
(1377, '', NULL, 'your_e-mail_has_been_successfully_verified.', 'Your e-mail has been successfully verified.', 'Uw e-mail is succesvol geverifieerd.', 'Votre e-mail a été vérifié avec succès.', 'Seu email foi verificado com sucesso.'),
(1378, '', NULL, 'phone_number_should_be_as_this_format___90..', 'Phone number should be as this format: +90..', 'Telefoonnummer moet als dit formaat zijn: 90 ..', 'Le numéro de téléphone doit être au format suivant: 90 ..', 'O número de telefone deve estar no seguinte formato: 90 ..'),
(1379, '', NULL, 'your_phone_number_and_e-mail_have_been_successfully_verified.', 'Your phone number and e-mail have been successfully verified.', 'Uw telefoonnummer en e-mailadres zijn succesvol geverifieerd.', 'Votre numéro de téléphone et votre e-mail ont été vérifiés avec succès.', 'Seu número de telefone e email foram verificados com sucesso.'),
(1380, '', NULL, 'unusual_login', 'Unusual Login', 'Ongebruikelijke login', 'Connexion inhabituelle', 'Login incomum'),
(1381, '', NULL, 'to_log_in__you_need_to_verify_your_identity.', 'To log in, you need to verify your identity.', 'Om in te loggen, moet u uw identiteit verifiëren.', 'Pour vous connecter, vous devez vérifier votre identité.', 'Para fazer login, você precisa verificar sua identidade.'),
(1382, '', NULL, 'we_have_sent_you_the_confirmation_code_to_your_phone_and_to_your_email_address.', 'We have sent you the confirmation code to your phone and to your email address.', 'We hebben u de bevestigingscode naar uw telefoon en naar uw e-mailadres gestuurd.', 'Nous vous avons envoyé le code de confirmation sur votre téléphone et sur votre adresse e-mail.', 'Nós enviamos o código de confirmação para o seu telefone e seu endereço de e-mail.'),
(1383, '', NULL, 'we_have_sent_you_the_confirmation_code_to_your_email_address.', 'We have sent you the confirmation code to your email address.', 'We hebben u de bevestigingscode naar uw e-mailadres gestuurd.', 'Nous vous avons envoyé le code de confirmation à votre adresse e-mail.', 'Enviámos o código de confirmação para o seu endereço de email.'),
(1384, '', NULL, 'please_enter_confirmation_code.', 'Please enter confirmation code.', 'Voer de bevestigingscode in.', 'Veuillez saisir le code de confirmation.', 'Digite o código de confirmação.'),
(1385, '', NULL, 'something_went_wrong__please_try_again_later.', 'Something went wrong, please try again later.', 'Er is iets misgegaan. Probeer het later opnieuw.', 'Quelque chose c&#39;est mal passé. Merci d&#39;essayer plus tard.', 'Ocorreu um erro. Tente novamente mais tarde.'),
(1386, '', NULL, 'wrong_confirmation_code.', 'Wrong confirmation code.', 'Verkeerde bevestigingscode.', 'Code de confirmation incorrect.', 'Código de confirmação incorreto.'),
(1387, '', NULL, 'error_while_login__please_try_again_later.', 'Error while login, please try again later.', 'Fout tijdens inloggen, probeer het later opnieuw.', 'Erreur lors de la connexion, veuillez réessayer plus tard.', 'Erro durante o login, tente novamente mais tarde.'),
(1388, '', NULL, 'invalid_user_id', 'Invalid User ID', 'Ongeldige gebruikersnaam', 'Identifiant invalide', 'ID de usuário inválido'),
(1389, '', NULL, 'invalid_confirmation_code', 'Invalid confirmation code', 'Ongeldige bevestigingscode', 'code de confirmation invalide', 'Código de confirmação inválido'),
(1390, '', NULL, 'find_potential_matches_by_country', 'Find potential matches by country', 'Vind potentiële overeenkomsten per land', 'Trouver des correspondances potentielles par pays', 'Encontre possíveis correspondências por país'),
(1391, '', NULL, 'manage_notifications', 'Manage Notifications', 'Beheer meldingen', 'Manage Notifications', 'Gerenciar notificações'),
(1392, '', NULL, 'custom_field', 'Custom field', 'Aangepast veld', 'Champ personnalisé', 'Campo customizado'),
(1393, '', NULL, 'food', 'food', 'voedsel', 'nourriture', ''),
(1394, '', NULL, 'add_media', 'Add Media', 'Voeg media toe', 'Ajouter des médias', 'Adicionar mídia'),
(1395, '', NULL, 'add_video', 'Add Video', 'Voeg video toe', 'Ajouter une vidéo', 'Adicionar vídeo'),
(1396, '', NULL, 'add_photo', 'Add Photo', 'Voeg foto toe', 'Ajouter une photo', 'Adicionar foto'),
(1397, '', NULL, 'upload', 'Upload', 'Uploaden', 'Télécharger', 'Envio'),
(1398, '', NULL, 'video_title', 'Video Title', 'titel van de video', 'titre de la vidéo', 'Título do vídeo'),
(1399, '', NULL, 'public', 'Public', 'Openbaar', 'Public', 'Público'),
(1400, '', NULL, 'private', 'Private', 'Privaat', 'Privé', 'Privado'),
(1401, '', NULL, 'thumbnail', 'Thumbnail', 'thumbnail', 'La vignette', ''),
(1402, '', NULL, 'my_affiliates', 'My affiliates', 'Mijn aangeslotenen', 'Mes affiliés', 'Meus afiliados'),
(1403, '', NULL, 'your_affiliate_link_is', 'Your affiliate link is', 'Uw partnerlink is', 'Votre lien d&#39;affiliation est', 'O seu link de afiliado é'),
(1404, '', NULL, 'my_balance', 'My balance', 'Mijn balans', 'Mon solde', 'Meu saldo'),
(1405, '', NULL, 'earn_up_to', 'Earn up to', 'Verdien maximaal', 'Gagnez jusqu&#39;à', 'Ganhe até'),
(1406, '', NULL, 'for_each_user_your_refer_to_us__', 'for each user your refer to us !', 'voor elke gebruiker verwijst u naar ons!', 'pour chaque utilisateur vous nous référez!', 'para cada usuário, consulte-nos!'),
(1407, '', NULL, 'joined', 'joined', 'toegetreden', 'rejoint', 'juntou'),
(1408, '', NULL, 'payments', 'Payments', 'betalingen', 'Paiements', 'Pagamentos'),
(1409, '', NULL, 'your_balance_is', 'Your balance is', 'Je saldo is', 'Votre équilibre est', 'Seu saldo é'),
(1410, '', NULL, '__minimum_withdrawal_request_is', ', minimum withdrawal request is', ', minimaal opnameverzoek is', ', la demande de retrait minimum est', ', o pedido mínimo de retirada é'),
(1411, '', NULL, 'paypal_email', 'PayPal email', 'Paypal E-mail', 'PayPal email', 'Email do Paypal'),
(1412, '', NULL, 'request_withdrawal', 'Request withdrawal', 'Verzoek tot intrekking', 'Demande de retrait', 'Solicitar retirada'),
(1413, '', NULL, 'your_request_has_been_sent__you__039_ll_receive_an_email_regarding_the_payment_details_soon.', 'Your request has been sent, you&#039;ll receive an email regarding the payment details soon.', 'Uw aanvraag is verzonden, u', 'Votre demande a été envoyée, vous', 'Sua solicitação foi enviada, você'),
(1414, '', NULL, 'requested', 'requested', 'aangevraagd', 'demandé', 'Requeridos'),
(1415, '', NULL, 'payment_history', 'Payment history', 'Betaalgeschiedenis', 'Historique de paiement', 'Histórico de pagamento'),
(1416, '', NULL, 'approved', 'approved', 'goedgekeurd', 'approuvé', 'aprovado'),
(1417, '', NULL, 'invalid_amount_value__your_amount_is_', 'Invalid amount value, your amount is:', 'Ongeldige bedragwaarde, uw bedrag is:', 'Valeur de montant non valide, votre montant est:', 'Valor de valor inválido, seu valor é:'),
(1418, '', NULL, 'add_friend', 'Add Friend', 'Vriend toevoegen', 'Ajouter un ami', 'Adicionar amigo'),
(1419, '', NULL, 'unfriend', 'UnFriend', 'unfriend', 'UnFriend', 'UnFriend'),
(1420, '', NULL, 'friend_request_sent', 'Friend request sent', 'Vriendschapsverzoek verzonden', 'Demande d&#39;ami envoyée', 'Pedido de amizade enviado'),
(1421, '', NULL, 'you_already_sent_friend_request.', 'You have already sent a request.', 'U heeft al een aanvraag verzonden.', 'Vous avez déjà envoyé une demande.', 'Você já enviou uma solicitação.'),
(1422, '', NULL, 'success', 'Success', 'Succes', 'Succès', 'Sucesso'),
(1423, '', NULL, 'confirm_request_when_someone_follows_you__', 'Confirm request when someone follows you?', 'Verzoek bevestigen wanneer iemand je volgt?', 'Confirmer la demande lorsque quelqu&#39;un vous suit?', 'Confirmar solicitação quando alguém segue você?'),
(1424, '', NULL, 'confirm_request_when_someone_request_friend_you__', 'Confirm request when someone request to be a friend with you?', 'Verzoek bevestigen wanneer iemand een vriend om jou wil zijn?', 'Confirmer la demande lorsque quelqu&#39;un demande à devenir ami avec vous?', 'Confirmar solicitação quando alguém solicitar para ser seu amigo?'),
(1425, '', NULL, 'created_a_story_with_you.', 'created a story with you.', 'creëerde een verhaal met jou.', 'créé une histoire avec vous.', 'criou uma história com você.');
INSERT INTO `langs` (`id`, `ref`, `options`, `lang_key`, `english`, `dutch`, `french`, `portuguese`) VALUES
(1426, '', NULL, 'accepted_your_friend_request.', 'accepted your friend request.', 'jouw vriendschapsverzoek geaccepteerd.', 'accepté votre demande d&#39;ami.', 'aceitou seu pedido de amizade.'),
(1427, '', NULL, 'declined_your_friend_request.', 'declined your friend request.', 'heeft je vriendschapsverzoek afgewezen.', 'a refusé votre demande d&#39;ami.', 'recusou o seu pedido de amizade.'),
(1428, '', NULL, 'send_friend_request_to_you.', 'requested to be a friend with you.', 'gevraagd om een ​​vriend bij je te zijn.', 'a demandé à être un ami avec vous.', 'solicitado para ser um amigo com você.'),
(1429, '', NULL, 'friend_requests', 'Friend requests', 'Vriendschapsverzoeken', 'Demandes d&#39;ami', 'Pedidos de amizade'),
(1430, '', NULL, 'is_now_in_friend_list.', 'is now in your friend list.', 'staat nu in uw vriendenlijst.', 'est maintenant dans votre liste d&#39;amis.', 'está agora na sua lista de amigos.'),
(1431, '', NULL, 'decline_request', 'Decline request', 'Verzoek weigeren', 'Demande de refus', 'Recusar solicitação'),
(1432, '', NULL, 'accept_request', 'Accept request', 'Accepteer verzoek', 'Accepter la requête', 'Aceitar pedido'),
(1433, '', NULL, 'request_your_friendship.', 'requested to be your friend.', 'vraag je vriendschap.', 'demandez votre amitié.', 'solicite sua amizade.'),
(1434, '', NULL, 'can_not_create_notification', 'can not create notification', 'kan geen melding maken', 'ne peut pas créer de notification', 'não pode criar notificação'),
(1435, '', NULL, 'pending_review', 'pending review', 'in afwachting van beoordeling', 'en attendant l&#39;examen', 'revisão pendente'),
(1436, '', NULL, 'the_username_is_blacklisted_and_not_allowed__please_choose_another_username.', 'The username is blacklisted and not allowed, please choose another username.', 'De gebruikersnaam staat op de zwarte lijst en is niet toegestaan, kies een andere gebruikersnaam.', 'Le nom d&#39;utilisateur est sur liste noire et n&#39;est pas autorisé, veuillez choisir un autre nom d&#39;utilisateur.', 'O nome de usuário está na lista negra e não é permitido. Escolha outro nome de usuário.'),
(1437, '', NULL, 'the_email_provider_is_blacklisted_and_not_allowed__please_choose_another_email_provider.', 'The email provider is blacklisted and not allowed, please choose another email provider.', 'De e-mailprovider staat op de zwarte lijst en is niet toegestaan. Kies een andere e-mailprovider.', 'Le fournisseur de messagerie est sur liste noire et n&#39;est pas autorisé, veuillez choisir un autre fournisseur de messagerie.', 'O provedor de email está na lista negra e não é permitido. Escolha outro provedor de email.'),
(1438, '', NULL, 'latest__0__users.', 'Latest {0} users.', 'Laatste {0} gebruikers.', 'Derniers {0} utilisateurs.', 'Últimos {0} usuários.'),
(1439, '', NULL, 'you_reach_to_limit_of_media_uploads.', 'You have reached the limit of media uploads.', 'Je hebt de limiet van media-uploads bereikt.', 'Vous avez atteint la limite des téléchargements multimédias.', 'Você atingiu o limite de uploads de mídia.'),
(1440, '', NULL, 'email_sent_to', 'Email sent to', 'Email verzonden naar', 'Email envoyé à', 'Email enviado para'),
(1441, '', NULL, 'error_while_sending_emails', 'Error while sending emails', 'Fout tijdens het verzenden van e-mails', 'Erreur lors de l&#39;envoi d&#39;e-mails', 'Erro ao enviar e-mails'),
(1442, '', NULL, 'under_review', 'Under Review', 'Wordt beoordeeld', 'À l&#39;étude', 'Sob revisão'),
(1443, 'gender', NULL, '1443', 'bimale', '', 'bisexuel homme', ''),
(1444, 'gender', NULL, '1444', 'bi female', '', 'bisexuel femme', ''),
(1445, 'gender', NULL, '1445', 'trans', '', 'transexuel', '');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT '0',
  `like_userid` int(11) UNSIGNED DEFAULT '0',
  `is_like` int(11) UNSIGNED DEFAULT '0',
  `is_dislike` int(11) UNSIGNED DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `user_id`, `like_userid`, `is_like`, `is_dislike`, `created_at`) VALUES
(1, 1, 4, 1, 0, '2020-05-12 00:24:44');

-- --------------------------------------------------------

--
-- Table structure for table `mediafiles`
--

CREATE TABLE `mediafiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT '0',
  `file` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `is_private` int(11) UNSIGNED DEFAULT '0',
  `private_file` varchar(250) DEFAULT '',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_video` int(11) UNSIGNED DEFAULT '0',
  `video_file` varchar(255) DEFAULT '',
  `is_confirmed` int(11) UNSIGNED DEFAULT '0',
  `is_approved` int(11) UNSIGNED DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mediafiles`
--

INSERT INTO `mediafiles` (`id`, `user_id`, `file`, `is_private`, `private_file`, `created_at`, `is_video`, `video_file`, `is_confirmed`, `is_approved`) VALUES
(1, 4, 'upload/photos/2020/05/6xtwweVH579PEDzd7vbx_full.png', 0, '', '2020-05-11 22:00:46', 0, '', 0, 1),
(2, 1, 'upload/photos/2020/05/f59e9fxedHkS4eEwArkT_full.jpeg', 0, '', '2020-05-12 01:15:55', 0, '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `from` int(11) NOT NULL DEFAULT '0',
  `from_delete` int(11) DEFAULT '0',
  `to` int(11) NOT NULL DEFAULT '0',
  `to_delete` int(11) DEFAULT '0',
  `text` text,
  `media` varchar(255) CHARACTER SET utf8 DEFAULT '',
  `sticker` varchar(255) CHARACTER SET utf8 DEFAULT '',
  `seen` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) UNSIGNED NOT NULL,
  `notifier_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `recipient_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `seen` int(11) UNSIGNED DEFAULT '0',
  `type` varchar(50) NOT NULL DEFAULT '',
  `text` varchar(250) DEFAULT '',
  `url` varchar(150) DEFAULT '',
  `full_url` varchar(150) DEFAULT '',
  `push_sent` int(1) UNSIGNED DEFAULT '0',
  `created_at` int(11) UNSIGNED DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `notifier_id`, `recipient_id`, `seen`, `type`, `text`, `url`, `full_url`, `push_sent`, `created_at`) VALUES
(1, 1, 4, 0, 'visit', '', '/@lovisland', '', 0, 1589214471);

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `option_value` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `option_name`, `option_value`, `created_at`) VALUES
(1, 'load_config_in_session', '0', '2018-11-04 21:00:00'),
(2, 'meta_description', 'Quickdate is the Finest Global Dating Website Around. Connect With Local Singles & Start Your Online Dating Adventure! Enjoy Worldwide Dating with Thrilling Online Chat & More.', '2018-11-04 21:00:00'),
(3, 'meta_keywords', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2018-11-04 21:00:00'),
(4, 'default_title', 'lovisland', '2018-11-04 21:00:00'),
(5, 'site_name', 'lovisland', '2018-11-04 21:00:00'),
(6, 'default_language', 'english', '2018-11-04 21:00:00'),
(7, 'smtp_or_mail', 'mail', '2018-11-04 21:00:00'),
(8, 'smtp_host', '', '2018-11-04 21:00:00'),
(9, 'smtp_username', '', '2018-11-04 21:00:00'),
(10, 'smtp_password', '', '2018-11-04 21:00:00'),
(11, 'smtp_encryption', 'ssl', '2018-11-04 21:00:00'),
(12, 'smtp_port', '', '2018-11-04 21:00:00'),
(13, 'siteEmail', 'jocelyn_moroy@yahoo.com', '2018-11-04 21:00:00'),
(14, 'theme', 'default', NULL),
(15, 'AllLogin', '0', '2018-11-04 21:00:00'),
(16, 'googleLogin', '1', '2018-11-04 21:00:00'),
(17, 'facebookLogin', '1', '2018-11-04 21:00:00'),
(18, 'twitterLogin', '0', '2018-11-04 21:00:00'),
(19, 'linkedinLogin', '0', '2018-11-04 21:00:00'),
(20, 'VkontakteLogin', '0', '2018-11-04 21:00:00'),
(21, 'facebookAppId', '', '2018-11-04 21:00:00'),
(22, 'facebookAppKey', '', '2018-11-04 21:00:00'),
(23, 'googleAppId', '', '2018-11-04 21:00:00'),
(24, 'googleAppKey', '', '2018-11-04 21:00:00'),
(25, 'twitterAppId', '', '2018-11-04 21:00:00'),
(26, 'twitterAppKey', '', '2018-11-04 21:00:00'),
(27, 'linkedinAppId', '', '2018-11-04 21:00:00'),
(28, 'linkedinAppKey', '', '2018-11-04 21:00:00'),
(29, 'VkontakteAppId', '', '2018-11-04 21:00:00'),
(30, 'VkontakteAppKey', '', '2018-11-04 21:00:00'),
(31, 'instagramAppId', '', '2018-11-04 21:00:00'),
(32, 'instagramAppkey', '', '2018-11-04 21:00:00'),
(33, 'instagramLogin', '1', '2018-11-04 21:00:00'),
(34, 'sms_or_email', 'mail', '2018-11-09 08:28:39'),
(37, 'sms_phone_number', '', '2018-11-04 21:00:00'),
(38, 'paypal_id', '', '2018-11-09 08:36:37'),
(39, 'paypal_secret', '', '2018-11-09 08:36:49'),
(40, 'paypal_mode', 'sandbox', '2018-11-09 08:36:09'),
(41, 'currency', 'USD', '2018-11-09 09:57:45'),
(42, 'last_backup', '00-00-0000', NULL),
(44, 'amazone_s3', '0', '2018-11-09 08:43:47'),
(45, 'bucket_name', '', '2018-11-09 08:44:13'),
(46, 'amazone_s3_key', '', '2018-11-09 08:44:34'),
(47, 'amazone_s3_s_key', '', '2018-11-09 08:44:51'),
(48, 'region', 'us-east-1', '2018-11-09 08:45:22'),
(50, 'sms_t_phone_number', '', '2018-11-04 21:00:00'),
(52, 'sms_twilio_username', '', '2018-11-04 21:00:00'),
(53, 'sms_twilio_password', '', '2018-11-04 21:00:00'),
(54, 'sms_provider', 'twilio', NULL),
(55, 'profile_picture_width_crop', '400', '2018-11-09 10:04:07'),
(56, 'profile_picture_height_crop', '400', '2018-11-09 10:04:09'),
(57, 'userDefaultAvatar', 'upload/photos/d-avatar.jpg', '2018-11-09 10:08:31'),
(58, 'profile_picture_image_quality', '80', '2018-11-09 10:10:08'),
(59, 'emailValidation', '0', '2018-11-09 08:28:58'),
(60, 'stripe_secret', '', '2018-11-09 08:35:37'),
(61, 'stripe_id', '', '2018-11-09 08:35:52'),
(62, 'push_id', 'f799dc13-ec22-4d1f-9306-b9fbde7d6106', NULL),
(63, 'push_key', 'NWFjODkxZDQtYWRhYy00NTJiLTlmYTItMmEwNmIwYWZlMTcx', NULL),
(64, 'push_id_2', NULL, NULL),
(65, 'push_key_2', NULL, NULL),
(68, 'terms', '                <h4>1- Write your Terms Of Use here.</h4>\n                <p>Lorem ipsum dolor sit amet, consectetur adisdpisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis sdnostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse          cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n                <br>\n                <h4>2- Random title</h4>\n                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', NULL),
(69, 'about', '                <h4>1- Write your About us here.</h4>\n                <p>Lorem ipsum dolor sit amet, consectetur adisdpisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis sdnostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse          cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n                <br>\n                <h4>2- Random title</h4>\n                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', NULL),
(70, 'privacy_policy', '                <h4>1- Write your Privacy Policy here.</h4>\n                <p>Lorem ipsum dolor sit amet, consectetur adisdpisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis sdnostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse          cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n                <br>\n                <h4>2- Random title</h4>\n                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', NULL),
(71, 'facebook_url', 'http://facebook.com', '2018-11-09 09:42:51'),
(72, 'twitter_url', 'http://twitter.com', '2018-11-09 09:42:53'),
(73, 'google_url', 'http://google.com', '2018-11-09 09:42:53'),
(74, 'currency_symbol', '$', '2018-11-09 09:18:29'),
(75, 'bag_of_credits_price', '50', '2018-11-09 09:12:55'),
(76, 'bag_of_credits_amount', '1000', '2018-11-09 09:13:00'),
(77, 'box_of_credits_price', '100', '2018-11-09 09:12:57'),
(78, 'box_of_credits_amount', '5000', '2018-11-09 09:13:01'),
(79, 'chest_of_credits_price', '150', '2018-11-09 09:13:03'),
(80, 'chest_of_credits_amount', '10000', '2018-11-09 09:13:05'),
(81, 'weekly_pro_plan', '8', '2018-11-09 09:13:07'),
(82, 'monthly_pro_plan', '25', '2018-11-09 09:24:48'),
(83, 'yearly_pro_plan', '150', '2018-11-09 09:24:50'),
(84, 'lifetime_pro_plan', '300', '2018-11-09 09:24:52'),
(85, 'worker_updateDelay', '4000', '2018-11-09 09:30:26'),
(87, 'profile_record_views_minute', '1', NULL),
(90, 'cost_per_gift', '50', '2018-11-09 09:37:38'),
(91, 'deleteAccount', '1', '2018-11-09 08:29:15'),
(92, 'user_registration', '1', '2018-11-09 08:28:24'),
(93, 'maxUpload', '96000000', NULL),
(94, 'mime_types', 'text/plain,video/mp4,video/mov,video/mpeg,video/flv,video/avi,video/webm,audio/wav,audio/mpeg,video/quicktime,audio/mp3,image/png,image/jpeg,image/gif,application/pdf,application/msword,application/zip,application/x-rar-compressed,text/pdf,application/x-pointplus,text/css', NULL),
(95, 'normal_boost_me_credits_price', '70', '2018-11-14 06:39:56'),
(96, 'more_stickers_credits_price', '45', '2018-11-14 06:39:59'),
(97, 'pro_boost_me_credits_price', '35', '2018-11-16 03:23:30'),
(98, 'boost_expire_time', '4', '2018-11-16 03:23:49'),
(99, 'not_pro_chat_limit_daily', '4', '2018-11-16 03:24:06'),
(100, 'not_pro_chat_credit', '30', NULL),
(101, 'not_pro_chat_stickers_credit', '25', '2018-11-16 03:25:55'),
(102, 'not_pro_chat_stickers_limit', '24', '2018-11-16 03:26:16'),
(103, 'cost_per_xvisits', '25', NULL),
(104, 'xvisits_expire_time', '5', NULL),
(105, 'cost_per_xmatche', '35', NULL),
(106, 'xmatche_expire_time', '5', NULL),
(107, 'cost_per_xlike', '45', NULL),
(108, 'xlike_expire_time', '5', NULL),
(109, 'google_place_api', 'AIzaSyB7rRpQJyQJZYzxrvStRGFkbB0MxXWGrO0', NULL),
(110, 'wowonder_login', '0', NULL),
(111, 'wowonder_app_ID', '7d0f02f7d38c30f78cd5', NULL),
(112, 'wowonder_app_key', 'e91365ad84d413a1d017d28522e555d14225d9d', NULL),
(113, 'wowonder_domain_uri', 'https://demo.wowonder.com', NULL),
(114, 'wowonder_domain_icon', 'https://demo.wowonder.com/themes/default/img/icon.png', NULL),
(115, 'bank_transfer_note', 'In order to confirm the bank transfer, you will need to upload a receipt or take a screenshot of your transfer within 1 day from your payment date. If a bank transfer is made but no receipt is uploaded within this period, your order will be cancelled. We will verify and confirm your receipt within 3 working days from the date you upload it.', NULL),
(116, 'max_swaps', '50', NULL),
(117, 'stripe_version', 'v1', NULL),
(118, 'paysera_project_id', '0', NULL),
(119, 'paysera_password', '', NULL),
(120, 'paysera_test_mode', 'test', NULL),
(121, 'message_request_system', 'on', NULL),
(122, 'video_chat', '0', NULL),
(123, 'audio_chat', '0', NULL),
(124, 'video_accountSid', '', NULL),
(125, 'video_apiKeySid', '', NULL),
(126, 'video_apiKeySecret', '', NULL),
(127, 'giphy_api', 'GIjbMwjlfGcmNEgB0eqphgRgwNCYN8gh', NULL),
(128, 'default_unit', 'km', NULL),
(129, 'maintenance_mode', '0', NULL),
(130, 'displaymode', 'day', NULL),
(131, 'bank_description', '&lt;div class=&quot;dt_settings_header bg_gradient&quot;&gt;\r\n                    &lt;div class=&quot;dt_settings_circle-1&quot;&gt;&lt;/div&gt;\r\n                    &lt;div class=&quot;dt_settings_circle-2&quot;&gt;&lt;/div&gt;\r\n                    &lt;div class=&quot;bank_info_innr&quot;&gt;\r\n                        &lt;svg xmlns=&quot;http://www.w3.org/2000/svg&quot; viewBox=&quot;0 0 24 24&quot;&gt;&lt;path fill=&quot;currentColor&quot; d=&quot;M11.5,1L2,6V8H21V6M16,10V17H19V10M2,22H21V19H2M10,10V17H13V10M4,10V17H7V10H4Z&quot;&gt;&lt;/path&gt;&lt;/svg&gt;\r\n                        &lt;h4 class=&quot;bank_name&quot;&gt;BANK NAME&lt;/h4&gt;\r\n                        &lt;div class=&quot;row&quot;&gt;\r\n                            &lt;div class=&quot;col s12&quot;&gt;\r\n                                &lt;div class=&quot;bank_account&quot;&gt;\r\n                                    &lt;p&gt;4796824372433055&lt;/p&gt;\r\n                                    &lt;span class=&quot;help-block&quot;&gt;Account number / IBAN&lt;/span&gt;\r\n                                &lt;/div&gt;\r\n                            &lt;/div&gt;\r\n                            &lt;div class=&quot;col s12&quot;&gt;\r\n                                &lt;div class=&quot;bank_account_holder&quot;&gt;\r\n                                    &lt;p&gt;Antoian Kordiyal&lt;/p&gt;\r\n                                    &lt;span class=&quot;help-block&quot;&gt;Account name&lt;/span&gt;\r\n                                &lt;/div&gt;\r\n                            &lt;/div&gt;\r\n                            &lt;div class=&quot;col s6&quot;&gt;\r\n                                &lt;div class=&quot;bank_account_code&quot;&gt;\r\n                                    &lt;p&gt;TGBATRISXXX&lt;/p&gt;\r\n                                    &lt;span class=&quot;help-block&quot;&gt;Routing code&lt;/span&gt;\r\n                                &lt;/div&gt;\r\n                            &lt;/div&gt;\r\n                            &lt;div class=&quot;col s6&quot;&gt;\r\n                                &lt;div class=&quot;bank_account_country&quot;&gt;\r\n                                    &lt;p&gt;Turkey&lt;/p&gt;\r\n                                    &lt;span class=&quot;help-block&quot;&gt;Country&lt;/span&gt;\r\n                                &lt;/div&gt;\r\n                            &lt;/div&gt;\r\n                        &lt;/div&gt;\r\n                    &lt;/div&gt;\r\n                &lt;/div&gt;', NULL),
(132, 'version', '1.4', '2019-05-08 11:18:08'),
(133, 'google_tag_code', NULL, '2019-05-08 11:18:10'),
(134, 'avcall_pro', '1', '2019-05-08 11:18:11'),
(135, 'pro_system', '1', '2019-05-08 11:18:13'),
(136, 'img_blur_amount', '50', '2019-05-08 11:18:15'),
(137, 'emailNotification', '1', '2019-05-08 11:18:17'),
(138, 'activation_limit_system', '1', '2019-05-09 18:06:09'),
(139, 'max_activation_request', '5', '2019-05-09 18:06:09'),
(140, 'activation_request_time_limit', '5', '2019-05-09 18:06:09'),
(141, 'free_features', '0', '2019-08-22 14:10:20'),
(142, 'opposite_gender', '0', '2019-08-22 14:10:22'),
(143, 'image_verification', '0', '2019-08-22 14:10:24'),
(145, 'pending_verification', '0', '2019-08-22 14:10:27'),
(146, 'push', '1', '2019-08-30 19:18:56'),
(147, 'spam_warning', '1', '2019-08-30 19:18:57'),
(148, 'image_verification_start', '0', '2019-08-30 19:18:59'),
(149, 'two_factor', '1', '2020-02-23 14:17:03'),
(150, 'two_factor_type', 'email', '2020-02-23 14:17:03'),
(151, 'affiliate_system', '1', '2020-02-23 14:17:04'),
(152, 'affiliate_type', NULL, '2020-02-23 14:17:04'),
(153, 'm_withdrawal', NULL, '2020-02-23 14:17:04'),
(154, 'amount_ref', NULL, '2020-02-23 14:17:04'),
(155, 'amount_percent_ref', NULL, '2020-02-23 14:17:04'),
(156, 'connectivitySystem', '0', '2020-02-23 14:17:04'),
(157, 'connectivitySystemLimit', '5000', '2020-02-23 14:17:04'),
(158, 'show_user_on_homepage', '1', '2020-02-23 14:17:04'),
(159, 'showed_user', '25', '2020-02-23 14:17:04'),
(160, 'max_photo_per_user', '12', '2020-02-23 14:17:04'),
(161, 'review_media_files', '0', '2020-02-23 14:17:04'),
(162, 'ffmpeg_sys', '0', '2020-02-23 14:17:04'),
(163, 'max_video_duration', '30', '2020-02-23 14:17:04'),
(164, 'ffmpeg_binary', './ffmpeg/ffmpeg', '2020-02-23 14:17:04');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `amount` int(11) NOT NULL DEFAULT '0',
  `type` varchar(15) NOT NULL DEFAULT '',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `pro_plan` varchar(100) DEFAULT '',
  `credit_amount` varchar(100) DEFAULT '0',
  `via` varchar(100) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `profilefields`
--

CREATE TABLE `profilefields` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci,
  `type` text COLLATE utf8_unicode_ci,
  `length` int(11) NOT NULL DEFAULT '0',
  `placement` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'profile',
  `registration_page` int(11) NOT NULL DEFAULT '0',
  `profile_page` int(11) NOT NULL DEFAULT '0',
  `select_type` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `active` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT '0',
  `report_userid` int(11) UNSIGNED DEFAULT '0',
  `report_text` text,
  `seen` int(11) UNSIGNED DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `session_id` varchar(200) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `platform` varchar(30) NOT NULL DEFAULT 'web',
  `platform_details` text,
  `time` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `session_id`, `user_id`, `platform`, `platform_details`, `time`) VALUES
(1, '50fea7e2c07f89cb293a174f88e409d6de9dc57156bdbac456f53e3be3dc92fe9ded15ad38612126a133710cb2bedc27da8daaadb931553b', 1, 'web', 'a:5:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"81.0.4044.138\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";}', 1589198881),
(2, 'c75b6aadfc1711b616d9f9aaac88e8e2353ae45f6af87b1453827ce10a15802f5cfbc07a80102973ac53fab47b547a0d47b77e424cf119ba', 1, 'web', 'a:5:{s:9:\"userAgent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"81.0.4044.138\";s:8:\"platform\";s:3:\"mac\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";}', 1589200328),
(3, '06a55f7b723a1dcc88b818d6db8511586099446630b2fff2435978e7abb40c2187ef836d818190134b3acf483fac3b2baaad311f1cef9674', 1, 'web', 'a:5:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"81.0.4044.138\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";}', 1589203655),
(8, '4acab95cec69c2dd9da227eeb7ee9ae683f4e65f33eb3bcfc2814d14389aaf80e1580bb7386667409b2e035e5362c96aea4c28083f02d6ff', 1, 'web', 'a:5:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"79.0.3945.130\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";}', 1589214355),
(9, '97127b42ce9dad72f899a1472c3a193c6f3b77b339f36a17fc735c2c31e75f18b8f65a2220274334294a8ed24b1ad22ec2e7efea049b8737', 1, 'web', 'a:5:{s:9:\"userAgent\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36\";s:4:\"name\";s:13:\"Google Chrome\";s:7:\"version\";s:13:\"81.0.4044.138\";s:8:\"platform\";s:7:\"windows\";s:7:\"pattern\";s:66:\"#(?<browser>Version|Chrome|other)[/ ]+(?<version>[0-9.|a-zA-Z.]*)#\";}', 1589215284);

-- --------------------------------------------------------

--
-- Table structure for table `site_ads`
--

CREATE TABLE `site_ads` (
  `id` int(11) NOT NULL,
  `placement` varchar(50) NOT NULL DEFAULT '',
  `code` text,
  `active` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `site_ads`
--

INSERT INTO `site_ads` (`id`, `placement`, `code`, `active`) VALUES
(1, 'header', '', 0),
(2, 'footer', '', 0),
(3, 'home_side_bar', '', 0),
(4, 'profile_side_bar', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `stickers`
--

CREATE TABLE `stickers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `file` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `is_pro` int(11) UNSIGNED DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `success_stories`
--

CREATE TABLE `success_stories` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `story_user_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `quote` varchar(250) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `story_date` date NOT NULL,
  `status` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `userfields`
--

CREATE TABLE `userfields` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `first_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `last_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `avater` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT 'upload/photos/d-avatar.jpg  ',
  `address` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `gender` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '0',
  `facebook` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `google` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `twitter` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `linkedin` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `website` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `instagram` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `web_device_id` varchar(100) CHARACTER SET utf8 DEFAULT '',
  `language` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT 'english',
  `email_code` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `src` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT 'Undefined',
  `ip_address` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT 'user',
  `phone_number` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `timezone` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `lat` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '0',
  `lng` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '0',
  `about` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `birthday` varchar(200) DEFAULT '0000-00-00',
  `country` varchar(10) CHARACTER SET utf8 DEFAULT '',
  `registered` int(10) UNSIGNED DEFAULT '0',
  `lastseen` int(10) UNSIGNED DEFAULT '0',
  `smscode` int(10) UNSIGNED DEFAULT '0',
  `pro_time` int(10) UNSIGNED DEFAULT '0',
  `last_location_update` int(10) UNSIGNED DEFAULT '0',
  `balance` decimal(11,2) UNSIGNED DEFAULT '0.00',
  `verified` enum('0','1') CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '0',
  `status` enum('0','1','2','3') CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '0',
  `active` enum('0','1','2') CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '0',
  `admin` enum('0','1','2') CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '0',
  `start_up` enum('0','1','2','3') CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '0',
  `is_pro` enum('0','1') CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '0',
  `pro_type` enum('0','1','2','3','4') CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '0',
  `social_login` enum('0','1') CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `mobile_device_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `web_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `mobile_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `height` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `hair_color` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `web_token_created_at` int(11) DEFAULT '0',
  `mobile_token_created_at` int(11) DEFAULT '0',
  `web_device` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `mobile_device` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `interest` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `relationship` int(10) UNSIGNED DEFAULT '0',
  `work_status` int(10) UNSIGNED DEFAULT '0',
  `education` int(10) UNSIGNED DEFAULT '0',
  `ethnicity` int(10) UNSIGNED DEFAULT '0',
  `body` int(10) UNSIGNED DEFAULT '0',
  `character` int(10) UNSIGNED DEFAULT '0',
  `children` int(10) UNSIGNED DEFAULT '0',
  `friends` int(10) UNSIGNED DEFAULT '0',
  `pets` int(10) UNSIGNED DEFAULT '0',
  `live_with` int(10) UNSIGNED DEFAULT '0',
  `car` int(10) UNSIGNED DEFAULT '0',
  `religion` int(10) UNSIGNED DEFAULT '0',
  `smoke` int(10) UNSIGNED DEFAULT '0',
  `drink` int(10) UNSIGNED DEFAULT '0',
  `travel` int(10) UNSIGNED DEFAULT '0',
  `music` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `dish` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `song` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `hobby` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `sport` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `book` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `movie` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `colour` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `tv` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `privacy_show_profile_on_google` int(10) UNSIGNED DEFAULT '0',
  `privacy_show_profile_random_users` int(10) UNSIGNED DEFAULT '0',
  `privacy_show_profile_match_profiles` int(10) UNSIGNED DEFAULT '0',
  `email_on_profile_view` int(10) UNSIGNED DEFAULT '0',
  `email_on_new_message` int(10) UNSIGNED DEFAULT '0',
  `email_on_profile_like` int(10) UNSIGNED DEFAULT '0',
  `email_on_purchase_notifications` int(10) UNSIGNED DEFAULT '0',
  `email_on_special_offers` int(10) UNSIGNED DEFAULT '0',
  `email_on_announcements` int(11) UNSIGNED DEFAULT '0',
  `phone_verified` int(11) UNSIGNED DEFAULT '0',
  `online` int(11) UNSIGNED DEFAULT '0',
  `is_boosted` int(11) UNSIGNED DEFAULT '0',
  `boosted_time` int(11) UNSIGNED DEFAULT '0',
  `is_buy_stickers` int(11) UNSIGNED DEFAULT '0',
  `user_buy_xvisits` int(11) UNSIGNED DEFAULT '0',
  `xvisits_created_at` int(11) UNSIGNED DEFAULT '0',
  `user_buy_xmatches` int(11) UNSIGNED DEFAULT '0',
  `xmatches_created_at` int(11) UNSIGNED DEFAULT '0',
  `user_buy_xlikes` int(11) UNSIGNED DEFAULT '0',
  `xlikes_created_at` int(11) UNSIGNED DEFAULT '0',
  `show_me_to` varchar(50) NOT NULL DEFAULT '',
  `email_on_get_gift` int(11) UNSIGNED DEFAULT '0',
  `email_on_got_new_match` int(11) UNSIGNED DEFAULT '0',
  `email_on_chat_request` int(11) UNSIGNED DEFAULT '0',
  `last_email_sent` int(32) UNSIGNED DEFAULT '0',
  `approved_at` int(11) UNSIGNED DEFAULT '0',
  `snapshot` varchar(250) NOT NULL DEFAULT '',
  `hot_count` int(11) UNSIGNED DEFAULT '0',
  `spam_warning` int(11) UNSIGNED DEFAULT '0',
  `activation_request_count` int(11) UNSIGNED DEFAULT '0',
  `last_activation_request` int(11) UNSIGNED DEFAULT '0',
  `two_factor` int(11) UNSIGNED DEFAULT '0',
  `two_factor_verified` int(11) UNSIGNED DEFAULT '0',
  `two_factor_email_code` varchar(250) DEFAULT '',
  `new_email` varchar(250) DEFAULT '',
  `new_phone` varchar(250) DEFAULT '',
  `permission` text,
  `referrer` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `aff_balance` varchar(100) NOT NULL DEFAULT '0',
  `paypal_email` varchar(100) NOT NULL DEFAULT '',
  `confirm_followers` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `first_name`, `last_name`, `avater`, `address`, `gender`, `facebook`, `google`, `twitter`, `linkedin`, `website`, `instagram`, `web_device_id`, `language`, `email_code`, `src`, `ip_address`, `type`, `phone_number`, `timezone`, `lat`, `lng`, `about`, `birthday`, `country`, `registered`, `lastseen`, `smscode`, `pro_time`, `last_location_update`, `balance`, `verified`, `status`, `active`, `admin`, `start_up`, `is_pro`, `pro_type`, `social_login`, `created_at`, `updated_at`, `deleted_at`, `mobile_device_id`, `web_token`, `mobile_token`, `height`, `hair_color`, `web_token_created_at`, `mobile_token_created_at`, `web_device`, `mobile_device`, `interest`, `location`, `relationship`, `work_status`, `education`, `ethnicity`, `body`, `character`, `children`, `friends`, `pets`, `live_with`, `car`, `religion`, `smoke`, `drink`, `travel`, `music`, `dish`, `song`, `hobby`, `city`, `sport`, `book`, `movie`, `colour`, `tv`, `privacy_show_profile_on_google`, `privacy_show_profile_random_users`, `privacy_show_profile_match_profiles`, `email_on_profile_view`, `email_on_new_message`, `email_on_profile_like`, `email_on_purchase_notifications`, `email_on_special_offers`, `email_on_announcements`, `phone_verified`, `online`, `is_boosted`, `boosted_time`, `is_buy_stickers`, `user_buy_xvisits`, `xvisits_created_at`, `user_buy_xmatches`, `xmatches_created_at`, `user_buy_xlikes`, `xlikes_created_at`, `show_me_to`, `email_on_get_gift`, `email_on_got_new_match`, `email_on_chat_request`, `last_email_sent`, `approved_at`, `snapshot`, `hot_count`, `spam_warning`, `activation_request_count`, `last_activation_request`, `two_factor`, `two_factor_verified`, `two_factor_email_code`, `new_email`, `new_phone`, `permission`, `referrer`, `aff_balance`, `paypal_email`, `confirm_followers`) VALUES
(1, 'lovisland', 'jocelyn_moroy@yahoo.com', '$2y$11$sw8TSJHqjZ1J6b4c86Vs0.eM3.AJOZ3Xi9fFGyTB0UUJMHkC5AyeO', '', '', 'upload/photos/2020/05/f59e9fxedHkS4eEwArkT_avater.jpeg', '', '4525', '', '', '', '', '', NULL, '', 'english', '8386', 'installation', '', 'admin', '', '', '25.0657', '55.17128', NULL, '0000-00-00', '', 1589190897, 1589224500, 6746, 1589190897, 1589228497, '0.00', '1', '0', '1', '1', '3', '1', '4', '0', '2020-05-11 09:54:57', '2020-05-11 09:54:57', '2020-05-11 09:54:57', '', NULL, '', '', '', 0, 0, NULL, '', NULL, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, '', '', '', NULL, 0, '0', '', '1'),
(4, 'panda', 'jocelynmoroy@gmail.com', '$2y$11$E.Vnni2TjoxREn/PWkh03.f2a.XFjx3/w9A.kAwovdeq8Epk0/XvG', 'fde', 'fgd', 'upload/photos/2020/05/6xtwweVH579PEDzd7vbx_avater.png', '', '4525', '', '', '', '', '', '', '', 'english', '4971', 'site', '194.5.53.50', 'user', '', 'UTC', '52.52437', '13.41053', '', '1990', 'AL', 1589212810, 1589212992, 5443, 0, 1589212872, '0.00', '1', '3', '0', '0', '3', '0', '0', '0', '2020-05-11 22:00:10', '2020-05-11 16:00:10', '2020-05-11 16:00:10', '', NULL, '', '180', '1', 0, 0, NULL, '', NULL, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, '', '', '', NULL, 0, '0', '', '1'),
(5, 'fiona40_674', 'reginald85_166@yahoo.com', '$2y$11$rDscmsyaLNFQru987fM0nOGnCjc4HioPTK9.AB/meEFFFNqyAm1bK', 'Madge Lebsack', 'Padberg', 'upload/photos/users/13.jpg', '2140 Stanton Turnpike\nNataliechester, VT 66277', '4525', 'Bednar Ltd', 'Langworth, Quigley and Beatty', 'Satterfield-Kohler', 'Corwin-Conn', 'Jakubowski, Becker and Rath', 'Cruickshank, Ondricka and Bins', '', 'english', '2569', 'Fake', '94.204.114.7', 'user', '(585) 542-7734', 'UTC', '25.0657', '55.17128', 'Ut ab voluptas sed a nam. Sint autem inventore aut officia aut aut blanditiis. Ducimus eos odit amet et est ut eum.', '2001-05-11', 'AR', 1589221401, 1589221401, 3884, 0, 0, '0.00', '1', '0', '1', '0', '3', '0', '0', '0', '2020-05-12 00:23:21', '2020-05-11 18:23:21', '2020-05-11 18:23:21', '', '', '', '152', '1', 0, 0, '', '', 'Sint autem inventore aut officia', 'Ducimus', 1, 2, 3, 3, 3, 13, 2, 3, 0, 3, 2, 1, 2, 2, 2, 'pop', 'meat', 'song', 'hobby', 'city', 'sport', 'book', 'movie', 'red', 'tv', 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, '', '', '', NULL, 0, '0', '', '1'),
(6, 'nella.skiles_436', 'stephany_spencer_654@yahoo.com', '$2y$11$keKNJsx0HB6HHLESzEAIFOm2mpeSF/cWAMUoY.Eu4KawI5Unrstw6', 'Zetta Gutkowski DDS', 'Block', 'upload/photos/users/4.jpg', '71837 Hackett Road Suite 428\nNorth Janischester, DC 52571', '4525', 'Kihn, Schowalter and Effertz', 'Streich-Kris', 'Heller, Rogahn and Greenfelder', 'Hansen-Gleichner', 'Koelpin-Murray', 'Bergstrom-Huel', '', 'english', '7865', 'Fake', '94.204.114.7', 'user', '907-835-1345', 'UTC', '25.0657', '55.17128', 'Ut ab voluptas sed a nam. Sint autem inventore aut officia aut aut blanditiis. Ducimus eos odit amet et est ut eum.', '2001-05-11', 'CH', 1589221401, 1589221401, 3069, 0, 0, '0.00', '1', '0', '1', '0', '3', '0', '0', '0', '2020-05-12 00:23:21', '2020-05-11 18:23:21', '2020-05-11 18:23:21', '', '', '', '152', '1', 0, 0, '', '', 'Sint autem inventore aut officia', 'Ducimus', 1, 2, 3, 3, 3, 13, 2, 3, 0, 3, 2, 1, 2, 2, 2, 'pop', 'meat', 'song', 'hobby', 'city', 'sport', 'book', 'movie', 'red', 'tv', 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, '', '', '', NULL, 0, '0', '', '1'),
(7, 'bdavis_595', 'pauline_auer_434@yahoo.com', '$2y$11$Umjl0yB/pWbYMtlF829r/.dJF4xCxw9fLfaqK4YHMPXpOX3IVqIAS', 'Ashly Morar V', 'Murphy', 'upload/photos/users/8.jpg', '515 Skiles Hollow Suite 924\nNorth Margaritafort, NE 02219-5607', '4526', 'Jerde-Gibson', 'Hahn-Davis', 'Schaefer Group', 'Cremin and Sons', 'Welch, Skiles and Wilderman', 'Lehner-Corkery', '', 'english', '3149', 'Fake', '94.204.114.7', 'user', '1-463-796-8316', 'UTC', '25.0657', '55.17128', 'Ut ab voluptas sed a nam. Sint autem inventore aut officia aut aut blanditiis. Ducimus eos odit amet et est ut eum.', '2001-05-11', 'ZW', 1589221401, 1589221401, 7271, 0, 0, '0.00', '1', '0', '1', '0', '3', '0', '0', '0', '2020-05-12 00:23:21', '2020-05-11 18:23:21', '2020-05-11 18:23:21', '', '', '', '152', '1', 0, 0, '', '', 'Sint autem inventore aut officia', 'Ducimus', 1, 2, 3, 3, 3, 13, 2, 3, 0, 3, 2, 1, 2, 2, 2, 'pop', 'meat', 'song', 'hobby', 'city', 'sport', 'book', 'movie', 'red', 'tv', 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, '', '', '', NULL, 0, '0', '', '1'),
(8, 'zerdman_791', 'gerlach_heath_155@yahoo.com', '$2y$11$IdENyATeoC7x.kDuFQMoOutJBtO6i.FP2Ag8el68nlEmiocPlI6uK', 'Camryn O\\&#039;Hara', 'Stracke', 'upload/photos/users/14.jpg', '925 Hessel Locks Apt. 527\nNew Chester, OK 40950', '4525', 'Larson Group', 'Beatty Inc', 'Gusikowski-Kuhlman', 'Heaney-Feest', 'Feeney Group', 'Kutch, King and Hermann', '', 'english', '7812', 'Fake', '94.204.114.7', 'user', '683-908-1906', 'UTC', '25.0657', '55.17128', 'Ut ab voluptas sed a nam. Sint autem inventore aut officia aut aut blanditiis. Ducimus eos odit amet et est ut eum.', '2001-05-11', 'SK', 1589221401, 1589221401, 5878, 0, 0, '0.00', '1', '0', '1', '0', '3', '0', '0', '0', '2020-05-12 00:23:21', '2020-05-11 18:23:21', '2020-05-11 18:23:21', '', '', '', '152', '1', 0, 0, '', '', 'Sint autem inventore aut officia', 'Ducimus', 1, 2, 3, 3, 3, 13, 2, 3, 0, 3, 2, 1, 2, 2, 2, 'pop', 'meat', 'song', 'hobby', 'city', 'sport', 'book', 'movie', 'red', 'tv', 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, '', '', '', NULL, 0, '0', '', '1'),
(9, 'damon.johnston_505', 'vena98_513@yahoo.com', '$2y$11$xwdt0wri0A0fwk6m9r/M4u0fYJixoT18SgHvEPnX495reoGW//KAW', 'Noe Schaefer', 'Christiansen', 'upload/photos/users/17.jpg', '3490 Alexandra Skyway Apt. 498\nStantonfort, KY 09667', '4526', 'Mann-Koch', 'Grady, Bergnaum and Dietrich', 'Parker and Sons', 'Armstrong Ltd', 'Bode Inc', 'O\\&#039;Kon-Crist', '', 'english', '4929', 'Fake', '94.204.114.7', 'user', '649.619.7733', 'UTC', '25.0657', '55.17128', 'Ut ab voluptas sed a nam. Sint autem inventore aut officia aut aut blanditiis. Ducimus eos odit amet et est ut eum.', '2001-05-11', 'GN', 1589221402, 1589221402, 9453, 0, 0, '0.00', '1', '0', '1', '0', '3', '0', '0', '0', '2020-05-12 00:23:22', '2020-05-11 18:23:22', '2020-05-11 18:23:22', '', '', '', '152', '1', 0, 0, '', '', 'Sint autem inventore aut officia', 'Ducimus', 1, 2, 3, 3, 3, 13, 2, 3, 0, 3, 2, 1, 2, 2, 2, 'pop', 'meat', 'song', 'hobby', 'city', 'sport', 'book', 'movie', 'red', 'tv', 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, '', '', '', NULL, 0, '0', '', '1'),
(10, 'qmoen_534', 'oconnell_zachery_170@yahoo.com', '$2y$11$xexmq0C/wgVW2XLuzDfR0eFAzFFoGwF0C.NVqvdmI9qXT.uMuBZzC', 'Erich Tillman', 'Mitchell', 'upload/photos/users/17.jpg', '39430 Nestor Fork Apt. 291\nFernfurt, IN 46443', '4526', 'Mosciski, Ernser and Rosenbaum', 'Toy-Reichel', 'Heathcote, Ernser and Kuphal', 'Kling Inc', 'Fahey Inc', 'Turcotte LLC', '', 'english', '6715', 'Fake', '94.204.114.7', 'user', '(361) 942-9957 x683', 'UTC', '25.0657', '55.17128', 'Ut ab voluptas sed a nam. Sint autem inventore aut officia aut aut blanditiis. Ducimus eos odit amet et est ut eum.', '2001-05-11', 'LI', 1589221402, 1589221402, 1386, 0, 0, '0.00', '1', '0', '1', '0', '3', '0', '0', '0', '2020-05-12 00:23:22', '2020-05-11 18:23:22', '2020-05-11 18:23:22', '', '', '', '152', '1', 0, 0, '', '', 'Sint autem inventore aut officia', 'Ducimus', 1, 2, 3, 3, 3, 13, 2, 3, 0, 3, 2, 1, 2, 2, 2, 'pop', 'meat', 'song', 'hobby', 'city', 'sport', 'book', 'movie', 'red', 'tv', 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, '', '', '', NULL, 0, '0', '', '1'),
(11, 'deion.tillman_542', 'yhammes_224@yahoo.com', '$2y$11$2sqx0hF.eGvJL9Rbrxwx/.kyLviZZLTb0kA0d1tuhr7A7RToOLk72', 'Autumn Lemke', 'Lubowitz', 'upload/photos/users/8.jpg', '92828 Kulas Greens\nGarthton, WI 20147', '4526', 'Greenholt, Connelly and Schuppe', 'Renner-Ferry', 'Schneider and Sons', 'Schimmel, Eichmann and Klocko', 'D\\&#039;Amore PLC', 'Frami-Streich', '', 'english', '8577', 'Fake', '94.204.114.7', 'user', '754.316.2854 x11149', 'UTC', '25.0657', '55.17128', 'Ut ab voluptas sed a nam. Sint autem inventore aut officia aut aut blanditiis. Ducimus eos odit amet et est ut eum.', '2001-05-11', 'AO', 1589221402, 1589221402, 3788, 0, 0, '0.00', '1', '0', '1', '0', '3', '0', '0', '0', '2020-05-12 00:23:22', '2020-05-11 18:23:22', '2020-05-11 18:23:22', '', '', '', '152', '1', 0, 0, '', '', 'Sint autem inventore aut officia', 'Ducimus', 1, 2, 3, 3, 3, 13, 2, 3, 0, 3, 2, 1, 2, 2, 2, 'pop', 'meat', 'song', 'hobby', 'city', 'sport', 'book', 'movie', 'red', 'tv', 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, '', '', '', NULL, 0, '0', '', '1'),
(12, 'nola24_801', 'zbartell_652@yahoo.com', '$2y$11$9ygL8tO5f706vkQQ9Qt/cetLrN4WT32gxfsiYIFGRe4CyStdBMBiW', 'Diamond Ryan', 'Reichel', 'upload/photos/users/18.jpg', '3032 Hansen Knoll\nLindtown, AL 66876-9281', '4526', 'Little, Quitzon and Schmidt', 'Heller, Lakin and Wisoky', 'Durgan-O\\&#039;Connell', 'Russel-Brown', 'Stehr-Hoeger', 'Roob, Kulas and Schmitt', '', 'english', '6417', 'Fake', '94.204.114.7', 'user', '(920) 854-5449 x554', 'UTC', '25.0657', '55.17128', 'Ut ab voluptas sed a nam. Sint autem inventore aut officia aut aut blanditiis. Ducimus eos odit amet et est ut eum.', '2001-05-11', 'NP', 1589221402, 1589221402, 5150, 0, 0, '0.00', '1', '0', '1', '0', '3', '0', '0', '0', '2020-05-12 00:23:22', '2020-05-11 18:23:22', '2020-05-11 18:23:22', '', '', '', '152', '1', 0, 0, '', '', 'Sint autem inventore aut officia', 'Ducimus', 1, 2, 3, 3, 3, 13, 2, 3, 0, 3, 2, 1, 2, 2, 2, 'pop', 'meat', 'song', 'hobby', 'city', 'sport', 'book', 'movie', 'red', 'tv', 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, '', '', '', NULL, 0, '0', '', '1'),
(13, 'cdeckow_506', 'theaney_709@yahoo.com', '$2y$11$UdoTvjOG2MJBdO7VtbpJFuZvZs4Mqy.lJ6wmRJ9LMQOs69EmiwNra', 'Kaitlyn Nolan', 'Beer', 'upload/photos/users/9.jpg', '48945 Howell Burg\nDakotachester, HI 94104-5868', '4526', 'Champlin, Kihn and Auer', 'Nikolaus, Beer and Rolfson', 'Carroll LLC', 'Schaden, Herzog and Padberg', 'Ward-Labadie', 'Conn-Windler', '', 'english', '6893', 'Fake', '94.204.114.7', 'user', '781-730-2908 x4453', 'UTC', '25.0657', '55.17128', 'Ut ab voluptas sed a nam. Sint autem inventore aut officia aut aut blanditiis. Ducimus eos odit amet et est ut eum.', '2001-05-11', 'US', 1589221402, 1589221402, 3529, 0, 0, '0.00', '1', '0', '1', '0', '3', '0', '0', '0', '2020-05-12 00:23:22', '2020-05-11 18:23:22', '2020-05-11 18:23:22', '', '', '', '152', '1', 0, 0, '', '', 'Sint autem inventore aut officia', 'Ducimus', 1, 2, 3, 3, 3, 13, 2, 3, 0, 3, 2, 1, 2, 2, 2, 'pop', 'meat', 'song', 'hobby', 'city', 'sport', 'book', 'movie', 'red', 'tv', 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, '', '', '', NULL, 0, '0', '', '1'),
(14, 'brionna64_985', 'mcdermott_nathen_383@yahoo.com', '$2y$11$aBE26B35nDNlXHyopkIBGOUyVETBqBmSDKspn4DI7gLQjQgeqHU1q', 'Mrs. Hallie Altenwerth', 'Davis', 'upload/photos/users/5.jpg', '63393 Hill Route\nMeaghanfort, MA 92966-7737', '4525', 'McDermott, Graham and Bartoletti', 'Reichert-Rempel', 'Hill Inc', 'Wilderman-Russel', 'Hauck and Sons', 'Ebert-Sporer', '', 'english', '3737', 'Fake', '94.204.114.7', 'user', '797-453-3340', 'UTC', '25.0657', '55.17128', 'Ut ab voluptas sed a nam. Sint autem inventore aut officia aut aut blanditiis. Ducimus eos odit amet et est ut eum.', '2001-05-11', 'DE', 1589221402, 1589221402, 2937, 0, 0, '0.00', '1', '0', '1', '0', '3', '0', '0', '0', '2020-05-12 00:23:22', '2020-05-11 18:23:22', '2020-05-11 18:23:22', '', '', '', '152', '1', 0, 0, '', '', 'Sint autem inventore aut officia', 'Ducimus', 1, 2, 3, 3, 3, 13, 2, 3, 0, 3, 2, 1, 2, 2, 2, 'pop', 'meat', 'song', 'hobby', 'city', 'sport', 'book', 'movie', 'red', 'tv', 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, '', '', '', NULL, 0, '0', '', '1'),
(15, 'storp_212', 'hlemke_279@yahoo.com', '$2y$11$nbQXdqzpO3yuEnFN8N0wG.8GMiNaoTNsjDzafIzzCMotxC80qNwje', 'Chelsey McDermott', 'Kuhic', 'upload/photos/users/5.jpg', '24818 Hoppe Ridge\nWolfstad, CO 63421-9430', '4525', 'Ullrich-Heaney', 'Brekke PLC', 'Corkery, Spinka and Ullrich', 'Balistreri, Nienow and Krajcik', 'Shields, Ritchie and Grimes', 'Jones-Nolan', '', 'english', '3837', 'Fake', '94.204.114.7', 'user', '(239) 931-2547', 'UTC', '25.0657', '55.17128', 'Ut ab voluptas sed a nam. Sint autem inventore aut officia aut aut blanditiis. Ducimus eos odit amet et est ut eum.', '2001-05-11', 'CO', 1589221403, 1589221403, 9682, 0, 0, '0.00', '1', '0', '1', '0', '3', '0', '0', '0', '2020-05-12 00:23:23', '2020-05-11 18:23:23', '2020-05-11 18:23:23', '', '', '', '152', '1', 0, 0, '', '', 'Sint autem inventore aut officia', 'Ducimus', 1, 2, 3, 3, 3, 13, 2, 3, 0, 3, 2, 1, 2, 2, 2, 'pop', 'meat', 'song', 'hobby', 'city', 'sport', 'book', 'movie', 'red', 'tv', 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, '', '', '', NULL, 0, '0', '', '1'),
(16, 'mina21_423', 'hickle_aylin_239@yahoo.com', '$2y$11$nmuSB5QwGqdvMZ4V9T597uwTRqrPTBUr2lXXT0dMt9bvzruW2UJW.', 'Santiago Renner', 'Hayes', 'upload/photos/users/6.jpg', '970 Farrell Forks Apt. 227\nPort Harvey, OK 71276', '4525', 'Stroman, Barrows and Schmeler', 'Hauck PLC', 'Raynor-Wiza', 'Cassin Inc', 'Powlowski Inc', 'Wehner-Corkery', '', 'english', '8401', 'Fake', '94.204.114.7', 'user', '+1-285-324-9822', 'UTC', '25.0657', '55.17128', 'Ut ab voluptas sed a nam. Sint autem inventore aut officia aut aut blanditiis. Ducimus eos odit amet et est ut eum.', '2001-05-11', 'IL', 1589221403, 1589221403, 3057, 0, 0, '0.00', '1', '0', '1', '0', '3', '0', '0', '0', '2020-05-12 00:23:23', '2020-05-11 18:23:23', '2020-05-11 18:23:23', '', '', '', '152', '1', 0, 0, '', '', 'Sint autem inventore aut officia', 'Ducimus', 1, 2, 3, 3, 3, 13, 2, 3, 0, 3, 2, 1, 2, 2, 2, 'pop', 'meat', 'song', 'hobby', 'city', 'sport', 'book', 'movie', 'red', 'tv', 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, '', '', '', NULL, 0, '0', '', '1'),
(17, 'schaden.michale_856', 'ernestina55_543@yahoo.com', '$2y$11$Yk.knn1tskxyyO.SYR2aFePTHNiMtu9ePyXpC/t8SYoDP5OgOtnXq', 'Jo Gibson V', 'Stokes', 'upload/photos/users/11.jpg', '2416 Huel Bridge\nConsuelomouth, WI 20709', '4526', 'Marks, Jacobson and Weissnat', 'Medhurst Ltd', 'Schneider Inc', 'Wiegand, Hermiston and Hessel', 'Streich, Brakus and Kohler', 'Kreiger-O\\&#039;Kon', '', 'english', '7543', 'Fake', '94.204.114.7', 'user', '+1-928-407-5099', 'UTC', '25.0657', '55.17128', 'Ut ab voluptas sed a nam. Sint autem inventore aut officia aut aut blanditiis. Ducimus eos odit amet et est ut eum.', '2001-05-11', 'HU', 1589221403, 1589221403, 9404, 0, 0, '0.00', '1', '0', '1', '0', '3', '0', '0', '0', '2020-05-12 00:23:23', '2020-05-11 18:23:23', '2020-05-11 18:23:23', '', '', '', '152', '1', 0, 0, '', '', 'Sint autem inventore aut officia', 'Ducimus', 1, 2, 3, 3, 3, 13, 2, 3, 0, 3, 2, 1, 2, 2, 2, 'pop', 'meat', 'song', 'hobby', 'city', 'sport', 'book', 'movie', 'red', 'tv', 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, '', '', '', NULL, 0, '0', '', '1'),
(18, 'markus64_324', 'ohara_ida_546@yahoo.com', '$2y$11$JkCYpR3KFtQVw11OkfcH9.1OKqPO5qVb2xN4ssOZJYuXwVWDMigmi', 'Michaela Purdy PhD', 'Luettgen', 'upload/photos/users/20.jpg', '72949 Schaefer Keys Suite 718\nReingerbury, IN 47042-3263', '4525', 'Marks-Hirthe', 'Gulgowski, Stracke and Stokes', 'Dietrich-Volkman', 'Bosco, Wilderman and Hagenes', 'Bode-Kemmer', 'Donnelly, Waelchi and Fahey', '', 'english', '3070', 'Fake', '94.204.114.7', 'user', '(425) 320-1143', 'UTC', '25.0657', '55.17128', 'Ut ab voluptas sed a nam. Sint autem inventore aut officia aut aut blanditiis. Ducimus eos odit amet et est ut eum.', '2001-05-11', 'TL', 1589221403, 1589221403, 3690, 0, 0, '0.00', '1', '0', '1', '0', '3', '0', '0', '0', '2020-05-12 00:23:23', '2020-05-11 18:23:23', '2020-05-11 18:23:23', '', '', '', '152', '1', 0, 0, '', '', 'Sint autem inventore aut officia', 'Ducimus', 1, 2, 3, 3, 3, 13, 2, 3, 0, 3, 2, 1, 2, 2, 2, 'pop', 'meat', 'song', 'hobby', 'city', 'sport', 'book', 'movie', 'red', 'tv', 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, '', '', '', NULL, 0, '0', '', '1'),
(19, 'gleason.derick_715', 'mayert_berenice_804@yahoo.com', '$2y$11$Z22p2FiiqYY8TapQjsaBru0nFOhlFRlqJrnyk1Byo5iecvb8hfzhi', 'Vergie O\\&#039;Reilly', 'Mosciski', 'upload/photos/users/12.jpg', '862 Janis Ranch\nLake Bryanachester, ID 10421-8811', '4525', 'Fahey-Veum', 'Maggio-Harber', 'O\\&#039;Keefe-Schuppe', 'Roberts-Stiedemann', 'Aufderhar-Upton', 'Mueller-Bins', '', 'english', '4339', 'Fake', '94.204.114.7', 'user', '548-434-2414', 'UTC', '25.0657', '55.17128', 'Ut ab voluptas sed a nam. Sint autem inventore aut officia aut aut blanditiis. Ducimus eos odit amet et est ut eum.', '2001-05-11', 'TJ', 1589221403, 1589221403, 6432, 0, 0, '0.00', '1', '0', '1', '0', '3', '0', '0', '0', '2020-05-12 00:23:23', '2020-05-11 18:23:23', '2020-05-11 18:23:23', '', '', '', '152', '1', 0, 0, '', '', 'Sint autem inventore aut officia', 'Ducimus', 1, 2, 3, 3, 3, 13, 2, 3, 0, 3, 2, 1, 2, 2, 2, 'pop', 'meat', 'song', 'hobby', 'city', 'sport', 'book', 'movie', 'red', 'tv', 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, '', '', '', NULL, 0, '0', '', '1'),
(20, 'darrell.ullrich_390', 'oschinner_519@yahoo.com', '$2y$11$o18ZR2qqFr752nHn7B9bjOZTYaajuhbT.CCNzkN/.v2sAcit9nJYC', 'Francis Gutmann', 'Dach', 'upload/photos/users/7.jpg', '44998 Marianne Harbor\nEast Gregoria, VT 53923', '4525', 'Cummerata-Williamson', 'Monahan-Watsica', 'Oberbrunner, Krajcik and Schiller', 'Jacobs, Daugherty and Wisozk', 'Orn, Conroy and Corkery', 'Erdman PLC', '', 'english', '4694', 'Fake', '94.204.114.7', 'user', '(278) 827-5076 x965', 'UTC', '25.0657', '55.17128', 'Ut ab voluptas sed a nam. Sint autem inventore aut officia aut aut blanditiis. Ducimus eos odit amet et est ut eum.', '2001-05-11', 'RU', 1589221403, 1589221403, 7911, 0, 0, '0.00', '1', '0', '1', '0', '3', '0', '0', '0', '2020-05-12 00:23:23', '2020-05-11 18:23:23', '2020-05-11 18:23:23', '', '', '', '152', '1', 0, 0, '', '', 'Sint autem inventore aut officia', 'Ducimus', 1, 2, 3, 3, 3, 13, 2, 3, 0, 3, 2, 1, 2, 2, 2, 'pop', 'meat', 'song', 'hobby', 'city', 'sport', 'book', 'movie', 'red', 'tv', 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, '', '', '', NULL, 0, '0', '', '1'),
(21, 'ray54_480', 'willms_lucile_373@yahoo.com', '$2y$11$0bu9aHTmp7CPuTmZLnR1Zuz44GyZcnrRecZV9Wmb0jzm.J6NKLRCe', 'Art Bradtke I', 'Kassulke', 'upload/photos/users/17.jpg', '94601 Melvin Cliffs\nPort Effie, RI 72262', '4525', 'Tillman, Terry and O\\&#039;Connell', 'Dare, Rath and Dibbert', 'Gislason, Koss and Smith', 'Stark, Mayer and Waters', 'Parker, Osinski and Okuneva', 'Feest, Bradtke and Windler', '', 'english', '3786', 'Fake', '94.204.114.7', 'user', '+1-716-514-2629', 'UTC', '25.0657', '55.17128', 'Ut ab voluptas sed a nam. Sint autem inventore aut officia aut aut blanditiis. Ducimus eos odit amet et est ut eum.', '2001-05-11', 'BS', 1589221404, 1589221404, 2695, 0, 0, '0.00', '1', '0', '1', '0', '3', '0', '0', '0', '2020-05-12 00:23:24', '2020-05-11 18:23:24', '2020-05-11 18:23:24', '', '', '', '152', '1', 0, 0, '', '', 'Sint autem inventore aut officia', 'Ducimus', 1, 2, 3, 3, 3, 13, 2, 3, 0, 3, 2, 1, 2, 2, 2, 'pop', 'meat', 'song', 'hobby', 'city', 'sport', 'book', 'movie', 'red', 'tv', 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, '', '', '', NULL, 0, '0', '', '1'),
(22, 'pjohnston_989', 'kirstin48_404@yahoo.com', '$2y$11$ym4TR/CSUuKEFfPxyeBvkOT6vJ2D/gfhDTQvL2cdYKOZ8AFJin.M.', 'Jude Okuneva', 'Corkery', 'upload/photos/users/3.jpg', '996 Konopelski Freeway Apt. 912\nOrnshire, MD 83490-6413', '4525', 'Koch-Hansen', 'Cormier-Littel', 'Bednar-Fisher', 'Lubowitz-Grady', 'Koss-Kohler', 'Ritchie, Dickens and Haley', '', 'english', '4625', 'Fake', '94.204.114.7', 'user', '1-951-397-2138 x964', 'UTC', '25.0657', '55.17128', 'Ut ab voluptas sed a nam. Sint autem inventore aut officia aut aut blanditiis. Ducimus eos odit amet et est ut eum.', '2001-05-11', 'AS', 1589221404, 1589221404, 9680, 0, 0, '0.00', '1', '0', '1', '0', '3', '0', '0', '0', '2020-05-12 00:23:24', '2020-05-11 18:23:24', '2020-05-11 18:23:24', '', '', '', '152', '1', 0, 0, '', '', 'Sint autem inventore aut officia', 'Ducimus', 1, 2, 3, 3, 3, 13, 2, 3, 0, 3, 2, 1, 2, 2, 2, 'pop', 'meat', 'song', 'hobby', 'city', 'sport', 'book', 'movie', 'red', 'tv', 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, '', '', '', NULL, 0, '0', '', '1'),
(23, 'herminio02_931', 'murazik_gerard_778@yahoo.com', '$2y$11$4t5a.ymdiLzX7CquXJghqOESUoIEzsEe45XW6Bp0f9Ct08hy39ESC', 'Ewell Fadel IV', 'Mueller', 'upload/photos/users/20.jpg', '28922 Paucek Courts Suite 070\nPort Nat, DC 47524', '4525', 'Romaguera, Bechtelar and Towne', 'Harris, Corkery and McLaughlin', 'Bahringer-Mraz', 'Macejkovic Group', 'Wisozk Inc', 'Rath-VonRueden', '', 'english', '8168', 'Fake', '94.204.114.7', 'user', '1-843-297-3844 x5552', 'UTC', '25.0657', '55.17128', 'Ut ab voluptas sed a nam. Sint autem inventore aut officia aut aut blanditiis. Ducimus eos odit amet et est ut eum.', '2001-05-11', 'SB', 1589221404, 1589221404, 9133, 0, 0, '0.00', '1', '0', '1', '0', '3', '0', '0', '0', '2020-05-12 00:23:24', '2020-05-11 18:23:24', '2020-05-11 18:23:24', '', '', '', '152', '1', 0, 0, '', '', 'Sint autem inventore aut officia', 'Ducimus', 1, 2, 3, 3, 3, 13, 2, 3, 0, 3, 2, 1, 2, 2, 2, 'pop', 'meat', 'song', 'hobby', 'city', 'sport', 'book', 'movie', 'red', 'tv', 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, '', '', '', NULL, 0, '0', '', '1'),
(24, 'marks.cali_256', 'medhurst_karley_744@yahoo.com', '$2y$11$C3Z0Z6/hi5YhKBcpmYeoL.fduAh0FoxFpzSiap4eakyZIIWaTXeQC', 'Prof. Randi Hermiston IV', 'Carroll', 'upload/photos/users/11.jpg', '70998 Orrin Overpass Apt. 731\nWest Maria, HI 28097-0314', '4525', 'Wiegand-Hermann', 'Predovic-Huel', 'Schinner PLC', 'Hackett, Mayert and Reichel', 'Becker Group', 'Gutmann LLC', '', 'english', '4460', 'Fake', '94.204.114.7', 'user', '346-957-9774', 'UTC', '25.0657', '55.17128', 'Ut ab voluptas sed a nam. Sint autem inventore aut officia aut aut blanditiis. Ducimus eos odit amet et est ut eum.', '2001-05-11', 'QA', 1589221404, 1589221404, 7323, 0, 0, '0.00', '1', '0', '1', '0', '3', '0', '0', '0', '2020-05-12 00:23:24', '2020-05-11 18:23:24', '2020-05-11 18:23:24', '', '', '', '152', '1', 0, 0, '', '', 'Sint autem inventore aut officia', 'Ducimus', 1, 2, 3, 3, 3, 13, 2, 3, 0, 3, 2, 1, 2, 2, 2, 'pop', 'meat', 'song', 'hobby', 'city', 'sport', 'book', 'movie', 'red', 'tv', 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, '', '', '', NULL, 0, '0', '', '1'),
(25, 'marcelle51_256', 'ffeest_785@yahoo.com', '$2y$11$UGmBI8VXxtZ57UQXcNIJLu/37b1zgR8/dVI9g5sWu4tdydy511Fvq', 'Prof. Antonette Torphy', 'Krajcik', 'upload/photos/users/17.jpg', '386 Mohr Glen Suite 294\nRemingtonton, AZ 62679-1303', '4526', 'Grant-Kuhic', 'Dietrich, Ankunding and Schmidt', 'Aufderhar-Von', 'Walter-O\\&#039;Connell', 'Hill-Kuhlman', 'Lehner-Morar', '', 'english', '5858', 'Fake', '94.204.114.7', 'user', '950-287-4965 x290', 'UTC', '25.0657', '55.17128', 'Ut ab voluptas sed a nam. Sint autem inventore aut officia aut aut blanditiis. Ducimus eos odit amet et est ut eum.', '2001-05-11', 'GQ', 1589221477, 1589221477, 8610, 0, 0, '0.00', '1', '0', '1', '0', '3', '0', '0', '0', '2020-05-12 00:24:37', '2020-05-11 18:24:37', '2020-05-11 18:24:37', '', '', '', '152', '1', 0, 0, '', '', 'Sint autem inventore aut officia', 'Ducimus', 1, 2, 3, 3, 3, 13, 2, 3, 0, 3, 2, 1, 2, 2, 2, 'pop', 'meat', 'song', 'hobby', 'city', 'sport', 'book', 'movie', 'red', 'tv', 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, '', '', '', NULL, 0, '0', '', '1'),
(26, 'xkessler_139', 'lilliana61_265@yahoo.com', '$2y$11$XrRks9h7sbjYmcSqUzh9WO2t.S4SGxBq87intTxQktCPI.CqyAQjS', 'Laron Boyle', 'Kling', 'upload/photos/users/14.jpg', '35410 Yazmin Curve\nLake Rudyburgh, VA 69074-7512', '4525', 'Block, Kovacek and Botsford', 'Nikolaus-Kovacek', 'Wisoky Inc', 'Spinka Ltd', 'Schuster-Blick', 'Legros, Ritchie and Bechtelar', '', 'english', '8438', 'Fake', '94.204.114.7', 'user', '(917) 810-4165', 'UTC', '25.0657', '55.17128', 'Ut ab voluptas sed a nam. Sint autem inventore aut officia aut aut blanditiis. Ducimus eos odit amet et est ut eum.', '2001-05-11', 'AI', 1589221477, 1589221477, 3932, 0, 0, '0.00', '1', '0', '1', '0', '3', '0', '0', '0', '2020-05-12 00:24:37', '2020-05-11 18:24:37', '2020-05-11 18:24:37', '', '', '', '152', '1', 0, 0, '', '', 'Sint autem inventore aut officia', 'Ducimus', 1, 2, 3, 3, 3, 13, 2, 3, 0, 3, 2, 1, 2, 2, 2, 'pop', 'meat', 'song', 'hobby', 'city', 'sport', 'book', 'movie', 'red', 'tv', 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, '', '', '', NULL, 0, '0', '', '1'),
(27, 'dawson.cronin_940', 'george_friesen_888@yahoo.com', '$2y$11$lPQ.gOO1hkGz5s7m6glOU.DeiEvNAMP9m8N.JD3pdpnqeYkRkNpVK', 'Bailee Bauch', 'Kling', 'upload/photos/users/7.jpg', '63545 Quigley Lock Apt. 539\nTressamouth, WA 59361-7288', '4526', 'Rempel Ltd', 'Cartwright, Goldner and Bernhard', 'Steuber, Hand and Christiansen', 'Cruickshank and Sons', 'Mohr-Kilback', 'Schmitt PLC', '', 'english', '3480', 'Fake', '94.204.114.7', 'user', '1-894-623-3452', 'UTC', '25.0657', '55.17128', 'Ut ab voluptas sed a nam. Sint autem inventore aut officia aut aut blanditiis. Ducimus eos odit amet et est ut eum.', '2001-05-11', 'GP', 1589221478, 1589221478, 3120, 0, 0, '0.00', '1', '0', '1', '0', '3', '0', '0', '0', '2020-05-12 00:24:38', '2020-05-11 18:24:38', '2020-05-11 18:24:38', '', '', '', '152', '1', 0, 0, '', '', 'Sint autem inventore aut officia', 'Ducimus', 1, 2, 3, 3, 3, 13, 2, 3, 0, 3, 2, 1, 2, 2, 2, 'pop', 'meat', 'song', 'hobby', 'city', 'sport', 'book', 'movie', 'red', 'tv', 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, '', '', '', NULL, 0, '0', '', '1'),
(28, 'wbailey_140', 'xokuneva_820@yahoo.com', '$2y$11$pe/kP863E.zfrWB793Tok.1k1iJSgED/ONPJAXsx8A.7ZrX9oQ2r6', 'Kelton Kuhn', 'Ullrich', 'upload/photos/users/19.jpg', '957 Patrick Mountains Apt. 084\nEast Cieloland, NM 94250', '4526', 'Fadel LLC', 'Sanford, Boyer and Gleason', 'Stark, Stanton and Kozey', 'Koch-Effertz', 'Balistreri, Hyatt and Senger', 'Weimann-Simonis', '', 'english', '6961', 'Fake', '94.204.114.7', 'user', '(759) 551-9252 x2082', 'UTC', '25.0657', '55.17128', 'Ut ab voluptas sed a nam. Sint autem inventore aut officia aut aut blanditiis. Ducimus eos odit amet et est ut eum.', '2001-05-11', 'GH', 1589221478, 1589221478, 2503, 0, 0, '0.00', '1', '0', '1', '0', '3', '0', '0', '0', '2020-05-12 00:24:38', '2020-05-11 18:24:38', '2020-05-11 18:24:38', '', '', '', '152', '1', 0, 0, '', '', 'Sint autem inventore aut officia', 'Ducimus', 1, 2, 3, 3, 3, 13, 2, 3, 0, 3, 2, 1, 2, 2, 2, 'pop', 'meat', 'song', 'hobby', 'city', 'sport', 'book', 'movie', 'red', 'tv', 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, '', '', '', NULL, 0, '0', '', '1'),
(29, 'concepcion85_650', 'penelope_johnston_869@yahoo.com', '$2y$11$4XBTlnuQgfmWEAKMQnbJo.qjau1jYFOKlMt5uMmPnfVOPVdxQYoci', 'Libby Rath', 'Murray', 'upload/photos/users/10.jpg', '837 Dallas Road Apt. 645\nEast Jacinthe, SD 96663', '4526', 'Grady, Ledner and Goodwin', 'Breitenberg, Pagac and Padberg', 'Hermann PLC', 'Lubowitz, Daugherty and Yost', 'Emmerich and Sons', 'Altenwerth-Schowalter', '', 'english', '6074', 'Fake', '94.204.114.7', 'user', '(395) 888-5175 x5456', 'UTC', '25.0657', '55.17128', 'Ut ab voluptas sed a nam. Sint autem inventore aut officia aut aut blanditiis. Ducimus eos odit amet et est ut eum.', '2001-05-11', 'CV', 1589221478, 1589221478, 9042, 0, 0, '0.00', '1', '0', '1', '0', '3', '0', '0', '0', '2020-05-12 00:24:38', '2020-05-11 18:24:38', '2020-05-11 18:24:38', '', '', '', '152', '1', 0, 0, '', '', 'Sint autem inventore aut officia', 'Ducimus', 1, 2, 3, 3, 3, 13, 2, 3, 0, 3, 2, 1, 2, 2, 2, 'pop', 'meat', 'song', 'hobby', 'city', 'sport', 'book', 'movie', 'red', 'tv', 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, '', '', '', NULL, 0, '0', '', '1'),
(30, 'fkub_957', 'pinkie_ledner_420@yahoo.com', '$2y$11$JLjWHupzMWNQgvsgw75AeuQ2DHnl59Ikn/ZUvuk26hfWbMna5sTxC', 'Savanah Stroman Jr.', 'Hackett', 'upload/photos/users/19.jpg', '3615 Daija Mall Apt. 840\nSouth Maiatown, OK 70672', '4525', 'Mraz, Roberts and Rau', 'Ward, Cassin and Reynolds', 'Weber, Rowe and Kutch', 'Spinka, Turcotte and Schuster', 'Beatty, Padberg and O\\&#039;Kon', 'Rau-Mills', '', 'english', '5435', 'Fake', '94.204.114.7', 'user', '739-282-0121 x923', 'UTC', '25.0657', '55.17128', 'Ut ab voluptas sed a nam. Sint autem inventore aut officia aut aut blanditiis. Ducimus eos odit amet et est ut eum.', '2001-05-11', 'IE', 1589221478, 1589221478, 6225, 0, 0, '0.00', '1', '0', '1', '0', '3', '0', '0', '0', '2020-05-12 00:24:38', '2020-05-11 18:24:38', '2020-05-11 18:24:38', '', '', '', '152', '1', 0, 0, '', '', 'Sint autem inventore aut officia', 'Ducimus', 1, 2, 3, 3, 3, 13, 2, 3, 0, 3, 2, 1, 2, 2, 2, 'pop', 'meat', 'song', 'hobby', 'city', 'sport', 'book', 'movie', 'red', 'tv', 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, '', '', '', NULL, 0, '0', '', '1'),
(31, 'wfriesen_136', 'montana_parker_298@yahoo.com', '$2y$11$d5A.84oN6ra.f.ChVYvavuNVTcPKUmY4If3OasUkmCMGaO8BsHhYS', 'Mr. Fredy Considine III', 'Marvin', 'upload/photos/users/12.jpg', '144 Lyla Station Suite 940\nNorth Nicolas, NE 75803-1032', '4526', 'Murphy LLC', 'Bayer, Douglas and Kessler', 'Hartmann, Abshire and Mosciski', 'Ferry, Schamberger and Yundt', 'Ortiz Ltd', 'O\\&#039;Kon Inc', '', 'english', '5954', 'Fake', '94.204.114.7', 'user', '(942) 667-8654 x006', 'UTC', '25.0657', '55.17128', 'Ut ab voluptas sed a nam. Sint autem inventore aut officia aut aut blanditiis. Ducimus eos odit amet et est ut eum.', '2001-05-11', 'TM', 1589221478, 1589221478, 8001, 0, 0, '0.00', '1', '0', '1', '0', '3', '0', '0', '0', '2020-05-12 00:24:38', '2020-05-11 18:24:38', '2020-05-11 18:24:38', '', '', '', '152', '1', 0, 0, '', '', 'Sint autem inventore aut officia', 'Ducimus', 1, 2, 3, 3, 3, 13, 2, 3, 0, 3, 2, 1, 2, 2, 2, 'pop', 'meat', 'song', 'hobby', 'city', 'sport', 'book', 'movie', 'red', 'tv', 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, '', '', '', NULL, 0, '0', '', '1'),
(32, 'dolly.schaefer_248', 'retha_hermiston_236@yahoo.com', '$2y$11$JTz26NUlsQqP9QlN2O/t8OpHjPfney/GTI7BzK6261qUl1Sst80ga', 'Kenyon Kilback', 'Donnelly', 'upload/photos/users/4.jpg', '986 Stamm Overpass\nNew Pearline, GA 00241-5725', '4526', 'Wilderman and Sons', 'Lakin, Feest and Ward', 'Muller, Reinger and Lehner', 'Medhurst, Beatty and Turcotte', 'Koss-Konopelski', 'Veum-Veum', '', 'english', '5980', 'Fake', '94.204.114.7', 'user', '1-574-735-4303 x0301', 'UTC', '25.0657', '55.17128', 'Ut ab voluptas sed a nam. Sint autem inventore aut officia aut aut blanditiis. Ducimus eos odit amet et est ut eum.', '2001-05-11', 'SN', 1589221478, 1589221478, 2555, 0, 0, '0.00', '1', '0', '1', '0', '3', '0', '0', '0', '2020-05-12 00:24:38', '2020-05-11 18:24:38', '2020-05-11 18:24:38', '', '', '', '152', '1', 0, 0, '', '', 'Sint autem inventore aut officia', 'Ducimus', 1, 2, 3, 3, 3, 13, 2, 3, 0, 3, 2, 1, 2, 2, 2, 'pop', 'meat', 'song', 'hobby', 'city', 'sport', 'book', 'movie', 'red', 'tv', 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, '', '', '', NULL, 0, '0', '', '1'),
(33, 'vtorp_806', 'mozell_morar_189@yahoo.com', '$2y$11$xUZlPP6eUGqB1X0FPtyLrujmJpmlJVjela0FybLoQEv5hIcjnbnju', 'Armando Botsford', 'Konopelski', 'upload/photos/users/20.jpg', '30661 Clementine Ridges Apt. 889\nCorbinborough, FL 50504', '4526', 'Padberg, Weissnat and Gerhold', 'Hickle Group', 'Franecki Group', 'Jacobi-Gottlieb', 'Weissnat-Legros', 'Kutch, Bayer and Deckow', '', 'english', '2047', 'Fake', '94.204.114.7', 'user', '+1-837-815-5350', 'UTC', '25.0657', '55.17128', 'Ut ab voluptas sed a nam. Sint autem inventore aut officia aut aut blanditiis. Ducimus eos odit amet et est ut eum.', '2001-05-11', 'KE', 1589221479, 1589221479, 2699, 0, 0, '0.00', '1', '0', '1', '0', '3', '0', '0', '0', '2020-05-12 00:24:39', '2020-05-11 18:24:39', '2020-05-11 18:24:39', '', '', '', '152', '1', 0, 0, '', '', 'Sint autem inventore aut officia', 'Ducimus', 1, 2, 3, 3, 3, 13, 2, 3, 0, 3, 2, 1, 2, 2, 2, 'pop', 'meat', 'song', 'hobby', 'city', 'sport', 'book', 'movie', 'red', 'tv', 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, '', '', '', NULL, 0, '0', '', '1'),
(34, 'ohackett_473', 'lenora_osinski_493@yahoo.com', '$2y$11$OIZ6Zq67dvKO29VXne5vE.hzyPc7XPgH5EO8.q/aXR5sI2ZC4hA82', 'Prof. Mavis Rempel', 'Wisoky', 'upload/photos/users/17.jpg', '68545 Block Common\nSimonisville, MO 88163', '4525', 'Roberts, Watsica and Spencer', 'Abshire Ltd', 'Little-Bayer', 'Langworth Ltd', 'Huels Group', 'Davis-Pollich', '', 'english', '1837', 'Fake', '94.204.114.7', 'user', '823.317.5482 x685', 'UTC', '25.0657', '55.17128', 'Ut ab voluptas sed a nam. Sint autem inventore aut officia aut aut blanditiis. Ducimus eos odit amet et est ut eum.', '2001-05-11', 'TT', 1589221479, 1589221479, 5983, 0, 0, '0.00', '1', '0', '1', '0', '3', '0', '0', '0', '2020-05-12 00:24:39', '2020-05-11 18:24:39', '2020-05-11 18:24:39', '', '', '', '152', '1', 0, 0, '', '', 'Sint autem inventore aut officia', 'Ducimus', 1, 2, 3, 3, 3, 13, 2, 3, 0, 3, 2, 1, 2, 2, 2, 'pop', 'meat', 'song', 'hobby', 'city', 'sport', 'book', 'movie', 'red', 'tv', 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, '', '', '', NULL, 0, '0', '', '1'),
(35, 'bins.jena_261', 'ijohns_728@yahoo.com', '$2y$11$9etUsJU.xR3KP4vzumfUDOmmwAIhXa7Nbj/lX15KI00TgvtVa5S96', 'Prof. Alfonso Hackett II', 'Labadie', 'upload/photos/users/11.jpg', '369 Alene Cliffs Suite 798\nVandervortland, SC 12299', '4525', 'Schinner and Sons', 'Dickens, Reilly and Fisher', 'Ryan Group', 'Cremin Ltd', 'Weissnat-Bosco', 'Thompson-Gleichner', '', 'english', '2095', 'Fake', '94.204.114.7', 'user', '1-803-521-0661 x07895', 'UTC', '25.0657', '55.17128', 'Ut ab voluptas sed a nam. Sint autem inventore aut officia aut aut blanditiis. Ducimus eos odit amet et est ut eum.', '2001-05-11', 'PR', 1589221479, 1589221479, 3763, 0, 0, '0.00', '1', '0', '1', '0', '3', '0', '0', '0', '2020-05-12 00:24:39', '2020-05-11 18:24:39', '2020-05-11 18:24:39', '', '', '', '152', '1', 0, 0, '', '', 'Sint autem inventore aut officia', 'Ducimus', 1, 2, 3, 3, 3, 13, 2, 3, 0, 3, 2, 1, 2, 2, 2, 'pop', 'meat', 'song', 'hobby', 'city', 'sport', 'book', 'movie', 'red', 'tv', 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, '', '', '', NULL, 0, '0', '', '1'),
(36, 'bdicki_721', 'kilback_libbie_253@yahoo.com', '$2y$11$2Xjjc/Usg8GcRTEFVA81nO1vRESO3bMCQHC9qrrM8fZa2gKK9mS/2', 'Stacy O\\&#039;Kon', 'Little', 'upload/photos/users/15.jpg', '396 Flatley Village Suite 665\nEast Vernon, IA 25715', '4526', 'Thiel Ltd', 'Kuhlman and Sons', 'Haag, Mueller and Jerde', 'Mayert, Koch and Ferry', 'Reichel, Thompson and Reilly', 'Lubowitz, Bayer and Grady', '', 'english', '2517', 'Fake', '94.204.114.7', 'user', '687-738-2934', 'UTC', '25.0657', '55.17128', 'Ut ab voluptas sed a nam. Sint autem inventore aut officia aut aut blanditiis. Ducimus eos odit amet et est ut eum.', '2001-05-11', 'SO', 1589221479, 1589221479, 8285, 0, 0, '0.00', '1', '0', '1', '0', '3', '0', '0', '0', '2020-05-12 00:24:39', '2020-05-11 18:24:39', '2020-05-11 18:24:39', '', '', '', '152', '1', 0, 0, '', '', 'Sint autem inventore aut officia', 'Ducimus', 1, 2, 3, 3, 3, 13, 2, 3, 0, 3, 2, 1, 2, 2, 2, 'pop', 'meat', 'song', 'hobby', 'city', 'sport', 'book', 'movie', 'red', 'tv', 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, '', '', '', NULL, 0, '0', '', '1'),
(37, 'kaleb10_623', 'allison66_873@yahoo.com', '$2y$11$UwqfXsdVutK0OZOsjzb0r.vtyaH7ypU2nDdCfywsVNrWR30arSJL2', 'Prof. Austin Aufderhar I', 'Anderson', 'upload/photos/users/5.jpg', '97452 Mayer Green Apt. 807\nAdellmouth, FL 47626-7131', '4525', 'D\\&#039;Amore-Volkman', 'Corkery LLC', 'Weimann PLC', 'Weber-Herman', 'Kuvalis-Fay', 'Braun, Hill and Botsford', '', 'english', '3817', 'Fake', '94.204.114.7', 'user', '992.666.4841 x4920', 'UTC', '25.0657', '55.17128', 'Ut ab voluptas sed a nam. Sint autem inventore aut officia aut aut blanditiis. Ducimus eos odit amet et est ut eum.', '2001-05-11', 'AD', 1589221479, 1589221479, 7553, 0, 0, '0.00', '1', '0', '1', '0', '3', '0', '0', '0', '2020-05-12 00:24:39', '2020-05-11 18:24:39', '2020-05-11 18:24:39', '', '', '', '152', '1', 0, 0, '', '', 'Sint autem inventore aut officia', 'Ducimus', 1, 2, 3, 3, 3, 13, 2, 3, 0, 3, 2, 1, 2, 2, 2, 'pop', 'meat', 'song', 'hobby', 'city', 'sport', 'book', 'movie', 'red', 'tv', 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, '', '', '', NULL, 0, '0', '', '1'),
(38, 'hettinger.jett_923', 'frami_janet_323@yahoo.com', '$2y$11$/C0ROWhk/VE9BxgSGmfDnuPmeBL0exhevP9fJ9mzsETxfDsSf9hXC', 'Marlene Heaney', 'Weissnat', 'upload/photos/users/16.jpg', '600 Ted Brook\nBeattyberg, AR 64498', '4525', 'Koepp-Streich', 'Wunsch PLC', 'Toy-Harris', 'Harber LLC', 'Kreiger-Wuckert', 'Erdman-Schiller', '', 'english', '2191', 'Fake', '94.204.114.7', 'user', '420-286-6283 x62451', 'UTC', '25.0657', '55.17128', 'Ut ab voluptas sed a nam. Sint autem inventore aut officia aut aut blanditiis. Ducimus eos odit amet et est ut eum.', '2001-05-11', 'GI', 1589221479, 1589221479, 8606, 0, 0, '0.00', '1', '0', '1', '0', '3', '0', '0', '0', '2020-05-12 00:24:39', '2020-05-11 18:24:39', '2020-05-11 18:24:39', '', '', '', '152', '1', 0, 0, '', '', 'Sint autem inventore aut officia', 'Ducimus', 1, 2, 3, 3, 3, 13, 2, 3, 0, 3, 2, 1, 2, 2, 2, 'pop', 'meat', 'song', 'hobby', 'city', 'sport', 'book', 'movie', 'red', 'tv', 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, '', '', '', NULL, 0, '0', '', '1'),
(39, 'domingo42_966', 'cynthia_schultz_531@yahoo.com', '$2y$11$88o.L.ogCObUuTtvfRap.u/k/TfNnjLjK0T5Kzuq6kQSD6lAf2sX6', 'Tierra Jerde Jr.', 'Lockman', 'upload/photos/users/3.jpg', '3453 Alverta Land\nWeberport, AZ 27770-4093', '4525', 'Roberts, Murray and Conroy', 'Bashirian-Wehner', 'Gulgowski, Mante and Mraz', 'Douglas-Blick', 'Greenfelder Ltd', 'Pollich, Gislason and Nikolaus', '', 'english', '8306', 'Fake', '94.204.114.7', 'user', '805.232.1030', 'UTC', '25.0657', '55.17128', 'Ut ab voluptas sed a nam. Sint autem inventore aut officia aut aut blanditiis. Ducimus eos odit amet et est ut eum.', '2001-05-11', 'KE', 1589221480, 1589221480, 1430, 0, 0, '0.00', '1', '0', '1', '0', '3', '0', '0', '0', '2020-05-12 00:24:40', '2020-05-11 18:24:40', '2020-05-11 18:24:40', '', '', '', '152', '1', 0, 0, '', '', 'Sint autem inventore aut officia', 'Ducimus', 1, 2, 3, 3, 3, 13, 2, 3, 0, 3, 2, 1, 2, 2, 2, 'pop', 'meat', 'song', 'hobby', 'city', 'sport', 'book', 'movie', 'red', 'tv', 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, '', '', '', NULL, 0, '0', '', '1'),
(40, 'antonia.jones_713', 'ocrona_621@yahoo.com', '$2y$11$DIP7rwDZK4SyfqL6CBsph.nUKZknCCifhLBjFuswlb0vjPXYDZ2iK', 'Layla Johnson', 'Prohaska', 'upload/photos/users/13.jpg', '646 Alexane Island\nHellerbury, IA 66311-9154', '4525', 'Dooley, Heathcote and Dickens', 'Hand, Hagenes and Kshlerin', 'Gutmann-Roob', 'Bahringer LLC', 'Botsford, Kshlerin and Wolff', 'Kozey Inc', '', 'english', '2423', 'Fake', '94.204.114.7', 'user', '1-749-215-8763 x24349', 'UTC', '25.0657', '55.17128', 'Ut ab voluptas sed a nam. Sint autem inventore aut officia aut aut blanditiis. Ducimus eos odit amet et est ut eum.', '2001-05-11', 'GG', 1589221480, 1589221480, 2758, 0, 0, '0.00', '1', '0', '1', '0', '3', '0', '0', '0', '2020-05-12 00:24:40', '2020-05-11 18:24:40', '2020-05-11 18:24:40', '', '', '', '152', '1', 0, 0, '', '', 'Sint autem inventore aut officia', 'Ducimus', 1, 2, 3, 3, 3, 13, 2, 3, 0, 3, 2, 1, 2, 2, 2, 'pop', 'meat', 'song', 'hobby', 'city', 'sport', 'book', 'movie', 'red', 'tv', 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, '', '', '', NULL, 0, '0', '', '1'),
(41, 'gleichner.larissa_574', 'deven_bayer_363@yahoo.com', '$2y$11$qDGYOqJEZr0nXJShfAy8BeFtKOWEACJisuibOkQTjnJl9GQAI7QA2', 'Mrs. Ines Johnson', 'Ritchie', 'upload/photos/users/10.jpg', '1372 Oberbrunner Landing\nEast Gerardo, NE 93414-2305', '4526', 'Okuneva Group', 'Keebler, Pfeffer and Ziemann', 'Beahan Inc', 'Kassulke, Waters and Hoeger', 'Larkin Inc', 'Schaden and Sons', '', 'english', '4304', 'Fake', '94.204.114.7', 'user', '972-379-2281 x1028', 'UTC', '25.0657', '55.17128', 'Ut ab voluptas sed a nam. Sint autem inventore aut officia aut aut blanditiis. Ducimus eos odit amet et est ut eum.', '2001-05-11', 'CK', 1589221480, 1589221480, 5655, 0, 0, '0.00', '1', '0', '1', '0', '3', '0', '0', '0', '2020-05-12 00:24:40', '2020-05-11 18:24:40', '2020-05-11 18:24:40', '', '', '', '152', '1', 0, 0, '', '', 'Sint autem inventore aut officia', 'Ducimus', 1, 2, 3, 3, 3, 13, 2, 3, 0, 3, 2, 1, 2, 2, 2, 'pop', 'meat', 'song', 'hobby', 'city', 'sport', 'book', 'movie', 'red', 'tv', 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, '', '', '', NULL, 0, '0', '', '1'),
(42, 'annabelle50_560', 'ernser_eve_725@yahoo.com', '$2y$11$KEZYH1OJeai4UWK.ZZNC.ectqxIRyfnUL30FmFBiWcREF8g.4MIFK', 'Prof. Janice Torp', 'Denesik', 'upload/photos/users/18.jpg', '758 Jeffery Fork Suite 878\nWest Nadia, OK 49917-1177', '4525', 'Macejkovic, Padberg and Hackett', 'Ryan Inc', 'Hoeger-Lubowitz', 'Beer, Koelpin and Reichert', 'Tromp, Champlin and Hagenes', 'Nikolaus-Adams', '', 'english', '8191', 'Fake', '94.204.114.7', 'user', '(378) 754-8598 x4592', 'UTC', '25.0657', '55.17128', 'Ut ab voluptas sed a nam. Sint autem inventore aut officia aut aut blanditiis. Ducimus eos odit amet et est ut eum.', '2001-05-11', 'UA', 1589221480, 1589221480, 3995, 0, 0, '0.00', '1', '0', '1', '0', '3', '0', '0', '0', '2020-05-12 00:24:40', '2020-05-11 18:24:40', '2020-05-11 18:24:40', '', '', '', '152', '1', 0, 0, '', '', 'Sint autem inventore aut officia', 'Ducimus', 1, 2, 3, 3, 3, 13, 2, 3, 0, 3, 2, 1, 2, 2, 2, 'pop', 'meat', 'song', 'hobby', 'city', 'sport', 'book', 'movie', 'red', 'tv', 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, '', '', '', NULL, 0, '0', '', '1'),
(43, 'umcdermott_912', 'marilou93_165@yahoo.com', '$2y$11$UVs.ycVz4yRoE9FHrZtGNOJz0s3Da0y19W62mkss8eWYfWfNFUK9e', 'Ellis Dietrich', 'Wunsch', 'upload/photos/users/3.jpg', '1413 Brielle Flat\nSwiftville, UT 40805', '4525', 'Marks, Rutherford and Ritchie', 'Stokes Inc', 'Walker-Miller', 'Franecki-Eichmann', 'Nolan-Gleason', 'Bradtke-Glover', '', 'english', '6992', 'Fake', '94.204.114.7', 'user', '+1.428.382.2511', 'UTC', '25.0657', '55.17128', 'Ut ab voluptas sed a nam. Sint autem inventore aut officia aut aut blanditiis. Ducimus eos odit amet et est ut eum.', '2001-05-11', 'TV', 1589221480, 1589221480, 2213, 0, 0, '0.00', '1', '0', '1', '0', '3', '0', '0', '0', '2020-05-12 00:24:40', '2020-05-11 18:24:40', '2020-05-11 18:24:40', '', '', '', '152', '1', 0, 0, '', '', 'Sint autem inventore aut officia', 'Ducimus', 1, 2, 3, 3, 3, 13, 2, 3, 0, 3, 2, 1, 2, 2, 2, 'pop', 'meat', 'song', 'hobby', 'city', 'sport', 'book', 'movie', 'red', 'tv', 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, '', '', '', NULL, 0, '0', '', '1'),
(44, 'mschultz_936', 'clare_kuphal_309@yahoo.com', '$2y$11$JQhST8VmTUEJ88.mhN3W8..PlnGOHuFURKqI55gmCzYa1U9jOXoo6', 'Ms. Marlene Bogan MD', 'Hartmann', 'upload/photos/users/5.jpg', '606 Bergstrom Ridge\nWatsicabury, WV 22041', '4525', 'Skiles, Breitenberg and Monahan', 'Langosh-Leannon', 'Hegmann-Abbott', 'Hackett, Wolff and Buckridge', 'Bashirian-Bosco', 'Crist, Collier and Swift', '', 'english', '8476', 'Fake', '94.204.114.7', 'user', '(331) 645-9046 x9200', 'UTC', '25.0657', '55.17128', 'Ut ab voluptas sed a nam. Sint autem inventore aut officia aut aut blanditiis. Ducimus eos odit amet et est ut eum.', '2001-05-11', 'DJ', 1589221481, 1589221481, 5642, 0, 0, '0.00', '1', '0', '1', '0', '3', '0', '0', '0', '2020-05-12 00:24:41', '2020-05-11 18:24:41', '2020-05-11 18:24:41', '', '', '', '152', '1', 0, 0, '', '', 'Sint autem inventore aut officia', 'Ducimus', 1, 2, 3, 3, 3, 13, 2, 3, 0, 3, 2, 1, 2, 2, 2, 'pop', 'meat', 'song', 'hobby', 'city', 'sport', 'book', 'movie', 'red', 'tv', 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, '', '', '', NULL, 0, '0', '', '1');

-- --------------------------------------------------------

--
-- Table structure for table `user_chat_buy`
--

CREATE TABLE `user_chat_buy` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `chat_user_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_gifts`
--

CREATE TABLE `user_gifts` (
  `id` int(11) NOT NULL,
  `from` int(11) NOT NULL DEFAULT '0',
  `to` int(11) NOT NULL DEFAULT '0',
  `gift_id` int(11) NOT NULL DEFAULT '0',
  `time` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `videocalles`
--

CREATE TABLE `videocalles` (
  `id` int(11) NOT NULL,
  `access_token` text,
  `access_token_2` text,
  `from_id` int(11) NOT NULL DEFAULT '0',
  `to_id` int(11) NOT NULL DEFAULT '0',
  `room_name` varchar(50) NOT NULL DEFAULT '',
  `active` int(11) NOT NULL DEFAULT '0',
  `called` int(11) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL DEFAULT '0',
  `declined` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `views`
--

CREATE TABLE `views` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT '0',
  `view_userid` int(11) UNSIGNED DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `views`
--

INSERT INTO `views` (`id`, `user_id`, `view_userid`, `created_at`) VALUES
(1, 1, 4, '2020-05-11 22:27:51');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `affiliates_requests`
--
ALTER TABLE `affiliates_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `time` (`time`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `announcement`
--
ALTER TABLE `announcement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `announcement_views`
--
ALTER TABLE `announcement_views`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `announcement_id` (`announcement_id`);

--
-- Indexes for table `audiocalls`
--
ALTER TABLE `audiocalls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `to_id` (`to_id`),
  ADD KEY `from_id` (`from_id`),
  ADD KEY `call_id` (`call_id`),
  ADD KEY `called` (`called`),
  ADD KEY `declined` (`declined`);

--
-- Indexes for table `bank_receipts`
--
ALTER TABLE `bank_receipts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `banned_ip`
--
ALTER TABLE `banned_ip`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ip_address` (`ip_address`);

--
-- Indexes for table `blocks`
--
ALTER TABLE `blocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `block_userid` (`block_userid`),
  ADD KEY `created_at` (`created_at`);

--
-- Indexes for table `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title` (`title`),
  ADD KEY `category` (`category`),
  ADD KEY `tags` (`tags`(255));

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `receiver_id` (`receiver_id`),
  ADD KEY `created_at` (`created_at`),
  ADD KEY `receiver_id_2` (`receiver_id`),
  ADD KEY `sender_id_2` (`sender_id`),
  ADD KEY `from_delete` (`from_delete`),
  ADD KEY `to_delete` (`to_delete`);

--
-- Indexes for table `custom_pages`
--
ALTER TABLE `custom_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `followers`
--
ALTER TABLE `followers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `following_id` (`following_id`),
  ADD KEY `follower_id` (`follower_id`),
  ADD KEY `active` (`active`),
  ADD KEY `order1` (`following_id`,`id`),
  ADD KEY `order2` (`follower_id`,`id`);

--
-- Indexes for table `gifts`
--
ALTER TABLE `gifts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `hot`
--
ALTER TABLE `hot`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `hot_userid` (`hot_userid`),
  ADD KEY `val` (`hot_userid`),
  ADD KEY `created_at` (`created_at`);

--
-- Indexes for table `langs`
--
ALTER TABLE `langs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `langs_english_index` (`english`),
  ADD KEY `ref` (`ref`(191)),
  ADD KEY `langs_lang_key_unique` (`lang_key`) USING BTREE;

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `like_userid` (`like_userid`),
  ADD KEY `is_like` (`is_like`),
  ADD KEY `is_dislike` (`is_dislike`),
  ADD KEY `created_at` (`created_at`);

--
-- Indexes for table `mediafiles`
--
ALTER TABLE `mediafiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `file` (`file`),
  ADD KEY `created_at` (`created_at`),
  ADD KEY `is_private` (`is_private`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `from` (`from`),
  ADD KEY `to` (`to`),
  ADD KEY `seen` (`seen`),
  ADD KEY `order1` (`from`,`id`),
  ADD KEY `order3` (`to`,`id`),
  ADD KEY `order7` (`seen`,`id`),
  ADD KEY `order8` (`id`),
  ADD KEY `created_at` (`created_at`),
  ADD KEY `messages_from_delete_index` (`from_delete`),
  ADD KEY `messages_to_delete_index` (`to_delete`);
ALTER TABLE `messages` ADD FULLTEXT KEY `text` (`text`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifier_id` (`notifier_id`),
  ADD KEY `recipient_id` (`recipient_id`),
  ADD KEY `type` (`type`),
  ADD KEY `push_sent` (`push_sent`),
  ADD KEY `created_at` (`created_at`),
  ADD KEY `seen` (`seen`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `options_option_name_unique` (`option_name`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `profilefields`
--
ALTER TABLE `profilefields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `registration_page` (`registration_page`),
  ADD KEY `active` (`active`),
  ADD KEY `profile_page` (`profile_page`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `report_userid` (`report_userid`),
  ADD KEY `created_at` (`created_at`),
  ADD KEY `seen` (`seen`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `session_id` (`session_id`(191)),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `platform` (`platform`),
  ADD KEY `time` (`time`);

--
-- Indexes for table `site_ads`
--
ALTER TABLE `site_ads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `placement` (`placement`);

--
-- Indexes for table `stickers`
--
ALTER TABLE `stickers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `file` (`file`);

--
-- Indexes for table `success_stories`
--
ALTER TABLE `success_stories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `story_user_id` (`story_user_id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `userfields`
--
ALTER TABLE `userfields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_first_name_index` (`first_name`),
  ADD KEY `users_web_token` (`web_token`) USING BTREE,
  ADD KEY `users_mobile_token` (`mobile_token`) USING BTREE,
  ADD KEY `users_hair_color` (`hair_color`) USING BTREE,
  ADD KEY `is_boosted` (`is_boosted`),
  ADD KEY `is_buy_stickers` (`is_buy_stickers`),
  ADD KEY `ethnicity` (`ethnicity`),
  ADD KEY `last_name` (`last_name`),
  ADD KEY `address` (`address`),
  ADD KEY `language` (`language`),
  ADD KEY `lat` (`lat`),
  ADD KEY `lng` (`lng`),
  ADD KEY `birthday` (`birthday`(191)),
  ADD KEY `lastseen` (`lastseen`),
  ADD KEY `start_up` (`start_up`),
  ADD KEY `height` (`height`),
  ADD KEY `location` (`location`),
  ADD KEY `relationship` (`relationship`),
  ADD KEY `work_status` (`work_status`),
  ADD KEY `education` (`education`),
  ADD KEY `education_2` (`education`),
  ADD KEY `body` (`body`),
  ADD KEY `character` (`character`),
  ADD KEY `children` (`children`),
  ADD KEY `friends` (`friends`),
  ADD KEY `pets` (`pets`),
  ADD KEY `live_with` (`live_with`),
  ADD KEY `religion` (`religion`),
  ADD KEY `smoke` (`smoke`),
  ADD KEY `drink` (`drink`),
  ADD KEY `online` (`online`),
  ADD KEY `xvisits_created_at` (`xvisits_created_at`),
  ADD KEY `show_me_to` (`show_me_to`),
  ADD KEY `verified` (`verified`),
  ADD KEY `xmatches_created_at` (`xmatches_created_at`),
  ADD KEY `smscode` (`smscode`),
  ADD KEY `password` (`password`),
  ADD KEY `gender` (`gender`),
  ADD KEY `email_code` (`email_code`),
  ADD KEY `type` (`type`),
  ADD KEY `country` (`country`),
  ADD KEY `balance` (`balance`),
  ADD KEY `active` (`active`),
  ADD KEY `status` (`status`),
  ADD KEY `admin` (`admin`),
  ADD KEY `location_2` (`location`),
  ADD KEY `relationship_2` (`relationship`),
  ADD KEY `work_status_2` (`work_status`),
  ADD KEY `education_3` (`education`),
  ADD KEY `body_2` (`body`),
  ADD KEY `character_2` (`character`,`children`,`friends`,`pets`,`live_with`,`car`,`religion`),
  ADD KEY `height_2` (`height`),
  ADD KEY `show_me_to_2` (`show_me_to`);

--
-- Indexes for table `user_chat_buy`
--
ALTER TABLE `user_chat_buy`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `chat_user_id` (`chat_user_id`),
  ADD KEY `created_at` (`created_at`);

--
-- Indexes for table `user_gifts`
--
ALTER TABLE `user_gifts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `from` (`from`),
  ADD KEY `to` (`to`),
  ADD KEY `gift_id` (`gift_id`);

--
-- Indexes for table `videocalles`
--
ALTER TABLE `videocalles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `to_id` (`to_id`),
  ADD KEY `from_id` (`from_id`),
  ADD KEY `called` (`called`),
  ADD KEY `declined` (`declined`);

--
-- Indexes for table `views`
--
ALTER TABLE `views`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `view_userid` (`view_userid`),
  ADD KEY `created_at` (`created_at`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `affiliates_requests`
--
ALTER TABLE `affiliates_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `announcement`
--
ALTER TABLE `announcement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `announcement_views`
--
ALTER TABLE `announcement_views`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `audiocalls`
--
ALTER TABLE `audiocalls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank_receipts`
--
ALTER TABLE `bank_receipts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `banned_ip`
--
ALTER TABLE `banned_ip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blocks`
--
ALTER TABLE `blocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_pages`
--
ALTER TABLE `custom_pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `emails`
--
ALTER TABLE `emails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `followers`
--
ALTER TABLE `followers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gifts`
--
ALTER TABLE `gifts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hot`
--
ALTER TABLE `hot`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `langs`
--
ALTER TABLE `langs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1446;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mediafiles`
--
ALTER TABLE `mediafiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `profilefields`
--
ALTER TABLE `profilefields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `site_ads`
--
ALTER TABLE `site_ads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `stickers`
--
ALTER TABLE `stickers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `success_stories`
--
ALTER TABLE `success_stories`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userfields`
--
ALTER TABLE `userfields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `user_chat_buy`
--
ALTER TABLE `user_chat_buy`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_gifts`
--
ALTER TABLE `user_gifts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `videocalles`
--
ALTER TABLE `videocalles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `views`
--
ALTER TABLE `views`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
