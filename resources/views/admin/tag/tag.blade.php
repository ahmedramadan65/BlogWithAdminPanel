@extends('admin.app')
@section('main-content')
	<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      @include('admin.layout.headpage')
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Forms</a></li>
        <li class="active">Editors</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-md-12">
          
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Tags</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            @include('includes.messages')
            <form role="form" action="{{route('tag.store')}}" method="post" >
              {{csrf_field()}}
              <div class="box-body">
                <div class="col-md-6 col-md-offset-3">
                  <div class="form-group">
                    <label for="name">Tag Title</label>
                    <input type="text" class="form-control" id="tag" placeholder="Enter Tag Title"name="name" value="{{old('name')}}">
                  </div>
                  <div class="form-group">
                    <label for="slug">Tag Slug</label>
                    <input type="text" class="form-control" id="slug" placeholder="Enter slug" name="slug" value="{{old('slug')}}">
                  </div>

                  <div class="form-group">
                	<button type="submit" class="btn btn-primary">Submit</button>
                  <a href="{{route('tag.index')}}" class="btn btn-warning">back</a>
              	  </div>
                </div>  
                
              </div>
              
              
            </form>
          </div>
          <!-- /.box -->

          
        </div>
        <!-- /.col-->
      </div>
      <!-- ./row -->
    </section>
    <!-- /.content -->
  </div>
@endsection