<?php
require_once 'cors.php';
require_once 'db.php';

session_start();

$method = $_SERVER['REQUEST_METHOD'];
$request = $_SERVER['REQUEST_URI'];
$request = explode('/api/', $request)[1] ?? '';

switch ($request) {
    case 'topics':
        if ($method === 'GET') {
            getTopics();
        }
        break;

    case 'quiz/start':
        if ($method === 'POST') {
            startQuiz();
        }
        break;

    default:
        http_response_code(404);
        echo json_encode(['error' => 'Not found']);
        break;
}

function getTopics()
{
    $conn = getDBConnection();
    $sql = "SELECT * FROM topics";
    $result = $conn->query($sql);

    $topics = [];
    while ($row = $result->fetch_assoc()) {
        $topics[] = $row;
    }

    echo json_encode($topics);
    $conn->close();
}

function startQuiz()
{
    $data = json_decode(file_get_contents('php://input'), true);
    $topicId = $data['topicId'] ?? null;

    if (!$topicId) {
        http_response_code(400);
        echo json_encode(['error' => 'Topic ID required']);
        return;
    }
}
