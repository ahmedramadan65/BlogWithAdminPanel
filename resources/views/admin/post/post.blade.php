@extends('admin.app')

@section('headSection')
  <link rel="stylesheet" href="{{asset('admin/bower_components/select2/dist/css/select2.min.css')}}">

@endsection

@section('main-content')  
<!-- Content Wrapper. Contains page content -->
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
              <h3 class="box-title">Titles</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            @include('includes.messages')
            <form role="form" action="{{route('post.store')}}" method="post" enctype="multipart/form-data">
              {{csrf_field()}}
              <div class="box-body">
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="title">Post Title</label>
                    <input type="text" class="form-control" id="title" placeholder="Enter Title" name="title" value="{{old('title')}}">
                  </div>
                  <div class="form-group">
                    <label for="subtitle">Post SubTitle</label>
                    <input type="text" class="form-control" id="subtitle" placeholder="Enter SubTitle" name="subtitle" value="{{old('subtitle')}}">
                  </div>

                  <div class="form-group">
                    <label for="slug">Post Slug</label>
                    <input type="text" class="form-control" id="slug" placeholder="Enter Slug" name="slug" value="{{old('slug')}}">
                  </div>
                </div>  
                <div class="col-md-6">
                  <div class="form-group">
                    <div class="pull-right">
                      <label for="Image">Post Image</label>
                      <input type="file" name="image" id="image">

                      <p class="help-block">Example block-level help text here.</p>
                    </div> 
                    <div class="checkbox pull-left">
                    <label>
                      <input type="checkbox" name="status" value="1">Publish
                    </label>
                  </div>
                  </div>
                  <br>
                  <br>
                  <br>
                  <div class="form-group" >
                    <label>Select Tags</label>
                    <select class="form-control select2 select2-hidden-accessible" multiple="" data-placeholder="Select a State" style="width: 100%;" tabindex="-1" aria-hidden="true" name="tags[]">
                      @foreach($tags as $tag)
                        <option value="{{$tag->id}}">{{$tag->name}}</option>
                      @endforeach
                    </select>
                  </div>
                  <div class="form-group">
                    <label>Select Categories</label>
                    <select class="form-control select2 select2-hidden-accessible" multiple="" data-placeholder="Select a State" style="width: 100%;" tabindex="-1" aria-hidden="true" name="categories[]">
                      @foreach($categories as $category)
                        <option value="{{$category->id}}">{{$category->name}}</option>
                      @endforeach
                    </select>
                  </div>

                </div>
              </div>
              <!-- /.box-body -->
              <div class="box">
            <div class="box-header">
              <h3 class="box-title">Bootstrap WYSIHTML5
                <small>Simple and fast</small>
              </h3>
              <!-- tools box -->
              <div class="pull-right box-tools">
                <button type="button" class="btn btn-default btn-sm" data-widget="collapse" data-toggle="tooltip"
                        title="Collapse">
                  <i class="fa fa-minus"></i></button>
                
              </div>
              <!-- /. tools -->
            </div>
            <div class="box-body pad">
                <textarea name="body" style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;" id="editor1" value="{{old('body')}}">
                            
                </textarea>
            </div>
              </div>
              <div class="box-footer">
                <button type="submit" class="btn btn-primary">Submit</button>
                <a href="{{route('post.index')}}" class="btn btn-warning">back</a>
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
 
@section('mynewscripts')
  <script src="{{asset('admin/bower_components/select2/dist/js/select2.full.min.js')}}"></script>
  <script>
    $('.select2').select2()
  </script>
  <script src="{{asset('admin/bower_components/ckeditor/ckeditor.js')}}"></script>
  <script>
  $(function () {
    // Replace the <textarea id="editor1"> with a CKEditor
    // instance, using default configuration.
    CKEDITOR.replace('editor1')
    //bootstrap WYSIHTML5 - text editor
    $('.textarea').wysihtml5()
  })
</script>
@stop 