<?php 

namespace App\Controllers;

use App\Models\Blog;
use Symfony\Component\Routing\RouteCollection;

class BlogController
{
    // Show the product attributes based on the id.
	public function showAction(int $id, RouteCollection $routes)
	{
        $singleBlog = new Blog();
        $blog= $singleBlog->show($id);
        require_once APP_ROOT . '/views/front/blogs/singleBlog.php';
	}
}