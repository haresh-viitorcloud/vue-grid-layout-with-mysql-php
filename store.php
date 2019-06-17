<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, PUT, POST, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type, Content-Range, Content-Disposition, Content-Description');
$request_body = file_get_contents('php://input');

$servername = "localhost";
$username = "root";
$password = "vc@123";
$dbname = "tempDB";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 

if(!empty($request_body)){

  $sql = "UPDATE vue_grid_layout set grid_json_data = '".$request_body."' where id = 1";
  if ($conn->query($sql) === TRUE) {
  } else {
      return json_encode("Error: " . $sql . "<br>" . $conn->error);
  }
}

$data = [];
$sql = "SELECT grid_json_data FROM vue_grid_layout";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
    while($data = $result->fetch_assoc()) { 
      
      echo json_encode($data['grid_json_data']);
    }
}
$conn->close();

?>