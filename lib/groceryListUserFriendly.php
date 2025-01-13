<?php

class groceryList {

    private $connection;
    private $dish;
    private $user;
    private $article;
    private $ingredient;
    
    public function __construct($constructConnection) {
        $this->connection = $constructConnection;
        $this->dish = new dish($constructConnection);
        $this->user = new user($constructConnection);
        $this->article = new article($constructConnection);
        $this->ingredient = new ingredient($constructConnection);
    }

    public function addArticle($dish_id, $user_id) {
        $ingredients = $this->selectIngredient($dish_id);

        foreach ($ingredients as $ingredient) {
            $article_id = $ingredient["article_id"];
            $ingredient_quantity = $ingredient["quantity"];

            if ( $this->articleOnList($article_id, $user_id) ) {
                // Edit article
                $grocery = $this->selectGrocery($user_id, $article_id);
                $grocery_quantity = $grocery["quantity"];
                $grocery_quantity += $ingredient_quantity;
                $sql = "UPDATE groceries SET quantity = $grocery_quantity
                        WHERE article_id = $article_id AND user_id = $user_id";
                mysqli_query($this->connection, $sql);

                $article = $this->selectArticle($article_id);
                $article_pack = $article["packaging"];
                $total_pack = ceil($grocery_quantity / $article_pack);
                $sql = "UPDATE groceries SET amount = $total_pack, quantity = $grocery_quantity
                        WHERE article_id = $article_id AND user_id = $user_id";
                mysqli_query($this->connection, $sql);

            } else {
                // Add article
                $required_pack = $this->requiredPackages($ingredient);
                $sql = "INSERT INTO groceries (article_id, user_id, amount, quantity)
                        VALUES ('$article_id', '$user_id', '$required_pack', '$ingredient_quantity')";
                mysqli_query($this->connection, $sql);
            }
        }
    }

    private function selectIngredient($dish_id) {
        return($this->ingredient->selectIngredient($dish_id));
    }

    private function selectArticle($article_id) {
        return($this->article->selectArticle($article_id));
    }
    
    private function requiredPackages($ingredients) {
        return($this->dish->requiredPackages($ingredients));
    }

    private function articleOnList($article_id, $user_id) {
        $groceries = $this->selectGroceries($user_id);

        foreach ($groceries as $grocery) {
            if ($grocery["article_id"] == $article_id) {
                return($grocery);
            }
        }
        return(false);
    }
    
    private function selectGroceries($user_id) {
        $sql = "SELECT * FROM groceries WHERE user_id = $user_id";
        $result = mysqli_query($this->connection, $sql);

        $groceries = [];

        while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            $groceries[] = $row;
        }
        return($groceries);
    }

    private function selectGrocery($user_id, $article_id) {
        $sql = "SELECT * FROM groceries WHERE user_id = $user_id AND article_id = $article_id";
        $result = mysqli_query($this->connection, $sql);
        return(mysqli_fetch_array($result, MYSQLI_ASSOC));
    }

}