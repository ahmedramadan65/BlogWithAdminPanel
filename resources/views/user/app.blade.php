<!DOCTYPE html>
<html lang="en">

<head>

  @include('user/layout/head')

</head>

<body>

    @include('user/layout/header')

  <!-- Main Content -->
  @yield('mainContent')
    

  @include('user/layout/footer')


</body>

</html>