<?php 
    include('includes/nav.php');
    include('connection.php');

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $name = $_POST['name'];
        $email = $_POST['email'];
        $subject = $_POST['subject'];
        $message = $_POST['message'];
        $contact_date = date("Y-m-d H:i:s");

        // Insert query
        $sql = "INSERT INTO tbl_contact_form (name, email, subject, message, contact_date) 
                VALUES ('$name', '$email', '$subject', '$message', '$contact_date')";

        if ($conn->query($sql) === TRUE) {
            echo "Message sent successfully!";
        } else {
            echo "Error: " . $sql . "<br>" . $conn->error;
        }

        // Close the connection
        $conn->close();
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Form</title>
    <!-- recaptcha -->
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    <!-- end recaptcha -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center mb-4">Contact Us</h2>
        <form id="contactForm" action="contact.php" method="POST">
            <div class="mb-3">
                <label for="name" class="form-label">Name</label>
                <input type="text" class="form-control" id="name" name="name" placeholder="Your Name" required>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="Your Email" required>
            </div>
            <div class="mb-3">
                <label for="subject" class="form-label">Subject</label>
                <input type="text" class="form-control" id="subject" name="subject" placeholder="Subject" required>
            </div>
            <div class="mb-3">
                <label for="message" class="form-label">Message</label>
                <textarea class="form-control" id="message" name="message" rows="5" placeholder="Your Message" required></textarea>
            </div>
            <!-- recaptcha -->
            <div class="g-recaptcha" data-sitekey="6Lf6lU0qAAAAALkM9-tkGmD2ZJd8kSSxaivrDJru"></div>
            <!-- end recaptcha -->
            <div class="text-center mt-4">
                <button type="submit" id="submitBtn" class="btn btn-primary">Submit</button>
            </div>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
       
        // Ensure that the form is not submitted until reCAPTCHA is verified
        document.getElementById('contactForm').addEventListener('submit', function(event) {
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
