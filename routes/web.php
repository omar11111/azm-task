<?php 

use Symfony\Component\Routing\Route;
use Symfony\Component\Routing\RouteCollection;

// Routes system
$routes = new RouteCollection();
$routes->add('singleBlog', new Route(constant('URL_SUBFOLDER') . '/blog/{id}', array('controller' => 'BlogController', 'method'=>'showAction'), array('id' => '[0-9]+')));
$routes->add('blogs', new Route(constant('URL_SUBFOLDER') . '/', array('controller' => 'HomeController', 'method'=>'index')));
$routes->add('blog-create', new Route(constant('URL_SUBFOLDER') . '/admin/create-blog', array('controller' => 'AdminController', 'method'=>'create')));