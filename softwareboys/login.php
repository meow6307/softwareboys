<?php
    session_start();

    // Check if a message is passed in the URL
    if (isset($_GET['message'])) {
        $message = $_GET['message'];
        echo "<script>alert('" . $message . "');</script>";
    }

?>
<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
    <link rel="stylesheet" type="text/css" href="Login.css"> <!-- Include the CSS file -->
</head>
<body>
    <div class="login-container">
        <h2>Login</h2>
        <form action="LoginController.php" method="post">
            <!-- Rest of your HTML content here -->
        </form>
    </div>
</body>
</html>
