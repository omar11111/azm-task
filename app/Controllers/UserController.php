<?php 
$controller_file = 'controllers/front/' . $controller_name . '.php';
if (file_exists($controller_file)) {
    include($controller_file);
} else {
    // handle 404 error
}

?>