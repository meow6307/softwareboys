<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cafe Management System - Login</title>
    <link rel="stylesheet" type="text/css" href="styles/login.css">
</head>
<body>
    <div class="background-image"></div>
    <div class="login-container">
        <img src="images/jks_logo.png" alt="Cafe Logo" class="logo">
        <h1>Cafe Management System</h1>
        <p class="tagline">Serving Excellence, One Cup at a Time</p>
        <form action="loginController.php" method="post">
            <label for="username">Username or Email:</label>
            <input type="text" name="username" id="username" required>
            
            <label for="password">Password:</label>
            <input type="password" name="password" id="password" required>
            
            <div class="form-group">
                <input type="checkbox" name="remember" id="remember">
                <label for="remember">Remember Me</label>
            </div>
            
            <button type="submit" class="login-button">Login</button>
        </form>
        
        <a href="forgot_password.php" class="forgot-password">Forgot your password?</a>
    </div>
    
    <div class="footer-links">
        <a href="about_us.php">About Us</a>
        <a href="menu.php">Menu</a>
        <a href="contact.php">Contact</a>
    </div>
</body>
</html>
