<?php
require_once 'config.php';
require_once 'db.php';

function sanitize_input($data){
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}

function verify_recaptcha($recaptcha_response){
    $url = 'https://www.google.com/recaptcha/api/siteverify';
    $data = array(
        'secret' => '6Ldvf1gqAAAAAMZLzsrue-l5djw0SRsCgkIQy1IF', // Enclose secret key in quotes
        'response' => $recaptcha_response
    );

    $options = array(
        'http' => array(
            'header' => "Content-type: application/x-www-form-urlencoded\r\n",
            'method' => 'POST',
            'content' => http_build_query($data)
        )
    );

    $context = stream_context_create($options); // Correct variable name to 'options'
    $result = file_get_contents($url, false, $context);
    $json = json_decode($result);
    return $json->success;
}

function login($username, $password) {
    $conn = db_connect();
    $username = $conn->real_escape_string($username);
    $stmt = $conn->prepare("SELECT id, password FROM tbl_users WHERE username = ?");
    $stmt->bind_param('s', $username); // Bind parameter to the statement
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows === 1){
        $user = $result->fetch_assoc();
        
        // Compare the plain password instead of using password_verify()
        if ($password === $user['password']) {
            $_SESSION['user_id'] = $user['id'];
            $_SESSION['last_activity'] = time();
            return true;
        }
    }
    return false;
}


function is_logged_in(){
    return isset($_SESSION['user_id']);
}

function check_session_timeout(){
    if(isset($_SESSION['last_activity']) && (time() - $_SESSION['last_activity'] > SESSION_TIMEOUT)) {
        session_unset();
        session_destroy();
        return false;
    }
    $_SESSION['last_activity'] = time();
    return true;
}
?>
