<?php

class ingredient {

    private $connection;
    private $art;

    public function __construct($constructConnection) {
        $this->connection = $constructConnection;
        $this->art = new article($constructConnection);
    }

    private function selectArticle($article_id) {
        $selArt = $this->art->selectArticle($article_id);
        return($selArt);
    }

    public function selectIngredient($dish_id) {

        $sql = "SELECT * FROM ingredient WHERE dish_id = $dish_id";
        $result = mysqli_query($this->connection, $sql);

        $return = [];

        while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            $art_id = $row["article_id"];
            $ingrArt = $this->selectArticle($art_id);
        
            $return[] = [...$row, ...$ingrArt];
        }

        return($return);

    }
}