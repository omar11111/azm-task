<?php

namespace App\Models;

require_once APP_ROOT . '/database/Database.php';
class Blog
{
    private $repository;
    // Columns
    public $id;
    public $title;
    public $description;
    public $image;
    public $updated_at;
    public $created_at;
    public $deleted_at;
    public $token;
    public $result;
    private $db;
    private $db_table = 'blogs';

    public $data = [];

    public function __construct()
    {
        $this->db =  new \Database;
    }

    public function index()
    {
        $start = 0;
        $contentPerPage = 3;

        $sqlQuery = "SELECT id, title, description, created_at FROM " . $this->db_table . "" . " WHERE deleted_at IS NULL ";
        $query1 = $this->db->query($sqlQuery);
        $pages = ceil($query1->num_rows / $contentPerPage);
        $this->data['pages'] = $pages;

        if (isset($_GET['page'])) {
            $page = $_GET['page'] - 1;
            $start = $page * $contentPerPage;
        }

        $sqlQuery = "SELECT id, title, description, created_at FROM " . $this->db_table . "" . " WHERE deleted_at IS NULL  Limit $start,$contentPerPage";
        $this->result = $this->db->query($sqlQuery);

        if ($this->result) {
            while ($row = $this->result->fetch_assoc()) {
                $this->data[] = $row; // Add each row to the array
            }
            // var_dump($this->result);
        } else {
            // Handle error
        }
        return $this->data;
    }

    public function show($id)
    {
        $sqlQuery = "SELECT * FROM
        " . $this->db_table . " WHERE id = " . $id . " And deleted_at IS NULL";
        $record = $this->db->query($sqlQuery);
        if ($record->num_rows == 0) {
            return false;
        }
        $this->result = $record->fetch_assoc();
        return $this->result;
    }

    public function create()
    {
    }

    public function store()
    {
        $title = htmlspecialchars(strip_tags($_POST['title']));
        $description = htmlspecialchars(strip_tags($_POST['description']));
        $created_at = date('Y-m-d H:i:s');
        $updated_at = date('Y-m-d H:i:s');
        $sqlQuery = "INSERT INTO " . $this->db_table . " SET 
        title = '" . $title . "',
        description = '" . $description . "',
        created_at = '" . $created_at . "',
        updated_at = '" . $updated_at . "'";
        $this->result= $this->db->query($sqlQuery);
        if ($this->result->affected_rows > 0) {
            return true;
        }
        return false;
    }
}



// UPDATE
