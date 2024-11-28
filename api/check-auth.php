<?php
require_once 'cors.php';
session_start();

if (isset($_SESSION['user'])) {
    echo json_encode([
        'authenticated' => true,
        'user' => $_SESSION['user']
    ]);
} else {
    echo json_encode([
        'authenticated' => false
    ]);
} 