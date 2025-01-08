<?php

class dish{

    private $connection;
    private $user;
    private $ingredient;
    private $article;

    public function __construct($constructConnection) {
        $this->connection = $constructConnection;
        $this->user = new user($constructConnection);
        $this->ingredient = new ingredient($constructConnection);
        $this->article = new article($constructConnection);
    }

    public function selectDish($id) {
        $sql = "SELECT * FROM dish WHERE id = $id";
        $result = mysqli_query($this->connection, $sql);
        $output = mysqli_fetch_array($result, MYSQLI_ASSOC);
        
        $user = $this->selectUser($output["user_id"]);
        $output["User"] = $user;

        $ingredients = $this->selectIngredient($id);
        $output["Ingredients"] = $ingredients;

        $calories = $this->calcCalories($ingredients);
        $output["Calories"] = $calories;

        $price = $this->calcPrice($ingredients);
        $output["Price"] = $price;
        
        return($output);
    }

    private function selectUser($user_id) {
        return($this->user->selectUser($user_id));
    }

    private function selectIngredient($dish_id) {
        return($this->ingredient->selectIngredient($dish_id));
    }

    public function calcCalories($ingredients) {
        $totalCalories = 0;
        foreach ($ingredients as $ingr) {
            $article_id = $ingr["article_id"];
            $article = $this->article->selectArticle($article_id);

            $totalCalories += $article["calories_kcal"] * $ingr["quantity"] / $article["packaging"];
        }
        return($totalCalories);
    }

    public function calcPrice($ingredients) {
        $totalPrice = 0;
        foreach ($ingredients as $ingr) {
            $article_id = $ingr["article_id"];
            $article = $this->article->selectArticle($article_id);

            $required_pack = ceil( $ingr["quantity"] / $article["packaging"] );
            $totalPrice += $required_pack * $article["price_cent"];
        }
        return($totalPrice);
    }

}