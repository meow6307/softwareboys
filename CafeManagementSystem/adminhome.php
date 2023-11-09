<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel - Cafe Staff Management System</title>
    <link rel="stylesheet" type="text/css" href="admin.css">
</head>
<body>
    <header>
        <h1>Welcome, System Admin!</h1>
    </header>

    <nav>
    <ul>
        </li>
        <li class="dropdown">
            <a href="#">View</a>
            <ul class="dropdown-content">
                <li><a href="view_user_accounts.php">User Accounts</a></li>
                <li><a href="view_user_profiles.php">User Profiles</a></li>
            </ul>
        </li>
        <li class="dropdown">
            <a href="#">Update</a>
            <ul class="dropdown-content">
                <li><a href="update_user_account.php">User Account</a></li>
                <li><a href="update_user_profile.php">User Profile</a></li>
            </ul>
        </li>
        <li class="dropdown">
            <a href="#">Suspend</a>
            <ul class="dropdown-content">
                <li><a href="suspend_user_account.php">User Account</a></li>
                <li><a href="suspend_user_profile.php">User Profile</a></li>
            </ul>
        </li>
        <li class="dropdown">
            <a href="#">Search</a>
            <ul class="dropdown-content">
                <li><a href="search_user_accounts.php">User Accounts</a></li>
                <li><a href="search_user_profiles.php">User Profiles</a></li>
            </ul>
        </li>
        <li><a href="adminlogout.php">Logout</a></li>
    </ul>
</nav>


    <main>
        <!-- Your main content and forms for performing admin actions will go here -->
    </main>

    <footer>
        &copy; <?php echo date("Y"); ?> Admin Panel - Cafe Staff Management System
    </footer>
</body>
</html>
