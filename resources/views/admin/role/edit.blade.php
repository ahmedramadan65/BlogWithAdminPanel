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
              <h3 class="box-title">Edit Role</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            @include('includes.messages')
            <form role="form" action="{{route('role.update',$role->id)}}" method="post" >
              {{csrf_field()}}
              {{method_field('PUT')}}
              <div class="box-body">
                <div class="col-md-6 col-md-offset-3">
                  <div class="form-group">
                    <label for="name">Role Name</label>
                    <input type="text" class="form-control" id="name" placeholder="Enter Role Name"name="name" value="@if(old('name')){{old('name')}}@else {{$role->name}}@endif">
                  </div>
                  <div class="row">
                    <div class="col-md-4">
                      <label for="name">Posts Permissions</label>
                      @foreach($permissions as $permission)
                        @if($permission->for == 'post')
                          <div class="checkbox">
                            <label><input type="checkbox" name="permission[]" value="{{$permission->id}}"
                              @foreach ($role->permissions as $role_permit)
                                @if ($role_permit->id == $permission->id)
                                  checked
                                @endif
                              @endforeach
                              >{{$permission->name}}</label>
                          </div>
                        @endif
                      @endforeach
                    </div>

                    <div class="col-md-4">
                      <label for="name">User Permissions</label>
                      @foreach($permissions as $permission)
                        @if($permission->for == 'user')
                          <div class="checkbox">
                            <label><input type="checkbox" name="permission[]" value="{{$permission->id}}"
                              @foreach ($role->permissions as $role_permit)
                                @if ($role_permit->id == $permission->id)
                                  checked
                                @endif
                              @endforeach
                              >{{$permission->name}}</label>
                          </div>
                        @endif
                      @endforeach
                    </div>

                    <div class="col-md-4">
                      <label for="name">Other Permissions</label>
                      @foreach($permissions as $permission)
                        @if($permission->for == 'other')
                          <div class="checkbox">
                            <label><input type="checkbox" name="permission[]" value="{{$permission->id}}"
                              @foreach ($role->permissions as $role_permit)
                                @if ($role_permit->id == $permission->id)
                                  checked
                                @endif
                              @endforeach
                              >{{$permission->name}}</label>
                          </div>
                        @endif
                      @endforeach
                    </div>
                  </div>

                  <div class="form-group">
                	<button type="submit" class="btn btn-primary">Submit</button>
                  <a href="{{route('role.index')}}" class="btn btn-warning">back</a>
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