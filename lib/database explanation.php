<?php 

// Define the database that you want to connect to:
define("USER", "root");
define("PASSWORD", "");
define("DATABASE", "verrukkulluk");
define("HOST", "localhost");


// Create a "database" class that establishes a connection between this .php file and the actual database:
class database {

    // Establish a variable (called a property) with the name "connection" using "$". The "private" keyword marks the property as local to this instance of "database" and prevents external code or derived classes to modify this property.
    private $connection;

    // The "public" keyword enables the following object (in this case the construct function) to be accessed and modified by external code and classes.
    // When a new object is created from the "database" class (i.e. ... = new database();), this constructor is automatically called upon.
    public function __construct() {
        // $this refers to the public and private properties of the newly created instance of this "database" class, i.e. the new object. The "connection" property is therefor unique to each new instance of the "database" class.
        // The property specified after $this comes without "$", so that it can be given a new value. If you were to write $this->$connection, the program would interpret the value of $connection instead of assigning a new value to it.
        // $this->connection refers to the private property above in this instance of the object (i.e. class), hence it cannot be modified when called upon externally. In other words, the paramaters like host and password are stored in the private property "connection", so that they cannot be modified externally. However, because it is incorporated in a public function here, the privately estabished connection, i.e. the output of the function, can be used by externally derived objects of the "database" class.
        // mysqli_connect() is a standard function that connects to the specified server using the given parameters. The capitalised words between brackets refer to the defined words at the beginning of this file.
        // The connection established by mysqli_connect now exists, but is not used for anything at this point.
        $this->connection = mysqli_connect
        (HOST,
         USER,
         PASSWORD,
         DATABASE);
    }

    // This function returns the connection that has been created by the above constructor in the new instance of the "database" class. The established connection is now functional.
    public function getConnection() {
        return($this->connection);
    }

}