-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 20, 2025 at 10:18 AM
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
-- Database: `verrukkulluk`
--

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `image` varchar(500) NOT NULL,
  `price_cent` int(11) NOT NULL,
  `packaging` int(11) NOT NULL,
  `unit` varchar(50) NOT NULL,
  `calories_kcal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`id`, `name`, `description`, `image`, `price_cent`, `packaging`, `unit`, `calories_kcal`) VALUES
(1, 'Tarwebloem', 'Zorgvuldig geselecteerde tarwe van hoge kwaliteit. Bevat:Glutenbevattende Granen, Tarwe.', 'https://static.ah.nl/dam/product/AHI_43545239363630333030?revLabel=1&rendition=800x800_JPG_Q90&fileType=binary', 85, 1000, 'g', 3490),
(3, 'Dr. Oetker Baksoda', 'Baksoda wordt vooral gebruikt in amerikaanse en britse recepten en is een populair rijsmiddel. In Nederland gebruiken we vooral bakpoeder, maar wil je authentieke recepten maken? zorg dan dat je ook een voorraad baking soda in huis hebt. Dit handige bakingredient heeft een karakteristieke smaak en is onmisbaar voor een red velvet cake of knapperige chocolate chip cookies. Wil je meer weten over de toepassingen van dit veelzijdige product? kijk dan op www.oetker.nl voor baktips en variatierecepten en maak verschillende lekkere traktaties met dit handige ingredient.', 'https://static.ah.nl/dam/product/AHI_4354523130303339383835?revLabel=1&rendition=800x800_JPG_Q90&fileType=binary', 99, 25, 'g', 0),
(4, 'Witte vrije uitloopeieren M', 'Beter leven keurmerk 2 Sterren.\r\n\r\nBij het vrije-uitloopei krijgt het welzijn van de kip extra aandacht. Deze eieren worden gelegd door kippen die dagelijks de mogelijkheid krijgen om in de buitenlucht rond te scharrelen. Tevens hebben ze een overdekte uitloop tot hun beschikking.\r\n\r\nIn geval van ophokplicht wegens vogelgriep hebben de leghennen, ter bescherming van hun eigen gezondheid, geen toegang tot de vrije uitloop.', 'https://static.ah.nl/dam/product/AHI_43545239363430323834?revLabel=1&rendition=800x800_JPG_Q90&fileType=binary', 179, 6, 'st', 460),
(5, 'Karnemelk', 'Samen met meer dan 450 vaste melkveehouders maken wij onze Nederlandse zuivel steeds duurzamer. Dat is niet alleen lekker, maar ook beter voor koe, natuur en boer. Zo krijgt de koe meer ruimte, zorgt een gevarieerd kruidengrasland voor meer biodiversiteit en betalen wij onze boeren een extra vergoeding.\r\n\r\nDeze Albert Heijn zuivel is voor 100% afkomstig van koeien die minimaal 120 dagen per jaar, 6 uur per dag in de wei lopen. De weidegang geeft koeien meer bewegingsruimte en in de wei hebben de koeien ruimte voor hun natuurlijke graasgedrag. Zo kunt u blijven genieten van het karakteristieke landschap met koeien in de wei.', 'https://static.ah.nl/dam/product/AHI_4354523130313033383233?revLabel=1&rendition=800x800_JPG_Q90&fileType=binary', 119, 1000, 'ml', 280),
(6, 'Roomijs vanille', 'Vanilleslagroomijs.\r\n\r\nIngrediënten: magere melk, 24% slagroom, suiker, water, glucose-fructosestroop, vegetarisch wei-eiwitconcentraat, emulgator (mono- en diglyceriden van vetzuren [E471]), kleurend wortelconcentraat, stabilisator (johannesbroodpitmeel [E410], guarpitmeel [E412]), Bourbonvanille-extract, 0,04% gemalen vanillestokje.\r\nWaarvan toegevoegde suikers 17g per 100 gram en waarvan toegevoegd zout 0.00g per 100 gram.\r\n\r\nBevat:Melk, Lactose.\r\nKan bevatten: Noten, Amandel, Cashewnoot, Hazelnoot, Macadamianoot, Pecannoot, Paranoot, Pistachenoot, Walnoot.', 'https://static.ah.nl/dam/product/AHI_43545239383938353237?revLabel=1&rendition=800x800_JPG_Q90&fileType=binary', 279, 1000, 'ml', 926),
(7, 'Lonka Fudge caramel', 'Heerlijke zachte en romige fudge caramel. Een zachte lekkernij speciaal voor bij jouw genietmomentje of om te delen met anderen. Heerlijk bij de koffie of thee!', 'https://static.ah.nl/dam/product/AHI_43545239393135383533?revLabel=1&rendition=800x800_JPG_Q90&fileType=binary', 249, 220, 'g', 1023),
(8, 'Dr. Oetker Gist levure', 'Gist van Dr. Oetker is het ideale bakingredient voor allerlei zoet en hartig gebak. Gist zorgt voor een luchtig en licht deeg. Het geeft de speciale smaak aan bijv. Brood, oliebollen en vlaaibodems.', 'https://static.ah.nl/dam/product/AHI_43545239353638373732?revLabel=2&rendition=800x800_JPG_Q90&fileType=binary', 89, 21, 'g', 0),
(9, 'Bloemenhoning', NULL, 'https://static.ah.nl/dam/product/AHI_4354523130303638383831?revLabel=1&rendition=800x800_JPG_Q90&fileType=binary', 269, 450, 'g', 1467),
(10, 'Mutti Pizzasaus aromatica', 'Buongiorno! Wist je dat de tomaten van Mutti groeien in de Italiaanse zon. Na oogst worden ze binnen 24u worden verwerkt. Zo blijft de pure smaak van zongerijpte tomaten behouden.\r\n\r\nDe pizzasaus van Mutti is ideaal om jouw eigen traditionele Italiaanse pizza te maken. De saus is op basis van verse Italiaanse tomaten in combinatie met oregano en basilicum. Dé kenmerkende smaak voor een echte Italiaanse pizza.\r\n\r\nSinds 1899 maakt het familiebedrijf Mutti in Parma al tomaten in blik, tomatenpassata en tomatenpuree. Inmiddels werkt de derde generatie Mutti in het bedrijf, onder leiding van Francesco Mutti. Op dit moment is Mutti de nummer 1 in Italië en werken ze samen met maar liefst 400 tomatenboeren.', 'https://static.ah.nl/dam/product/AHI_43545239373130383037?revLabel=1&rendition=800x800_JPG_Q90&fileType=binary', 239, 388, 'ml', 144),
(11, 'Parmigiano reggiano', 'Deze typisch Italiaanse kaas, ook wel bekend onder de naam Parmezaanse kaas, wordt geroemd om haar karaktervolle smaak en korrelige structuur. Een harde kaas van koemelk met een kruidige en pikante smaak door het zouten en de minimale rijping van maar liefst 22 maanden. De finishing touch van je pastamaaltijd en vele andere gerechten.', 'https://static.ah.nl/dam/product/AHI_434d50323331313638?revLabel=3&rendition=800x800_JPG_Q90&fileType=binary', 544, 165, 'g', 663),
(12, 'Mozzarella', 'Mozzarella is een ideale kaas om altijd in huis te hebben, veelzijdig in gebruik bij maaltijden, salades en als tussendoortje.', 'https://static.ah.nl/dam/product/AHI_43545239373439353038?revLabel=1&rendition=800x800_JPG_Q90&fileType=binary', 99, 200, 'g', 496),
(13, 'Ricotta', 'Deze ricotta is een verse Italiaanse kaassoort, die luchtig van structuur is en fris en mild van smaak. Dit maakt ricotta tot een ideaal ingrediënt voor de bereiding van talloze recepten.', 'https://static.ah.nl/dam/product/AHI_43545239373537333239?revLabel=1&rendition=800x800_JPG_Q90&fileType=binary', 299, 250, 'g', 358),
(14, 'Igor Gorgonzola cremoso 50+', 'Gorgonzola dolce is blauwschimmelkaas uit het noorden van italie met een delicate smaak. Deze gorgonzola is jong en super romig. Een heerlijke kaas voor op een toastje of om te smelten over pizza!', 'https://static.ah.nl/dam/product/AHI_43545239393933353039?revLabel=1&rendition=800x800_JPG_Q90&fileType=binary', 449, 200, 'g', 650),
(15, 'Tijm', 'Tijm heeft een echte mediterrane smaak: Iets scherp, met bitter en zoete tonen. Heerlijk om toe te voegen aan soepen en sauzen. En is zeer goed te combineren met tomaat, komkommer, aubergine en paprika.', 'https://static.ah.nl/dam/product/AHI_4354523130303737343830?revLabel=1&rendition=800x800_JPG_Q90&fileType=binary', 119, 15, 'g', 16),
(16, 'Duvel 6,66', 'Duvel 6,66% is een Duvelse verrassing. Fris Belgisch blond bier, vol van smaak en een eigen smoel. En 6,66%? Dat verwijst naar het alcoholpercentage. Lichter dan de originele Duvel, maar nog steeds met die typische Duvel punch.', 'https://static.ah.nl/dam/product/AHI_4354523130303336353636?revLabel=1&rendition=800x800_JPG_Q90&fileType=binary', 199, 330, 'ml', 211),
(17, 'Keukenzout met jodium', NULL, 'https://static.ah.nl/dam/product/AHI_43545239363436353635?revLabel=3&rendition=800x800_JPG_Q90&fileType=binary', 65, 1000, 'g', 0),
(18, 'Kaiserbroodjes', 'Altijd warme kaiserbroodjes in huis. Alleen even afbakken in eigen oven en naar smaak beleggen.', 'https://static.ah.nl/dam/product/AHI_4354523130303637393430?revLabel=1&rendition=800x800_JPG_Q90&fileType=binary', 59, 4, 'st', 526),
(19, 'Flinterdunne gegrilde beenham', 'Deze beenham is flinterdun gesneden en heeft daardoor een heerlijk zachte en verfijnde bite. Met deze flinterdunne gekrulde plakjes kun je iedere boterham verrijken.', 'https://static.ah.nl/dam/product/AHI_43545239393331333336?revLabel=1&rendition=800x800_JPG_Q90&fileType=binary', 299, 100, 'g', 99),
(20, 'Bieslook', 'Bieslook met een frisse, milde uiensmaak voor salades en dressings en de ideale smaakmaker bij vlees- of visgerechten, in sauzen en als garnering.\r\n\r\n', 'https://static.ah.nl/dam/product/AHI_4354523130303737343732?revLabel=1&rendition=800x800_JPG_Q90&fileType=binary', 125, 25, 'g', 16),
(21, 'Vers bladerdeeg', 'Bevat:Glutenbevattende Granen, Tarwe.\r\nKan bevatten:Melk, Lactose.', 'https://static.ah.nl/dam/product/AHI_43545239393231363532?revLabel=1&rendition=800x800_JPG_Q90&fileType=binary', 149, 270, 'g', 1110),
(22, 'De Zaanse Hoeve Goudse jong 48+ plakken voordeel', 'Jonge kaas 48+ gemaakt van 100% weidemelk voor op de boterham of gewoon uit het vuistje.', 'https://static.ah.nl/dam/product/AHI_4354523130303536333032?revLabel=1&rendition=800x800_JPG_Q90&fileType=binary', 455, 12, 'st', 1412),
(23, 'Groene pesto', 'Pesto is een heerlijke Italiaanse smaakmaker die gebruikt kan worden door de pasta, door de salade, op een broodje, of wat jij maar lekker vindt!', 'https://static.ah.nl/dam/product/AHI_4354523130303634383335?revLabel=1&rendition=800x800_JPG_Q90&fileType=binary', 115, 190, 'g', 694),
(24, 'Cherrytomaten', 'De zoete en sappige cherrytomaten zijn heerlijk door een verse salade of gewoon als gezonde snack.', 'https://static.ah.nl/dam/product/AHI_4354523130303637303134?revLabel=1&rendition=800x800_JPG_Q90&fileType=binary', 125, 15, 'st', 78);

-- --------------------------------------------------------

--
-- Table structure for table `dish`
--

CREATE TABLE `dish` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `kitchen_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `description_short` varchar(500) NOT NULL,
  `description_long` varchar(1000) NOT NULL,
  `image` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dish`
--

INSERT INTO `dish` (`id`, `name`, `kitchen_id`, `type_id`, `user_id`, `date`, `description_short`, `description_long`, `image`) VALUES
(1, 'Fudgewafels met vanille-ijs', 1, 2, 3, '2024-12-11', 'Heerlijke variatie op een Limburgse klassieker.', 'Dit is een variatie op een heerlijke Limburgse klassieker waarvan je blijft smullen. In plaats van warme kersen en slagroom voegen we deze keer fudge en vanille-ijs toe aan lekkere vers gebakken wafels.', 'https://static.ah.nl/static/recepten/img_097765_1224x900_JPG.jpg'),
(2, 'BBQ-pizza ai quattro formaggi van bierdeeg', 3, 4, 2, '2024-12-27', 'Bier: het geheim van een krokante pizzabodem.', 'Een smaakvolle pizza met krokante bodem en de klassieke smaakcombinatie van kaas en tomaat.', 'https://static.ah.nl/static/recepten/img_RAM_PRD147605_1224x900_JPG.jpg'),
(3, 'Kaiserbroodjes gevuld met ei en ham', 5, 6, 1, '2024-12-16', 'Je kunt broodjes beleggen, maar je kunt ze ook vullen met ham en ei. Extra lekker!', 'Uitgeholde kaiserbroodjes gevuld met ei en ham. Lekker als ontbijt voor een speciale gelegenheid, maar ook gewoon zomaar natuurlijk!', 'https://static.ah.nl/static/recepten/img_118618_1224x900_JPG.jpg'),
(4, 'Kaas-pesto kerstboompjes', 5, 7, 4, '2024-12-24', 'Kaas en pesto zijn altijd een goed idee. En dus ook voor Kerst. Zeker in van die vrolijke kerstboomvormpjes.', '', 'https://static.ah.nl/static/recepten/img_RAM_PRD171861_1224x900_JPG.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `dish_info`
--

CREATE TABLE `dish_info` (
  `id` int(11) NOT NULL,
  `record_type` char(1) NOT NULL,
  `dish_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `numerical_field` int(11) DEFAULT NULL,
  `text_field` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dish_info`
--

INSERT INTO `dish_info` (`id`, `record_type`, `dish_id`, `user_id`, `date`, `numerical_field`, `text_field`) VALUES
(1, 'O', 1, 2, '2024-12-27', NULL, 'Cowabunga!'),
(2, 'B', 1, NULL, NULL, 1, 'Meng de bloem en baksoda in een kom.'),
(3, 'B', 1, NULL, NULL, 2, 'Voeg het ei en de karnemelk toe en mix met een handmixer tot een glad beslag.'),
(4, 'B', 1, NULL, NULL, 3, 'Snijd de fudge in blokjes, voeg toe en meng goed door elkaar.'),
(5, 'B', 1, NULL, NULL, 4, 'Verwarm het wafelijzer en schenk een flinke eetlepel beslag in de vorm. Bak de wafels ca. 2 minuten tot ze goudbruin zijn. Herhaal tot het beslag op is.'),
(6, 'B', 1, NULL, NULL, 5, 'Serveer de wafels met een bol vanille-ijs. Ook lekker met extra karamel- of fudgesaus.'),
(7, 'B', 2, NULL, NULL, 1, 'Verwarm het bier in een steelpan tot lauwwarm. Meng de bloem in een kom met de gist. Schenk het bier erbij en kneed met de mixer met deeghaken. Voeg de honing en het zout toe en kneed verder tot een stevig deeg. Maak er een bal van, bestuif licht met bloem en leg terug in de kom. Dek af met vershoudfolie en laat 2 uur rijzen.'),
(8, 'B', 2, NULL, NULL, 2, 'Kneed het deeg nogmaals door. Verdeel in 4 bolletjes en dek af met een schone theedoek. Laat nog 30 min. rijzen.'),
(9, 'B', 2, NULL, NULL, 3, 'Steek ondertussen de barbecue aan. Verhit tot 250-300 °C. Leg de pizzasteen op het rooster, zodat die ook goed heet wordt.'),
(10, 'B', 2, NULL, NULL, 4, 'Rol een bolletje deeg zo dun mogelijk uit tot een lap van Ø 22 cm. Bestrijk met ¼ van de pizzasaus. Rasp ¼ van de Parmezaanse kaas erboven. Scheur de mozzarella in stukjes en verdeel ¼ samen met ¼ van de ricotta en ¼ van de gorgonzola over de pizza. Ris de blaadjes van de takjes tijm en strooi ¼ erover.'),
(11, 'B', 2, NULL, NULL, 5, 'Leg de pizza met behulp van de pizzaschep of springvormbodem op de hete pizzasteen. Doe de deksel op de barbecue en bak de pizza in 8 min. knapperig. Doe de deksel op de barbecue en bak de pizza in 8 min. knapperig. Snijd in 8 punten en serveer. Maak zo nog 3 pizza’s.'),
(12, 'O', 2, 1, NULL, NULL, 'Righteous!'),
(13, 'O', 2, 2, NULL, NULL, 'Acca pella!'),
(14, 'O', 2, 3, NULL, NULL, 'Cowabunga!'),
(15, 'O', 2, 4, NULL, NULL, 'Radical!'),
(16, 'B', 3, NULL, NULL, 1, 'Verwarm de oven voor op 160 °C. Snijd van de bovenkant van de broodjes een cirkel van ca. 8 cm af. Hol de broodjes vanbinnen zo veel mogelijk uit. De kapjes en de inhoud worden niet meer gebruikt.'),
(17, 'B', 3, NULL, NULL, 2, 'Bekleed de binnenkant van de broodjes met de ham. Zet de broodjes op de bakplaat. Breek in elk broodje een ei. Zet de broodjes ca. 25 min. onder in de oven. Het eiwit is nu gestold, het eigeel nog niet.'),
(18, 'B', 3, NULL, NULL, 3, 'Knip ondertussen de bieslook fijn. Bestrooi de broodjes met de bieslook.'),
(19, 'B', 4, NULL, NULL, 1, 'Zorg ervoor dat de satéprikkers 30 min. zijn geweekt in water. Verwarm de oven voor op 180 °C. Rol het bladerdeeg uit en leg het bakpapier op een bakplaat.'),
(20, 'B', 4, NULL, NULL, 2, 'Halveer het deeg in de breedte. Beleg 1 helft met de kaas en dek af met de andere helft bladerdeeg. Snijd het gestapelde deeg in de lengte in 8 repen (per 8 stuks).'),
(21, 'B', 4, NULL, NULL, 3, 'Vouw de repen, al zigzaggend en van onder naar boven in steeds smallere slagen, tot kerstboompjes en leg ze op het bakpapier.'),
(22, 'B', 4, NULL, NULL, 4, 'Steek in elk boompje van onder naar boven een satéprikker en laat deze 1 cm uitsteken.'),
(23, 'B', 4, NULL, NULL, 5, 'Bak in het midden van de oven in ca. 20 min. gaar. Neem uit de oven. Besmeer de boompjes met de pesto en bak nog ca. 2 min. Steek cherrytomaten als piek boven op de prikkers en serveer.'),
(24, 'O', 3, 1, NULL, NULL, 'Shell shocked!'),
(25, 'O', 3, 3, NULL, NULL, 'Booyakasha!'),
(27, 'O', 1, 4, NULL, NULL, 'Every turtle for himself!');

-- --------------------------------------------------------

--
-- Table structure for table `groceries`
--

CREATE TABLE `groceries` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `groceries`
--

INSERT INTO `groceries` (`id`, `user_id`, `article_id`, `amount`, `quantity`) VALUES
(1, 2, 16, 3, 825),
(2, 2, 1, 2, 1500),
(3, 2, 8, 1, 20),
(4, 2, 9, 1, 50),
(5, 2, 17, 1, 10),
(6, 2, 10, 3, 975),
(7, 2, 11, 4, 500),
(8, 2, 12, 4, 625),
(9, 2, 13, 2, 500),
(10, 2, 14, 3, 500),
(11, 2, 15, 2, 25);

-- --------------------------------------------------------

--
-- Table structure for table `ingredient`
--

CREATE TABLE `ingredient` (
  `id` int(11) NOT NULL,
  `dish_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ingredient`
--

INSERT INTO `ingredient` (`id`, `dish_id`, `article_id`, `quantity`) VALUES
(1, 1, 1, 150),
(2, 1, 3, 5),
(3, 1, 4, 1),
(4, 1, 5, 130),
(5, 1, 7, 50),
(6, 1, 6, 100),
(7, 2, 16, 165),
(8, 2, 1, 300),
(9, 2, 8, 4),
(10, 2, 9, 10),
(11, 2, 17, 2),
(12, 2, 10, 195),
(13, 2, 11, 100),
(14, 2, 12, 125),
(15, 2, 13, 100),
(16, 2, 14, 100),
(17, 2, 15, 5),
(18, 3, 18, 4),
(19, 3, 19, 100),
(20, 3, 4, 4),
(21, 3, 20, 13),
(22, 4, 21, 270),
(23, 4, 22, 2),
(24, 4, 23, 40),
(25, 4, 24, 8);

-- --------------------------------------------------------

--
-- Table structure for table `kitchentype`
--

CREATE TABLE `kitchentype` (
  `id` int(11) NOT NULL,
  `description` varchar(50) NOT NULL,
  `record_type` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kitchentype`
