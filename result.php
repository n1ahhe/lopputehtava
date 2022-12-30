<?php
//Testailin vaan 
require_once 'dbconnection.php';


$json = file_get_contents("http://localhost/reimanprokkis/search.php");


if (!empty($json)) {
    
    $results = json_decode($json, true);

    
    if (!empty($results)) {
        
        echo "<ul>";
        foreach ($results as $row) {
            echo "<li>" . $row['tuotenimi'] . "</li>";
        }
        echo "</ul>";
    } else {
       
        echo "Ei hakutuloksia.";
    }
} else {
   
    echo "Error";
}
