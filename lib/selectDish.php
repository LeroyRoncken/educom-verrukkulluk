<?php

class dish{

    private $connection;
    private $user;
    private $ingredient;
    private $article;
    private $info;
    private $kitchenType;

    public function __construct($constructConnection) {
        $this->connection = $constructConnection;
        $this->user = new user($constructConnection);
        $this->ingredient = new ingredient($constructConnection);
        $this->article = new article($constructConnection);
        $this->info = new dishInfo($constructConnection);
        $this->kitchenType = new kitchenType($constructConnection);
    }
    

    public function selectDish($id) {
        $sql = "SELECT * FROM dish WHERE id = $id";
        $result = mysqli_query($this->connection, $sql);
        $output = mysqli_fetch_array($result, MYSQLI_ASSOC);
        
        $user = $this->selectUser($output["user_id"]);
        $ingredients = $this->selectIngredient($id);
        $calories = $this->calcCalories($ingredients);
        $price = $this->calcPrice($ingredients);
        $rating = $this->selectRecordType($id, 'R');
        $steps = $this->selectRecordType($id, 'S');
        $comments = $this->selectRecordType($id, 'C');
        $kitchen = $this->selectKitchenOrType($output["kitchen_id"]);
        $type = $this->selectKitchenOrType($output["type_id"]);
        $favorite = $this->selectRecordType($id, 'F');

        $dish_array[] = [
            "Dish" => $output,
            "User" => $user,
            "Ingredients" => $ingredients,
            "Calories" => $calories,
            "Price" => $price,
            "Rating" => $rating,
            "Steps" => $steps,
            "Comments" => $comments,
            "Kitchen" => $kitchen,
            "Type" => $type,
            "Favorite" => $favorite
        ];
                
        return($dish_array);
    }


    private function selectUser($user_id) {
        return($this->user->selectUser($user_id));
    }

    private function selectIngredient($dish_id) {
        return($this->ingredient->selectIngredient($dish_id));
    }


    // Calculations

    public function calcCalories($ingredients) {
        $totalCalories = 0;
        foreach ($ingredients as $ingr) {
            $article = $this->selectArticle($ingr["article_id"]);
            
            $totalCalories += $article["calories_kcal"] * $ingr["quantity"] / $article["packaging"];
        }
        return($totalCalories);
    }

    public function calcPrice($ingredients) {
        $totalPrice = 0;
        foreach ($ingredients as $ingr) {
            $article = $this->selectArticle($ingr["article_id"]);
            
            $required_pack = ceil( $ingr["quantity"] / $article["packaging"] );
            $totalPrice += $required_pack * $article["price_cent"];
        }
        return($totalPrice);
    }

    private function selectArticle($article_id) {
        return($this->article->selectArticle($article_id));
    }


    // Select a specific record type

    public function selectRecordType($dish_id, $record_type) {
        $info = $this->selectInfo($dish_id, $record_type);
        foreach ($info as $key => $value) {
            if ($value["record_type"] !== $record_type) {
                unset($info[$key]);
            }
        }
        return($info);
    }

    private function selectInfo($dish_id, $record_type) {
        return($this->info->selectInfo($dish_id, $record_type));
    }

    public function selectKitchenOrType($kitchentype_id) {
        return($this->selectKitchenType($kitchentype_id));
    }

    private function selectKitchenType($kitchentype_id) {
        return($this->kitchenType->selectKitchenType($kitchentype_id));
    }

}