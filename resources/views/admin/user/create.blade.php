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
              <h3 class="box-title">ADD Admin</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            @include('includes.messages')
            <form role="form" action="{{route('user.store')}}" method="post" >
              {{csrf_field()}}
              <div class="box-body">
                <div class="col-md-6 col-md-offset-3">
                  <div class="form-group">
                    <label for="name">admin username</label>
                    <input type="text" class="form-control" id="name" placeholder="Enter name Title"name="name" value="{{old('name')}}">
                  </div>
                  <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" id="email" placeholder="Enter email" name="email" value="{{old('email')}}">
                  </div>

                  <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" id="password" placeholder="Enter Password" name="password" value="{{old('password')}}">
                  </div>

                  <div class="form-group">
                    <label for="password_confirmation">Confirm Password</label>
                    <input type="password" class="form-control" id="password_confirmation" placeholder="Confirm Password" name="password_confirmation" value="{{old('password_confirmation')}}">
                  </div>
                  <div class="form-group">
                    <label for="phone">Phone Number</label>
                    <input type="text" class="form-control" id="phone" placeholder="Enter phone number" name="phone" value="{{old('phone')}}">
                  </div>
                  <div class="form-group">
                    <label for="Status">Status</label>
                    <div class="checkbox">
                    <label><input type="checkbox" name="status" value="1"
                      @if (old('status') == 1 ) checked  @endif 
                      >Status</label>
                  </div>
                  </div>
                  <div class="form-group">
                    <label for="role">Assign Roles</label>
                    <div class="row">
                      @foreach($roles as $role)
                        <div class="col-md-3">
                          <div class="checkbox">
                            <label><input type="checkbox" name="role[]" value="{{$role->id}}">{{$role->name}}</label>
                          </div>
                        </div>
                      @endforeach
                    </div>
                  </div>

                  <div class="form-group">
                  <button type="submit" class="btn btn-primary">Submit</button>
                  <a href="{{route('user.index')}}" class="btn btn-warning">back</a>
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