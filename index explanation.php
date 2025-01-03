<?php

// Specify which files can be accessed:
require_once("lib/database.php");
require_once("lib/article.php");
require_once("lib/selectUser.php");
require_once("lib/selectKitchenType.php");
require_once("lib/selectIngredient.php");


/// INIT

// Create a new instance of the class "database" by running database.php, where only the construct function is run (so the function getConnection does not yet run at this point; essentially, a dormant, non-functional connection is created here). The new instance of the "database" class is a property we call "db":
$db = new database();

// By creating a new object from the article class, its construct function is run. $db->getConnection() is run and its result is given as the parameter value for the article class's construct function. $db->getConnection() tells the program to run the getConnection function in database.php. This activates the dormant connection between article.php and the database, making the connection functional. The result of this function, i.e. the connection, is transmitted as a parameter value of the construct function in article.php.
$art = new article($db->getConnection());

$user = new user($db->getConnection());
$kt = new kitchenType($db->getConnection());
$ingr = new ingredient($db->getConnection());


/// VERWERK 

// The following code calls upon the selectArticle function of article.php within the newly created instance of "article", and sends a parameter value along with it between the brackets:
$dataArt = $art->selectArticle(1);

$dataUser = $user->selectUser(1);
$dataKT = $kt->selectKitchenType(1);
$dataIngr = $ingr->selectIngredient(1);


/// RETURN
// Test results:
echo "Article data: ";
var_dump($dataArt);
echo "<br><br>";

echo "User data: ";
var_dump($dataUser);
echo "<br><br>";

echo "Kitchen Type data: ";
var_dump($dataKT);
echo "<br><br>";

echo "Ingredient data: ";
var_dump($dataIngr);