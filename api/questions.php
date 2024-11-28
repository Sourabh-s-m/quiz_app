<?php
require_once 'cors.php';
require_once 'config.php';
require_once 'db.php';

header('Content-Type: application/json');

if (!isset($_GET['topic_id'])) {
    http_response_code(400);
    echo json_encode([
        'status' => 'error',
        'message' => 'Topic ID is required'
    ]);
    exit;
}

$topicId = intval($_GET['topic_id']);

try {
    $conn = getDBConnection();

    $sql = "
        (SELECT q.*, 'beginner' as level_group
         FROM questions q
         WHERE q.topic_id = ? AND q.level = 'beginner'
         ORDER BY RAND()
         LIMIT 4)
        UNION ALL
        (SELECT q.*, 'intermediate' as level_group
         FROM questions q
         WHERE q.topic_id = ? AND q.level = 'intermediate'
         ORDER BY RAND()
         LIMIT 3)
        UNION ALL
        (SELECT q.*, 'professional' as level_group
         FROM questions q
         WHERE q.topic_id = ? AND q.level = 'professional'
         ORDER BY RAND()
         LIMIT 3)
    ";

    $stmt = $conn->prepare($sql);
    $stmt->bind_param("iii", $topicId, $topicId, $topicId);
    $stmt->execute();
    $result = $stmt->get_result();

    $questions = [];

    while ($question = $result->fetch_assoc()) {
        $answerSql = "SELECT id, answer_text, is_correct 
                      FROM answers 
                      WHERE question_id = ?";
        $answerStmt = $conn->prepare($answerSql);
        $answerStmt->bind_param("i", $question['id']);
        $answerStmt->execute();
        $answerResult = $answerStmt->get_result();

        $options = [];
        while ($answer = $answerResult->fetch_assoc()) {
            $options[] = [
                'id' => $answer['id'],
                'text' => $answer['answer_text']
            ];
        }

        $questions[] = [
            'id' => $question['id'],
            'text' => $question['question_text'],
            'level' => $question['level'],
            'options' => $options
        ];
    }

    if (empty($questions)) {
        throw new Exception('No questions found for this topic');
    }

    usort($questions, function ($a, $b) {
        return $a['level'] <=> $b['level'];
    });

    echo json_encode([
        'status' => 'success',
        'data' => $questions
    ]);
} catch (Exception $e) {
    error_log('Questions Error: ' . $e->getMessage());
    http_response_code(500);
    echo json_encode([
        'status' => 'error',
        'message' => 'Failed to load questions: ' . $e->getMessage()
    ]);
} finally {
    if (isset($conn)) {
        $conn->close();
    }
}
