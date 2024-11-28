<?php
require_once 'cors.php';
require_once 'config.php';
require_once 'db.php';

error_reporting(E_ALL);
ini_set('display_errors', 1);

header('Content-Type: application/json');

$input = json_decode(file_get_contents('php://input'), true);

if (!isset($input['answers'])) {
    echo json_encode(['status' => 'error', 'message' => 'No answers provided']);
    exit;
}

$answers = $input['answers'];

try {
    $conn = getDBConnection();

    $score = calculateScore($conn, $answers);

    $response = [
        'status' => 'success',
        'message' => 'Quiz submitted successfully',
        'score' => $score
    ];
} catch (Exception $e) {
    $response = [
        'status' => 'error',
        'message' => 'Database error: ' . $e->getMessage()
    ];
}

echo json_encode($response);

function calculateScore($conn, $answers)
{
    $score = 0;

    foreach ($answers as $answer) {
        if (isCorrectAnswer($conn, $answer)) {
            $score++;
        }
    }

    return $score;
}

function isCorrectAnswer($conn, $answer)
{
    if (!isset($answer['question_id']) || !isset($answer['selected_answer'])) {
        return false;
    }

    $sql = "SELECT is_correct FROM answers WHERE question_id = ? AND id = ? LIMIT 1";
    $stmt = $conn->prepare($sql);
    if (!$stmt) {
        return false;
    }

    $stmt->bind_param("is", $answer['question_id'], $answer['selected_answer']);
    $stmt->execute();

    $result = $stmt->get_result();
    if ($result && $result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $stmt->close();

        $isCorrect = (bool)$row['is_correct'];
        return $isCorrect;
    } else {
        return false;
    }
}
