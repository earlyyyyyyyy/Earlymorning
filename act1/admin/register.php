<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    include 'connection.php'; // Include your database connection

    $emp_username = $_POST['emp_username'];
    $emp_pwd = password_hash($_POST['emp_pwd'], PASSWORD_DEFAULT); // Hash the password
    $emp_Fname = $_POST['emp_Fname'];
    $emp_Mname = $_POST['emp_Mname'];
    $emp_Lname = $_POST['emp_Lname'];
    $emp_email = $_POST['emp_email'];
    $emp_contact = $_POST['emp_contact'];
    $emp_role = $_POST['emp_role'];
    $emp_status = $_POST['emp_status'];
    $emp_reg_date = date('Y-m-d H:i:s');

    // Handle the image upload
    $emp_pic = $_FILES['emp_pic']['name'];
    $target_dir = "img/employee/";
    $target_file = $target_dir . basename($emp_pic);
    move_uploaded_file($_FILES['emp_pic']['tmp_name'], $target_file);

    // Insert into database
    $sql = "INSERT INTO tbl_user_admin (emp_username, emp_pwd, emp_Fname, emp_Mname, emp_Lname, emp_pic, emp_email, emp_contact, emp_role, emp_status, emp_reg_date)
            VALUES ('$emp_username', '$emp_pwd', '$emp_Fname', '$emp_Mname', '$emp_Lname', '$emp_pic', '$emp_email', '$emp_contact', '$emp_role', '$emp_status', '$emp_reg_date')";

    if (mysqli_query($conn, $sql)) {
        echo "Registration successful!";
    } else {
        echo "Error: " . $sql . "<br>" . mysqli_error($conn);
    }

    mysqli_close($conn);
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Account Registration</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
    <h2 class="text-center">Employee Registration</h2>
    <form action="register.php" method="POST" enctype="multipart/form-data" class="mt-4">
        <div class="row">
            <!-- Username -->
            <div class="col-md-6">
                <div class="mb-3">
                    <label for="username" class="form-label">Username</label>
                    <input type="text" class="form-control" id="username" name="emp_username" required>
                </div>
            </div>

            <!-- Password -->
            <div class="col-md-6">
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" class="form-control" id="password" name="emp_pwd" required>
                </div>
            </div>
        </div>

        <div class="row">
            <!-- First Name -->
            <div class="col-md-4">
                <div class="mb-3">
                    <label for="fname" class="form-label">First Name</label>
                    <input type="text" class="form-control" id="fname" name="emp_Fname" required>
                </div>
            </div>

            <!-- Middle Name -->
            <div class="col-md-4">
                <div class="mb-3">
                    <label for="mname" class="form-label">Middle Name</label>
                    <input type="text" class="form-control" id="mname" name="emp_Mname">
                </div>
            </div>

            <!-- Last Name -->
            <div class="col-md-4">
                <div class="mb-3">
                    <label for="lname" class="form-label">Last Name</label>
                    <input type="text" class="form-control" id="lname" name="emp_Lname" required>
                </div>
            </div>
        </div>

        <div class="row">
            <!-- Email -->
            <div class="col-md-6">
                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" name="emp_email" required>
                </div>
            </div>

            <!-- Contact Number -->
            <div class="col-md-6">
                <div class="mb-3">
                    <label for="contact" class="form-label">Contact Number</label>
                    <input type="text" class="form-control" id="contact" name="emp_contact" required>
                </div>
            </div>
        </div>

        <div class="row">
            <!-- Role -->
            <div class="col-md-6">
                <div class="mb-3">
                    <label for="role" class="form-label">Role</label>
                    <select class="form-control" id="role" name="emp_role" required>
                        <option value="Admin">Admin</option>
                        <option value="Super-Admin">Super-Admin</option>
                    </select>
                </div>
            </div>

            <!-- Status -->
            <div class="col-md-6">
                <div class="mb-3">
                    <label for="status" class="form-label">Status</label>
                    <select class="form-control" id="status" name="emp_status" required>
                        <option value="Active">Active</option>
                        <option value="Inactive">Inactive</option>
                    </select>
                </div>
            </div>
        </div>

        <!-- Profile Picture -->
        <div class="mb-3">
            <label for="profilePic" class="form-label">Profile Picture</label>
            <input type="file" class="form-control" id="profilePic" name="emp_pic" required>
        </div>

        <!-- Submit Button -->
        <button type="submit" class="btn btn-primary w-100">Register</button>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
