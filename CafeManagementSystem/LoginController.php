<?php
// Database connection parameters
$host = 'localhost';
$db_name = 'your_database_name';
$username = 'your_database_user';
$password = 'your_database_password';

// Attempt to establish a database connection
try {
    $conn = new PDO("mysql:host=$host;dbname=$db_name", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Database Connection Error: " . $e->getMessage());
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];

    // Authenticate the user against the database
    $sql = "SELECT * FROM Users WHERE Username = :username AND Password = :password";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':username', $username);
    $stmt->bindParam(':password', $password);
    $stmt->execute();

    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($user) {
        // Authentication successful, redirect to the dashboard
        header("Location: dashboard.php");
        exit();
    } else {
        // Authentication failed, display an error message on the login page
        header("Location: login.php?error=1");
        exit();
    }
}

// Include the login form
include('login.php');
?>
