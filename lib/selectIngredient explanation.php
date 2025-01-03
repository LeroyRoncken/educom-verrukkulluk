<?php

class ingredient {

    private $connection;
    private $art;

    public function __construct($connection) {
        $this->connection = $connection;

        // Create a new local instance of the "article" class and establish a connection to the database using the constructor. Place this new instance in the private property $art.
        $this->art = new article($connection);
    }

    private function selectArticle($article_id) {
        // Define a new property unique to this function, called $art. This is not the same $art as those in other functions, or the private $art property above.
        // Equate this local $art property to the above private $art property using $this->art, which now refers to the new article object (remember that we redefined that property with the constructor above). Target the selectArticle function from the "article" class in article.php.
        $art = $this->art->selectArticle($article_id);
        // Store the array created by the selectArticle function in this local $art.
        return($art);
    }

    public function selectIngredient($dish_id) {

        // Select all fields from all ingredients that belong to a specified dish.
        $sql = "SELECT * FROM ingredient WHERE dish_id = $dish_id";
        $result = mysqli_query($this->connection, $sql);

        // Create an empty array in a new $return property, to avoid errors if a query yields NULL.
        $return = [];

        // Store the new array created above in a new property we call $row. With each loop, a new instance of $row is created and returned as a new array. Loop through the newly created arrays for as long as mysqli_fetch_array can be executed, i.e. while the following condition is met: SELECT * FROM ingredient WHERE dish_id = $dish_id.
        while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            
            // Create a new property #art_id, and store the "article_id" within $row in this property.
            $art_id = $row["article_id"];

            // Create yet another unique local $art and equate it to the above private function selectArticle. Create an array using the selectArticle function for every article_id.
            $art = $this->selectArticle($art_id);
        
            // Create a new array and specify the fields manually. E.g., create a new key called "id" and fill it with the "id" field found in the current $row. After filling out the array, repeat the loop from the start for the next array, and so on for all fields from ingredient where dish_id equals the parameter value $dish_id.
            $return[] = [
                "id" => $row["id"],
                "dish_id" => $row["dish_id"],
                "article_id" => $art_id,
                "name" => $art["name"],
                "description" => $art["description"]
            ];
        }

        return($return);

    }
}