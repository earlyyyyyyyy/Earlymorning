<?php
session_start();

include('includes/nav.php');
include('connection.php');

// Check if form is submitted
if (isset($_POST['login'])) {
    $username = mysqli_real_escape_string($conn, $_POST['username']);
    $password = mysqli_real_escape_string($conn, $_POST['password']);
    
    // Server-side validation of reCAPTCHA
    $recaptchaResponse = $_POST['g-recaptcha-response'];
    $secretKey = '6LftyE0qAAAAAFkt88t61ixa5qhDp54UUJLb1pBY'; // Replace with your reCAPTCHA secret key

    // Make a POST request to Google's reCAPTCHA API to verify the response
    $verifyResponse = file_get_contents('https://www.google.com/recaptcha/api/siteverify?secret=' . $secretKey . '&response=' . $recaptchaResponse);
    $responseData = json_decode($verifyResponse);

    if (!$responseData->success) {
        $error = "Please complete the reCAPTCHA verification.";
    } else {
        // Query to check if the username exists
        $query = "SELECT * FROM tbl_user_admin WHERE emp_username='$username'";
        $result = mysqli_query($conn, $query);

        if (mysqli_num_rows($result) == 1) {
            $row = mysqli_fetch_assoc($result);

            // Verify the password (assuming it's hashed)
            if (password_verify($password, $row['emp_pwd'])) {
                $_SESSION['employee_id'] = $row['employee_id'];
                $_SESSION['emp_username'] = $row['emp_username'];
                $_SESSION['emp_role'] = $row['emp_role'];

                // Redirect based on role
                if ($row['emp_role'] == 'Admin') {
                    header("Location: admin/register.php");
                } else {
                    header("Location: login.php");
                }
                exit(); // Ensure no further code is executed
            } else {
                $error = "Invalid password.";
            }
        } else {
            $error = "User not found.";
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <!-- recaptcha -->
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    <!-- end recaptcha -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            height: 100vh;
        }
        .login-card {
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .card-header {
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }
        .form-control {
            border-radius: 30px;
        }
        .btn-primary {
            border-radius: 30px;
        }
    </style>
</head>
<body>
    <div class="container d-flex justify-content-center align-items-center" style="min-height: 100vh;">
        <div class="col-md-6 col-lg-4">
            <div class="card login-card">
                <div class="card-header bg-primary text-white text-center">
                    <h4>Login</h4>
                </div>
                <div class="card-body p-4">
                    <?php if (isset($error)): ?>
                        <div class="alert alert-danger"><?php echo $error; ?></div>
                    <?php endif; ?>
                    <form method="POST" action="" id="loginForm">
                        <div class="form-group">
                            <label for="username">Username</label>
                            <input type="text" name="username" class="form-control" placeholder="Enter your username" required>
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" name="password" class="form-control" placeholder="Enter your password" required>
                        </div>
                        <!-- recaptcha -->
                        <div class="g-recaptcha" data-sitekey="6LftyE0qAAAAAHQ0ZhBRIgmSs6AJQkDRnNsWu_Nw"></div>
                        <!-- end recaptcha -->
                        <button type="submit" name="login" class="btn btn-primary btn-block">Login</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Client-side validation for reCAPTCHA
        document.getElementById('loginForm').addEventListener('submit', function(event) {
            var response = grecaptcha.getResponse();
            if(response.length == 0) {
                // If no reCAPTCHA response, prevent form submission and alert the user
                alert("Please verify that you are not a robot.");
                event.preventDefault(); // Prevent form from submitting
            }
        });
    </script>
</body>
</html>
