<?php
    define("hostname","localhost");
    define("user","suntorn");
    define("password","basu3s1O73kjQKAf");
    define("dbname","bookstore");
?>
<?php
$mysqli = new mysqli(hostname,user,password,dbname);
if($mysqli -> connect_errno){
    echo "Failed to connect to MySQL :" . $mysqli -> connect_error;
    exit();
}else{
    echo "Connect success...";
}
?>