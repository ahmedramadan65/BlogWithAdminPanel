<?php

namespace App\Http\Controllers\user;

use Illuminate\Http\Request;
use App\Model\User\Post;
use App\Http\Controllers\Controller;

class PostCont extends Controller
{
    
    public function post(post $post){
    	return view('user.post',compact('post'));
    }

    
}
