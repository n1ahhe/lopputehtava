<?php
require_once 'dbconnection.php';
// Sessio alkaa
session_start();

// Tarkista onko käyttäjä kirjautunut sisään
if (isset($_SESSION['logged_in']) && $_SESSION['logged_in'] == true) {
    // Jos on, näytä ylläpitosivu
    ?>
    <h1>Admin Page</h1>
    <p>Welcome, <?php echo $_SESSION['username']; ?>!</p>
    <p><a href="logout.php">Logout</a></p>
    <?php
} else {
    // Jos käyttäjä ei ole kirjautunut sisään, näytä kirjautumislomake
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

