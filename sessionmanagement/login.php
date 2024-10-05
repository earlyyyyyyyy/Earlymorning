<?php
session_start();
require_once 'config.php';
require_once 'functions.php';

if (is_logged_in()) {
    header("Location: dashboard.php");
    exit();
}

$error = "";  // Initialize error variable

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = sanitize_input($_POST["username"]);
    $password = $_POST["password"];

    // Check if 'g-recaptcha-response' is set
    if (isset($_POST["g-recaptcha-response"])) {
        $recaptcha_response = $_POST["g-recaptcha-response"];

        if (verify_recaptcha($recaptcha_response)) {
            if (login($username, $password)) {
                header("Location: dashboard.php");
                exit();
            } else {
                $error = "Invalid username or password";
            }
        } else {
            $error = "reCAPTCHA verification failed";
        }
    } else {
        $error = "Please complete the reCAPTCHA";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
</head>
<body>
    <h2>Login</h2>
    <?php if ($error) { echo "<p style='color: red;'>$error</p>"; } ?>
    <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required> <br><br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required> <br><br>
        <div class="g-recaptcha" data-sitekey="6Ldvf1gqAAAAAABbDoFnTAWvKqfUt5z-FWpUVeqP"></div><br>
        <input type="submit" value="Login">
    </form>
</body>
</html>
