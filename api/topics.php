<?php
require_once 'cors.php';
require_once 'config.php';
require_once 'db.php';

header('Content-Type: application/json');

try {
    $conn = getDBConnection();

    $sql = "SELECT * FROM topics ORDER BY name";
    $result = $conn->query($sql);

    if (!$result) {
        throw new Exception("Database query failed: " . $conn->error);
    }

    $topics = [];
    while ($row = $result->fetch_assoc()) {
        $topics[] = [
            'id' => (int)$row['id'],
            'name' => $row['name']
        ];
    }

    echo json_encode([
        'status' => 'success',
        'data' => $topics
    ]);
} catch (Exception $e) {
    error_log('Topics Error: ' . $e->getMessage());
    http_response_code(500);
    echo json_encode([
        'status' => 'error',
        'message' => 'Failed to load topics: ' . $e->getMessage()
    ]);
} finally {
    if (isset($conn)) {
        $conn->close();
    }
}
