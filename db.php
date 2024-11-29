<?php
require 'vendor/autoload.php';

use MysqliDb as mysqli;

$db = new mysqli(['host' => 'localhost', 'username' => 'root', 'password' => '', 'db' => 'alumni_search', 'charset' => 'utf8mb4'
]);
?>
