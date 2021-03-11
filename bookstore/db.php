<?php
    class  Database    {
        public $dbConn=Null;
        public function connect(){
            define("host","localhost");
            define("dbUser","suntorn");
            define("password","basu3s1O73kjQKAf");
            define("database","bookstore");
            $this->dbConn=new mysqli(host,dbUser,password,database);
            $this->dbConn->query("SET NAMES UTF8");

    if($this->dbConn->connect_error)
        
            die("Database Connection Error, Error No.: ".
                $this->dbConn->connect_errno." | ".$this->dbConn->connect_error);
    else{
        //echo"Successfully connected<br>";
    }
        }

        public function disconnect(){
            $this->dbConn->close();
            echo "DB close";
        }

        public function show_information(){
            $SQL_Query="select * from book";
            $result = $this->dbConn->query($SQL_Query);
            $counter=0;
            while($row = $result->fetch_assoc()){
            if($counter==0){
            echo "<tr>";
            foreach($row as $key => $value){
                echo "<th>{$key}</th>";
            }
            echo"</tr>";
            $counter++;
            }
            echo"<tr>";
            foreach($row as $key => $value){
                echo "<th>{$value}</th>";
            }
            echo"</tr>";
            }
            }
    }
?>