<?php

class article {

    private $connection;

    public function __construct($constructConnection) {
        $this->connection = $constructConnection;
    }
  
    public function selectArticle($article_id) {

        $sql = "SELECT * FROM article WHERE id = $article_id";
        
        $result = mysqli_query($this->connection, $sql);
        $article = mysqli_fetch_array($result, MYSQLI_ASSOC);

        return($article);
        
    }

}