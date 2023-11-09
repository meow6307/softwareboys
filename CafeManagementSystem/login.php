<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Cafe Staff Management System</title>
    <link rel="stylesheet" type="text/css" href="login.css">
</head>
<body>
    <header>
        <h1>Login to Cafe Staff Management System</h1>
    </header>

    <main>
        <form action="logincontroller.php" method="post">
            <div class="login-form">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required><br><br>
                
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required><br><br>
                
                <input type="submit" value="Login">
            </div>
        </form>
    </main>

    <footer>
        &copy; <?php echo date("Y"); ?> Cafe Staff Management System
    </footer>
</body>
</html>
