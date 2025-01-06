<?php

require_once("lib/database.php");
require_once("lib/article.php");
require_once("lib/selectUser.php");
require_once("lib/selectKitchenType.php");
require_once("lib/selectIngredient.php");
require_once("lib/selectInfo.php");

/// INIT
$db = new database();
$art = new article($db->getConnection());
$user = new user($db->getConnection());
$kt = new kitchenType($db->getConnection());
$ingr = new ingredient($db->getConnection());
$info = new dishInfo($db->getConnection());


/// VERWERK 
$dataArt = $art->selectArticle(1);
$dataUser = $user->selectUser(1);
$dataKT = $kt->selectKitchenType(1);
$dataIngr = $ingr->selectIngredient(1);
$dataInfo = $info->selectInfo(1, 'O');


/// RETURN
echo "<pre>";
echo "Article data: ";
var_dump($dataArt);
echo "<pre>";

echo "<pre>";
echo "User data: ";
var_dump($dataUser);

echo "<pre>";
echo "Kitchen Type data: ";
var_dump($dataKT);

echo "<pre>";
echo "Ingredient data: ";
var_dump($dataIngr);

echo "<pre>";
echo "Dish info: ";
var_dump($dataInfo);