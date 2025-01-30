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
    

    public function selectDish($id = NULL) {
        
        $dish_array = [];

        $sql = "SELECT * FROM dish";
        if ($id) {
            $sql .= " WHERE id = $id";
        }

        $result = mysqli_query($this->connection, $sql);
        
        while ($output = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
        
            $user = $this->selectUser($output["user_id"]);
            $ingredients = $this->selectIngredient($output["id"]);
            $calories = $this->calcCalories($ingredients);
            $price = $this->calcPrice($ingredients);
            $ratingAverage = $this->selectRatingAverage($output["id"]);
            $rating = $this->selectRecordType($output["id"], 'R');
            $steps = $this->selectRecordType($output["id"], 'S');
            $comments = $this->selectRecordType($output["id"], 'C');
            $kitchen = $this->selectKitchenType($output["kitchen_id"]);
            $type = $this->selectKitchenType($output["type_id"]);
            $favorite = $this->selectRecordType($output["id"], 'F');

            $dish_array[] = [
                "dish" => $output,
                "user" => $user,
                "ingredients" => $ingredients,
                "calories" => $calories, // (kcal)
                "price" => $price, // (cents)
                "ratingAverage"=> $ratingAverage,
                "rating" => $rating,
                "steps" => $steps,
                "comments" => $comments,
                "kitchen" => $kitchen,
                "type" => $type,
                "favorite" => $favorite
            ];
        }

        return($dish_array);
    }


    // External functions

    private function selectUser($user_id) {
        return($this->user->selectUser($user_id));
    }

    private function selectIngredient($dish_id) {
        return($this->ingredient->selectIngredient($dish_id));
    }

    private function selectArticle($article_id) {
        return($this->article->selectArticle($article_id));
    }

    private function selectInfo($dish_id, $record_type) {
        return($this->info->selectInfo($dish_id, $record_type));
    }

    private function selectRatingAverage($dish_id) {
        return($this->info->selectRatingAverage($dish_id));
    }

    private function selectKitchenType($kitchentype_id) {
        return($this->kitchenType->selectKitchenType($kitchentype_id));
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
            
            $required_pack = $this->requiredPackages($ingr);
            // $required_pack = ceil( $ingr["quantity"] / $article["packaging"] );
            $totalPrice += $required_pack * $article["price_cent"];
        }
        return($totalPrice);
    }

    public function requiredPackages($ingredients) {
        $article = $this->selectArticle($ingredients["article_id"]);
        
        $required_pack = ceil( $ingredients["quantity"] / $article["packaging"] );
        return($required_pack);
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


    // Search filter

    public function search($query) {
        $dish_array = $this->selectDish();
        $matches = [];

        foreach ($dish_array as $dish) {
            if ($this->searchRecord($dish, $query)) {
                $matches[] = $dish;
            } 
        }

        if(!empty($matches)) {
            echo "Zoekresultaten voor '$query':";
            return($matches); 
        } else {
            echo "Er zijn geen zoekresultaten gevonden voor '$query'.";
            return($matches);
        }
    }
    
    private function searchRecord($dish, $query) {
        foreach ($dish as $value) {
            if (is_string($value)) {
                if (preg_match("/$query/i", $value)) {
                    return(true);
                }
            }

            if (is_array($value) && $this->searchRecord($value, $query)) {
                return(true);
            }
        }
        return false;
    }

    // public function search($query) {
    //     $dish_array = $this->selectDish();
    //     // $matches = [];

    //     $result = $this->searchRecord($dish_array, $query);

    //     if ($result) {
    //         echo "Found a match: " . $result;
    //     } else {
    //         echo "Geen resultaten gevonden.";
    //     }
    // }

    // private function searchRecord($dish_array, $query) {
    //     $escaped_query = preg_quote($query, '/');

    //     foreach ($dish_array as $record) {
    //         if (is_array($record)) {
    //             // echo "<pre>" , var_dump ($record) , "</pre>";
    //             foreach ($record as $value) {
    //                 if (is_array($value)) {
    //                     // echo "<pre>" , var_dump ($value) , "</pre>";
    //                     $result = $this->searchRecord($value, $escaped_query);
    //                     if ($result !== null) {
    //                         return $result;
    //                     }
    //                 } else {
    //                     // echo "<pre>" , var_dump ($value) , "</pre>";
    //                     if (preg_match("/$escaped_query/i", (string)$value)) {
    //                         return $value;
    //                     }
    //                 }
    //             }
    //         } else {
    //             // echo "<pre>" , var_dump ($record) , "</pre>";
    //             if (preg_match("/$escaped_query/i", (string)$record)) {
    //                 return $record;
    //             }
    //         }
    //     }
    //     echo "Looking for: $escaped_query\n";

    //     return null;
    // }

}