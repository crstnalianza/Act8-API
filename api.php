<?php
header("Content-Type: application/json");

$host = 'localhost';
$db = 'ordering_system';
$user = 'root';
$pass = '';
$charset = 'utf8mb4';

$dsn = "mysql:host=$host;dbname=$db;charset=$charset";
$options = [
    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_EMULATE_PREPARES => false,
];

$pdo = new PDO($dsn, $user, $pass, $options);

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    $stmt = $pdo->query("SELECT * FROM orders");
    $orders = $stmt->fetchAll();
    echo json_encode($orders);
} elseif ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $input = json_decode(file_get_contents('php://input'), true);

    if (isset($input['product_names']) && isset($input['total_due'])) {
      
        $total_due = $input['total_due']; // Retrieve total_due from input

        $sql = "INSERT INTO orders (product_names, total_due) VALUES (?, ?)";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([$input['product_names'], $total_due]);
        echo json_encode(['message' => 'Order added successfully']);
    } else {
        echo json_encode(['error' => 'Invalid request']);
    }
}
?>
