<?php
require_once 'cors.php';
require_once 'config.php';

header('Content-Type: application/json');

try {
    $googleAuthUrl = 'https://accounts.google.com/o/oauth2/v2/auth';
    $params = [
        'client_id' => GOOGLE_CLIENT_ID,
        'redirect_uri' => GOOGLE_REDIRECT_URI,
        'response_type' => 'code',
        'scope' => 'email profile',
        'access_type' => 'online',
        'prompt' => 'select_account'
    ];

    $authUrl = $googleAuthUrl . '?' . http_build_query($params);
    
    echo json_encode(['url' => $authUrl]);
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(['error' => $e->getMessage()]);
}