--

INSERT INTO `kitchentype` (`id`, `description`, `record_type`) VALUES
(1, 'Limburgs', 'K'),
(2, 'Dessert', 'T'),
(3, 'Italiaans', 'K'),
(4, 'Vegetarisch', 'T'),
(5, 'Nederlands', 'K'),
(6, 'Vlees', 'T'),
(7, 'Borrel', 'T');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `image` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `password`, `email`, `image`) VALUES
(1, 'Leonardo', 'Kat@na', 'leo@turtlemail.com', 'https://i.ebayimg.com/images/g/WOwAAOSw49BeipW~/s-l1600.webp'),
(2, 'Donatello', 'b0stick', 'donnie@@turtlemail.com', 'https://i.ebayimg.com/images/g/LIcAAOSwc99eipWl/s-l1600.webp'),
(3, 'Michelangelo', 'nunchuck$', 'mikey@turtlemail.com', 'https://i.ebayimg.com/images/g/RU4AAOSwsWleipYw/s-l1600.webp'),
(4, 'Raphael', 's4isw0rds', 'raph@turtlemail.com', 'https://i.ebayimg.com/images/g/qG8AAOSwieleipZy/s-l1600.webp');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dish`
--
ALTER TABLE `dish`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `kitchen_id` (`kitchen_id`),
  ADD KEY `type_id` (`type_id`);

--
-- Indexes for table `dish_info`
--
ALTER TABLE `dish_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dish_id` (`dish_id`);

--
-- Indexes for table `groceries`
--
ALTER TABLE `groceries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `article_id` (`article_id`);

