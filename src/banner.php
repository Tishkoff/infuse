<?php

$visitorIp = $_SERVER['REMOTE_ADDR'] ?? '';
$visitorAgent = $_SERVER['HTTP_USER_AGENT'] ?? '';
$visitorUrl = $_SERVER['HTTP_REFERER'] ?? '';

try {
    if ($visitorIp && $visitorAgent) {
        $mysqli = new mysqli('mysql', 'root', 'root', 'infuse');
        $stmt = $mysqli->prepare(
            <<<SQL
INSERT INTO `visitors` (`ip_address`, `user_agent`, `page_url`)
    VALUES (?, ?, ?)
    ON DUPLICATE KEY UPDATE `views_count` = `views_count` + 1;
SQL
        );
        $stmt->bind_param('sss', $visitorIp, $visitorAgent, $visitorUrl);
        $stmt->execute();
    }
} catch (Exception $ex) { }

$imagePath = './img/intro-1.jpg';
$fp = fopen($imagePath, 'rb');

header("Content-Type: image/jpeg");
header("Content-Length: " . filesize($imagePath));

fpassthru($fp);
exit;
