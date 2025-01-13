<?php

require_once("lib/database.php");
require_once("lib/article.php");
require_once("lib/selectUser.php");
require_once("lib/selectKitchenType.php");
require_once("lib/selectIngredient.php");
require_once("lib/selectInfo.php");
require_once("lib/selectDish.php");
// require_once("lib/groceryList.php");
require_once("lib/groceryListUserFriendly.php");


/// INIT
$db = new database();
// $art = new article($db->getConnection());
// $user = new user($db->getConnection());
// $kt = new kitchenType($db->getConnection());
// $ingr = new ingredient($db->getConnection());
// $info = new dishInfo($db->getConnection());
$dish = new dish($db->getConnection());
$groce = new groceryList($db->getConnection());


/// VERWERK 
// $dataArt = $art->selectArticle(1);
// $dataUser = $user->selectUser(1);
// $dataKT = $kt->selectKitchenType(1);
// $dataIngr = $ingr->selectIngredient(1);
// $dataInfo = $info->selectInfo(1, 'O');
// $addFavorite = $info->addFavorite(1,1);
// $deleteFavorite = $info->deleteFavorite(1,1);
// $dataDish = $dish->selectDish();
$dataGroce = $groce->addArticle(2,2);
// $dataGroce = $groce->articleOnList(24,1);
// $dataGroce = $groce->selectGrocery(1);
// $dataGroce = $groce->selectQuantityFromGroceries(1,1);


/// RETURN
// echo "<pre>";
// echo "Article data: ";
// var_dump($dataArt);

// echo "<pre>";
// echo "User data: ";
// var_dump($dataUser);

// echo "<pre>";
// echo "Kitchen Type data: ";
// var_dump($dataKT);

// echo "<pre>";
// echo "Ingredient data: ";
// var_dump($dataIngr);

// echo "<pre>";
// echo "Dish info: ";
// var_dump($dataInfo);

// echo "<pre>";
// echo "Dish info: ";
// var_dump($dataDish);

echo "<pre>";
echo "Dish info: ";
var_dump($dataGroce);