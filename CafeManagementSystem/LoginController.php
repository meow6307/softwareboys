<?php
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST["username"];
    $password = $_POST["password"];

    // Database connection
    $db = new mysqli("localhost", "root", "", "cafe_staff_management");

    // Check for database connection errors
    if ($db->connect_error) {
        header("Location: error.php?message=Database connection failed");
        exit();
    }

    // Prepare and execute a SQL query to check the user's credentials and role
    $query = "SELECT ID, FullName, UserRoleID FROM User WHERE Username = ? AND Password = ?";
    $stmt = $db->prepare($query);
    $stmt->bind_param("ss", $username, $password);
    $stmt->execute();
    $stmt->bind_result($userID, $fullName, $userRoleID);

    if ($stmt->fetch()) {
        // User is authenticated
        $_SESSION["user_id"] = $userID;
        $_SESSION["full_name"] = $fullName;
        $_SESSION["user_role_id"] = $userRoleID;

        // Based on the user's role, generate links to the appropriate pages
        if ($_SESSION["user_role_id"] === 1) {
            $dashboardLink = "owner.php";
        } elseif ($_SESSION["user_role_id"] === 2) {
            $dashboardLink = "staff.php";
        } elseif ($_SESSION["user_role_id"] === 3) {
            $dashboardLink = "manager.php";
        } elseif ($_SESSION["user_role_id"] === 4) {
            $dashboardLink = "adminhome.php";
        }

        // Redirect the user to the appropriate dashboard using PHP
        header("Location: $dashboardLink");
        
    } else {
        // Authentication failed, show an error message
        $_SESSION["login_error"] = "Invalid username or password.";
        header("Location: login.php?error=1");
        exit(); // Terminate the script to prevent further execution
    }

    // Close the database connection
    $stmt->close();
    $db->close();
} else {
    header("Location: login.php");
}
?>
