<?php
require_once 'dbconnection.php';
$dbcon = createDbConnection();
// Onko käyttäjä lähettänyt lomakkeen
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Hae käyttäjänimi ja salasana lomakkeelta
    $username = $_POST['username'];
    $password = $_POST['password'];

    // SELECT kysely
    $query = "SELECT * FROM users WHERE username = :username AND password = :password";

    // Valmistele kysely
    $stmt = $dbcon->prepare($query);

    // Liitä arvot paikallisiin muuttujiin
    $stmt->bindValue(':username', $username, PDO::PARAM_STR);
    $stmt->bindValue(':password', $password, PDO::PARAM_STR);

    // Suorita kysely
    $stmt->execute();

    // Tallenna tulos
    $result = $stmt->fetch();

    // Palautuiko kyselystä tulos
    if ($result !== false) {
        // Jos palautui, aseta logged-in -sessionmuuttuja true
        $_SESSION['logged_in'] = true;
        // Asetetaan username session arvoksi kirjautuneen käyttäjän käyttäjänimi
        $_SESSION['username'] = $username;
        // Ohjaa ylläpitosivulle
        header('Location: admin.php');
    } else {
        // Jos tulosta ei palautunut, näytetään virheilmoitus
        echo '<p>Invalid username or password</p>';
    }
}
// Tarkistetaan onko käyttäjä kirjautunut sisään
if (isset($_SESSION['logged_in']) && $_SESSION['logged_in'] == true) {
    // Jos käyttäjä on jo kirjautunut sisään, näytetään ylläpitosivu
    ?>
    <h1>Admin Page</h1>
    <p>Welcome, <?php echo $_SESSION['username']; ?>!</p>
    <p><a href="logout.php">Logout</a></p>
    <?php
} else {
    // Jos ei ole, näytetään kirjautumislomake
    ?>
    <h1>Admin Login</h1>
    <form action="login.php" method="post">
        <label for="username">Username:</label><br>
        <input type="text" name="username" id="username"><br>
        <label for="password">Password:</label><br>
        <input type="password" name="password" id="password"><br>
        <input type="submit" value="Submit">
    </form>
    <?php
}
