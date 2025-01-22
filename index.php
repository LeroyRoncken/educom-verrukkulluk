<?php
//// Allereerst zorgen dat de "Autoloader" uit vendor opgenomen wordt:
require_once("./vendor/autoload.php");

/// Twig koppelen:
$loader = new \Twig\Loader\FilesystemLoader("./templates");
/// VOOR PRODUCTIE:
/// $twig = new \Twig\Environment($loader), ["cache" => "./cache/cc"]);

/// VOOR DEVELOPMENT:
$twig = new \Twig\Environment($loader, ["debug" => true ]);
$twig->addExtension(new \Twig\Extension\DebugExtension());

/******************************/

/// Next step, iets met je data doen. Ophalen of zo
require_once("lib/database.php");
require_once("lib/article.php");
require_once("lib/selectUser.php");
require_once("lib/selectKitchenType.php");
require_once("lib/selectIngredient.php");
require_once("lib/selectInfo.php");
require_once("lib/selectDish.php");
require_once("lib/groceryListUserFriendly.php");

$db = new database();
$dish = new dish($db->getConnection());
// $art = new article($db->getConnection());
// $user = new user($db->getConnection());
// $kt = new kitchenType($db->getConnection());
// $ingr = new ingredient($db->getConnection());
// $info = new dishInfo($db->getConnection());
// $groce = new groceryList($db->getConnection());

/*
URL:
http://localhost/educom-verrukkulluk/index.php?dish_id=4&action=detail
*/

$dish_id = isset($_GET["dish_id"]) ? $_GET["dish_id"] : "";
$action = isset($_GET["action"]) ? $_GET["action"] : "homepage";

switch($action) {

    case "homepage": {
        $data = $dish->selectDish();
        $template = 'homepage.html.twig';
        $title = "homepage";
        break;
    }

    case "detail": {
        $data = $dish->selectDish($dish_id);
        $template = 'detail.html.twig';
        $title = "detail page";
        break;
    }

    /// etc

}

/// Onderstaande code schrijf je idealiter in een layout klasse of iets dergelijks
/// Juiste template laden, in dit geval "homepage"
$template = $twig->load($template);


/// En tonen die handel!
echo $template->render(["title" => $title, "data" => $data]);
