<!DOCTYPE html>
<html>
<head>
	@include('admin.layout.head')
</head>

<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		@include('admin.layout.header')

		@include('admin.layout.sidebar')
		
		@section('main-content')
			@show
	</div>	
	@include('admin.layout.footer')
	

</body>
</html>