<?php
session_start();
require_once 'functions.php';

if (!is_logged_in()|| !check_session_timeout()){
    header("Location: login.php");
    exit();
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <script>
let timeout;
function resetTimer(){
    clearTimeout(timeout);
    timeout = setTimeout(function(){
        window.location.href ='logout.php';
    },<?php echo SESSION_TIMEOUT * 1000;?>);
}
document.addEventListener('mousemove', resetTimer);
document.addEventListener('keypress', resetTimer);
resetTimer();

</script>
</head>
<body>
    <H2>WELCOME TO THE DASHBOARD</H2>
    <p>YOU ARE LOGGED IN.</p>
    <a href="logout.php">Logout</a>


</body>
</html>