--
-- Indexes for table `ingredient`
--
ALTER TABLE `ingredient`
  ADD PRIMARY KEY (`id`),
  ADD KEY `article_id` (`article_id`),
  ADD KEY `dish_id` (`dish_id`);

--
-- Indexes for table `kitchentype`
--
ALTER TABLE `kitchentype`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `dish`
--
ALTER TABLE `dish`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `dish_info`
--
ALTER TABLE `dish_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `groceries`
--
ALTER TABLE `groceries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `ingredient`
--
ALTER TABLE `ingredient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `kitchentype`
--
ALTER TABLE `kitchentype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dish`
--
ALTER TABLE `dish`
  ADD CONSTRAINT `dish_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `dish_ibfk_2` FOREIGN KEY (`kitchen_id`) REFERENCES `kitchentype` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `dish_ibfk_3` FOREIGN KEY (`type_id`) REFERENCES `kitchentype` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `dish_info`
--
ALTER TABLE `dish_info`
  ADD CONSTRAINT `dish_info_ibfk_1` FOREIGN KEY (`dish_id`) REFERENCES `dish` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `groceries`
--
ALTER TABLE `groceries`
  ADD CONSTRAINT `groceries_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `groceries_ibfk_2` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `ingredient`
--
ALTER TABLE `ingredient`
  ADD CONSTRAINT `ingredient_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ingredient_ibfk_2` FOREIGN KEY (`dish_id`) REFERENCES `dish` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
