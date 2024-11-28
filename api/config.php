<?php
if (!defined('BASEPATH')) {
    define('BASEPATH', dirname(__FILE__));
}

error_reporting(E_ALL);
ini_set('display_errors', 0);
ini_set('log_errors', 1);
ini_set('error_log', BASEPATH . '/error.log');

define('GOOGLE_CLIENT_ID', '1090651359189-rlfv0hbpmddrv81tqbve3j3hp74k6r8d.apps.googleusercontent.com');
define('GOOGLE_CLIENT_SECRET', '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');
define('GOOGLE_REDIRECT_URI', 'http://localhost:8080/api/google-callback.php');

define('FRONTEND_URL', 'http://localhost:8080');

define('DB_HOST', 'localhost');
define('DB_USER', 'root');
define('DB_PASS', '');
define('DB_NAME', 'quiz_app');
