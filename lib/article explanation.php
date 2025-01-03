<?php

class article {

    // This private "connection" property is a new, local property, and thus unrelated to the connection property in database.php.
    private $connection;

    // When a new instance of the article class is created, a parameter value should be given between the brackets.
    // For example: In index.php, it's called upon like this: "new article($db->getConnection())". The result of "$db->getConnection()" is placed in the constructor below in place of "$connection", which means that in this instance, the function essentially becomes __construct( [result of $db->getConnection()] )
    // $this->connection defines the connection property within this particular instance of the article class, and is set to be $connection, i.e. the parameter value given in the constructor. In other words, the connection property that is used within this object is whatever parameter value is input.
    public function __construct($connection) {
        $this->connection = $connection;
    }

    // This function only runs when it is called upon (in this case in index.php).
    public function selectArticle($article_id) {

        //SELECT all fields FROM the table called "article" WHERE the colom called "id" corresponds with the input parameter value:
        $sql = "SELECT * FROM article WHERE id = $article_id";
        
        // mysqli_query( [connection] , [query] ) -> This function executes the $sql query for the database established through $this->connection using the above constructor.
        $result = mysqli_query($this->connection, $sql);

        // mysqli_fetch_array( [result] , [resulttype] ) -> This function retrieves an array. [result] specifies what needs to be fetched, and must be given through either mysqli_query(), mysqli_store_result() or mysqli_use_result(). [resulttype] specifies what type of array that should be produced, in this case an associative array (i.e. include keys and values).
        $article = mysqli_fetch_array($result, MYSQLI_ASSOC);

        return($article);
        
    }

}