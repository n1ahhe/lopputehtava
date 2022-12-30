<?php
//Hakutyökalu joka sisältää REST tuen ja lähettää vastauksen JSON muodossa. Toimii mainiosti Postmanilla.
require_once 'dbconnection.php';

function searchProduct($searchTerm = '') {
    // Yhteys tietokantaan
    $dbcon = createDbConnection();

    //  SELECT kysely
    $query = "SELECT * FROM tuote WHERE tuotenimi LIKE :searchTerm OR tuotekuvaus LIKE :searchTerm";
    $stmt = $dbcon->prepare($query);

    // Liitetään hakutermi kyselyyn
    if ($searchTerm == '') {
        $stmt->bindValue(':searchTerm', '%');
    } else {
        $stmt->bindValue(':searchTerm', "%$searchTerm%");
    }

    // Kyselyn suoritus
    $stmt->execute();

    // Haetaan tulokset taulukkona
    $results = $stmt->fetchAll();

    // Muunnos JSON muotoon
    $json = json_encode($results);

    // Palautetaan JSON merkkijono
    return $json;
}

// Tarkastus onko hakutermi lähetetty GET parametrina
if (isset($_GET['searchTerm'])) {
    $searchTerm = $_GET['searchTerm'];
} else {
    // Jos ei, käytetään tyhjää merkkijonoa
    $searchTerm = '';
}

// Kutsutaan funktiota ja haetaan tulokset
$results = searchProduct($searchTerm);

// Asetus headerille, että vastaus JSON muodossa
header('Content-Type: application/json');

// Tulostetaan
echo $results;
