<?php
require 'db.php';

header('Content-Type: application/json');

// Input Parameters
$latitude = isset($_GET['latitude']) ? (float) $_GET['latitude'] : null;
$longitude = isset($_GET['longitude']) ? (float) $_GET['longitude'] : null;
$radius = isset($_GET['radius']) ? (float) $_GET['radius'] : 10; // Default: 10 km
$network_ids = isset($_GET['networks']) ? explode(',', $_GET['networks']) : [];

// Validate Input
if (!$latitude || !$longitude) {
    echo json_encode(['error' => 'Latitude and longitude are required']);
    exit;
}

// Haversine Formula for Geolocation Search
$earth_radius = 6371; // Earth's radius in km
$lat_min = $latitude - rad2deg($radius / $earth_radius);
$lat_max = $latitude + rad2deg($radius / $earth_radius);
$lng_min = $longitude - rad2deg($radius / $earth_radius / cos(deg2rad($latitude)));
$lng_max = $longitude + rad2deg($radius / $earth_radius / cos(deg2rad($latitude)));

$db->where('latitude', [$lat_min, $lat_max], 'BETWEEN');
$db->where('longitude', [$lng_min, $lng_max], 'BETWEEN');

// If filtering by alumni networks
if (!empty($network_ids)) {
    $db->join('tbl_user_networks un', 'un.user_id = tbl_users.id', 'INNER');
    $db->where('un.network_id', $network_ids, 'IN');
}

$users = $db->get('tbl_users', null, 'tbl_users.id, tbl_users.name, tbl_users.email, tbl_users.latitude, tbl_users.longitude, tbl_users.created_at');

// Response
if ($users) {
    echo json_encode(['success' => true, 'alumni' => $users]);
} else {
    echo json_encode(['success' => false, 'message' => 'No alumni found']);
}
?>
