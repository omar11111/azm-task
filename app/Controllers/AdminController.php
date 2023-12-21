<?php 

namespace App\Controllers;

use App\Models\Blog;
use Symfony\Component\Routing\RouteCollection;

class AdminController
{
    // Show the product attributes based on the id.
	public function create( RouteCollection $routes)
	{
        $singleBlog = new Blog();
        $blog= $singleBlog->store();
        require_once APP_ROOT . '/views/admin/blogs/create-blog.php';
	}
}