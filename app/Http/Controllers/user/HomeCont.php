<?php

namespace App\Http\Controllers\user;

use Illuminate\Http\Request;
use App\Model\User\Post;
use App\Model\User\Category;
use App\Model\User\Tag;
use App\Http\Controllers\Controller;


class HomeCont extends Controller
{
    
    public function index(){

    	$posts=Post::where('status',1)->orderBy('created_at','DESC')->paginate(4);
    	return view('user.blog',compact('posts'));
    }

    public function tag(tag $tag){

        $posts= $tag->posts();
        return view('user.blog',compact('posts'));
    	
    }

    public function category(category $category){

    	$posts= $category->posts();
    	return view('user.blog',compact('posts'));
    }
}
