<?php

class dishInfo {

    private $connection;
    private $user;

    public function __construct($constructConnection) {
        $this->connection = $constructConnection;
        $this->user = new user($constructConnection);
    }

    private function selectUser($user_id) {
        $selUser = $this->user->selectUser($user_id);
        return($selUser);
    }

    public function selectInfo($dish_id, $record_type) {
        
        $sql = "SELECT * FROM dish_info WHERE dish_id = $dish_id AND record_type = '$record_type'"; // Use single quotes for an input that is a string (i.e. record type is given in a letter).

        $result = mysqli_query($this->connection, $sql);

        $baseArray = [];
        $return = [];

        while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {

            // $baseArray = [
            //     "id" => $row["id"],
            //     "record_type" => $row["record_type"],
            //     "dish_id" => $row["dish_id"],
            //     "date" => $row["date"],
            //     "numerical_field" => $row["numerical_field"],
            //     "text_field" => $row["text_field"]
            // ];

            $fetchUser = [];
            
            if ($record_type == 'O' || $record_type =='F') {
                
                $user_id = $row["user_id"];
                $fetchUser = $this->selectUser($user_id);

                // $userArray = [
                //     "user_id" => $row["user_id"],
                //     "name" => $fetchUser["name"]
                // ];
                
                // $return [] = [...$baseArray, ...$userArray];

            }

            $return[] = [...$fetchUser, ...$row];
            
        }

        return($return);

    }

}


            // $return[] = [
            //     "id" => $row["id"],
            //     "record_type" => $row["record_type"],
            //     "dish_id" => $row["dish_id"]
            // ];

            // if ($row["user_id"] != NULL) {
            //     $user_id = $row["user_id"];
            //     $fetchUser = $this->selectUser($user_id);
            //     $return[] = [
            //         "user_id" => $row["user_id"],
            //         "name" => $fetchUser["name"]
            //     ];
            // }
            // if ($row["date"] != NULL) {
            //     $return[] = [
            //         "date" => $row["date"]
            //     ];
            // }
            // if ($row["numerical_field"] != NULL) {
            //     $return[] = [
            //         "numerical_field" => $row["numerical_field"]
            //     ];
            // }
            // if ($row["text_field"] != NULL) {
            //     $return[] = [
            //         "text_field" => $row["text_field"]
            //     ];
            // }