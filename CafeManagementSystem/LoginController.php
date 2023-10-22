<?php
// Database connection parameters
$host = 'localhost';
$db_name = 'cafestaffmanagement'; // Name of the database
$username = 'root';
$password = '';

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
        // Authentication successful
        echo "<script>alert('Successfully logged in!');</script>";
        // Redirect to the dashboard
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
