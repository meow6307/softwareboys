<?php
session_start();

try {
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $username = $_POST["username"];
        $password = $_POST["password"];

        // Database connection
        $db = new mysqli("localhost", "root", "", "cafe_staff_management");

        // Check for database connection errors
        if ($db->connect_error) {
            throw new Exception("Database connection failed: " . $db->connect_error);
        }

        // Prepare and execute a SQL query to check the user's credentials and role
        $query = "SELECT ID, FullName, UserRoleID FROM User WHERE Username = ? AND Password = ?";
        $stmt = $db->prepare($query);

        if (!$stmt) {
            throw new Exception("Prepare statement error: " . $db->error);
        }

        $stmt->bind_param("ss", $username, $password);

        if (!$stmt->execute()) {
            throw new Exception("Execute statement error: " . $stmt->error);
        }

        $stmt->bind_result($userID, $fullName, $userRoleID);

        if ($stmt->fetch()) {
            // User is authenticated
            $_SESSION["user_id"] = $userID;
            $_SESSION["full_name"] = $fullName;
            $_SESSION["user_role_id"] = $userRoleID;

            if ($_SESSION["user_role_id"] === 1) {
                $dashboardLink = "owner.php";
            } elseif ($_SESSION["user_role_id"] === 2) {
                $dashboardLink = "staff.php";
            } elseif ($_SESSION["user_role_id"] === 3) {
                $dashboardLink = "manager.php";
            } elseif ($_SESSION["user_role_id"] === 4) {
                $dashboardLink = "adminhome.php";
            }

            header("Location: $dashboardLink");
            exit();
        } else {
            // Authentication failed, show an error message
            $_SESSION["login_error"] = "Invalid username or password.";
            header("Location: login.php?error=1");
        }

        // Close the database connection
        $stmt->close();
        $db->close();
    } else {
        header("Location: login.php");
    }
} catch (Exception $e) {
    header("Location: error.php?message=" . urlencode($e->getMessage()));
}
?>
