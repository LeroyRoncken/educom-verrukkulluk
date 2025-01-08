<?php

class dishInfo {

    private $connection;
    private $user;

    public function __construct($constructConnection) {
        $this->connection = $constructConnection;
        $this->user = new user($constructConnection);
    }

    public function addFavorite($dish_id, $user_id) {
        $sql = "INSERT INTO dish_info (record_type, dish_id, user_id) VALUES ('F', $dish_id, $user_id)";
        mysqli_query($this->connection, $sql);
    }

    public function deleteFavorite($dish_id, $user_id) {
        $sql = "DELETE FROM dish_info WHERE record_type = 'F' AND dish_id = $dish_id AND user_id = $user_id";
        mysqli_query($this->connection, $sql);
    }

    public function selectInfo($dish_id, $record_type) {
        
        $sql = "SELECT * FROM dish_info WHERE dish_id = $dish_id AND record_type = '$record_type'";
        // Use single quotes for an input that is a string (i.e. record type is given in a letter).

        $result = mysqli_query($this->connection, $sql);

        $return = [];

        while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {

            $fetchUser = [];
            
            if ($record_type == 'C' || $record_type =='F') {
                
                $user_id = $row["user_id"];
                $fetchUser = $this->selectUser($user_id);

            }

            $return[] = [...$fetchUser, ...$row];
        }

        return($return);
    }

    private function selectUser($user_id) {
        $selUser = $this->user->selectUser($user_id);
        return($selUser);
    }

}