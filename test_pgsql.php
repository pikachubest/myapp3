<?php
try {
    $pdo = new PDO("pgsql:host=dpg-ctaevq23esus739a40sg-a;port=5432;dbname=myapp_db_nzxr", "myapp_user", "7L8RQ0Dv6M96oZIQcHMCjFcpNXmh8U29");
    echo "PostgreSQL підключення встановлено!";
} catch (PDOException $e) {
    echo "Помилка підключення: " . $e->getMessage();
}
?>
