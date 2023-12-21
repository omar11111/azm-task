<?php 

namespace App\Controllers;

use App\Models\Blog;
use Symfony\Component\Routing\RouteCollection;

class HomeController
{
    // Show the product attributes based on the id.
	public function index( RouteCollection $routes)
	{
        $blogs = new Blog();
        $blogs->index();
        $homeBlogs = $blogs->data;
        $pages = $homeBlogs['pages'];
       
        require_once APP_ROOT . '/views/front/blogs/blogs.php';
	}
}