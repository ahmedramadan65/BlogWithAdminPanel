<?php

namespace App\Http\Controllers\admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Model\User\Post;
use Illuminate\Support\Facades\Auth;
use App\Model\User\Tag;
use App\Model\User\Category;

class PostCont extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function __construct()
    {
        $this->middleware('auth:admin');
    }
    
    public function index()
    {   
        $posts = Post::all();
        return view('admin.post.show')->with('posts',$posts);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {   
        if (Auth::user()->can('posts.create')) {
            $tags = Tag::all();
            $categories = Category::all();
            return view('admin.post.post')->with('tags',$tags)->with('categories',$categories);
        }
        return redirect(route('admin.home'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request,[
            'title'=>'required',
            'subtitle'=>'required',
            'slug'=>'required',
            'body'=>'required',
            'image'=>'required'
        ]);

        if ($request->hasFile('image')){
            $imagepost=$request->image->store('public');
        }


        $post = new Post();
        $post->image = $imagepost;
        $post->title = $request->title;
        $post->suptitle = $request->subtitle;
        $post->slug = $request->slug;
        $post->body = $request->body;
        $post->status = $request->status;
        $post->save();

        $post->tags()->sync($request->tags);
        $post->categories()->sync($request->categories);

        return redirect(route('post.index'));
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {   
        if (Auth::user()->can('posts.update')) {
            $tags = Tag::all();
            $categories = Category::all();
            $post=Post::with('tags','categories')->where('id',$id)->first();
            return view('admin.post.edit')->with('post',$post)->with('tags',$tags)->with('categories',$categories);
        }
        return redirect(route('admin.home'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $this->validate($request,[
            'title'=>'required',
            'subtitle'=>'required',
            'slug'=>'required',
            'body'=>'required',
            'image'=>'required'
        ]);

        if ($request->hasFile('image')){
            $imagepost=$request->image->store('public');
        }

        if ($request->status == 'on'){
            $status=1;
        }
        
        $post = Post::find($id);
        $post->image = $imagepost;
        $post->title = $request->title;
        $post->suptitle = $request->subtitle;
        $post->slug = $request->slug;
        $post->body = $request->body;
        $post->status = $status;
        $post->tags()->sync($request->tags);
        $post->categories()->sync($request->categories);
        $post->update();
        return redirect(route('post.index'));

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        Post::where('id',$id)->delete();
        
        return redirect()->back()->with('message','Permission deleted successfully');
    
    }
}
