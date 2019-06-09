<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>{{Auth::user()->name}}</p>
        </div>
      </div>
      <!-- search form -->
      
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">MAIN NAVIGATION</li>
        <li class="active treeview menu-open">
          <a href="{{ route('admin.home') }}">
            <i class="fa fa-dashboard"></i> <span>Blog</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li class="active"><a href="{{route('post.index')}}"><i class="fa fa-circle-o"></i>Posts</a></li>
            @can('posts.category',Auth::user())
            <li><a href="{{route('category.index')}}"><i class="fa fa-circle-o"></i>Categories</a></li>
            @endcan
            @can('posts.tag',Auth::user())
            <li><a href="{{route('tag.index')}}"><i class="fa fa-circle-o"></i>Tags</a></li>
            @endcan
            @can('users.superAdmin')
            <li><a href="{{route('user.index')}}"><i class="fa fa-circle-o"></i>Users</a></li>
            <li><a href="{{route('role.index')}}"><i class="fa fa-circle-o"></i>Roles</a></li>
            <li><a href="{{route('permission.index')}}"><i class="fa fa-circle-o"></i>Permissions</a></li>
            @endcan
          </ul>
        </li>
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>
