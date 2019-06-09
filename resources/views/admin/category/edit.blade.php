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
              <h3 class="box-title">Edit Category</h3>
            </div>
            <!-- /.box-header -->
            @include('includes.messages')
            <!-- form start -->
            <form role="form" action="{{route('category.update',$category->id)}}" method="post">
              {{csrf_field()}}
              {{method_field('PUT')}}
              <div class="box-body">
                <div class="col-md-6 col-md-offset-3">
                  <div class="form-group">
                    <label for="name">Category Title</label>
                    <input type="text" class="form-control" id="category" placeholder="Enter category Title" name="name" value="@if(old('name')){{old('name')}}@else{{$category->name}}@endif">
                  </div>
                  <div class="form-group">
                    <label for="slug">Category Slug</label>
                    <input type="text" class="form-control" id="slug" placeholder="Enter slug" name="slug" value="@if (old('slug')){{old('slug')}}@else{{$category->slug}}@endif">
                  </div>

                  <div class="form-group">
                  <button type="submit" class="btn btn-primary">Submit</button>
                  <a href="{{route('category.index')}}" class="btn btn-warning">back</a>
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