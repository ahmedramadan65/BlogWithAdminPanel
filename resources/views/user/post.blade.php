@extends('user/app')
@section('bg-img',Storage::disk('local')->url($post->image))
@section('title',$post->title)
@section('sub-title',$post->suptitle)
@section('mainContent')
<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v3.3&appId=655999631530220&autoLogAppEvents=1"></script>
<article>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <small>Created at {{$post->created_at->diffForHumans()}}</small>
            @foreach($post->categories as $category)
              <small style="float: right;margin-right: 10px" >
                <a href="{{ route('category',$category->slug) }}">{{$category->name}}</a>
              </small>
            @endforeach
          <br>
          {!! htmlspecialchars_decode($post->body) !!}
          <h3>Tag Clouds</h3>
          @foreach($post->tags as $tag)
              <small style="margin-right: 10px" >
                 <a href="{{ route('tag',$tag->slug) }}">{{$tag->name}}</a>
              </small>
          @endforeach
        </div>
      </div>
      <div class="fb-comments" data-href="{{Request::url()}}" data-width="" data-numposts="4">  
      </div>
    </div>
  </article>

  <hr>
@endsection  