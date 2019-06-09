<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

//user routes
Route::group(['namespace'=>'user'],function(){

	Route::get('/','HomeCont@index')->name('homepage');
	Route::get('/post/{post}','PostCont@post')->name('post');
	Route::get('/post/tag/{tag}','HomeCont@tag')->name('tag');
	Route::get('/post/category/{category}','HomeCont@category')->name('category');

});



//admin routes
Route::group(['namespace'=>'admin','prefix'=>'admin','middleware'=>'auth:admin'],function(){

	Route::get('/home','HomeCont@index')->name('admin.home');
	Route::resource('/post','PostCont');
	Route::resource('/tag','TagCont');
	Route::resource('/category','CategoryCont');
	Route::resource('/user','UserCont');
	Route::resource('/role','RoleCont');
	Route::resource('/permission','PermissionController');
	Route::post('/admin-logout','Auth\LoginController@logout')->name('admin.logout');
});

Route::get('admin/admin-login','admin\Auth\LoginController@showLoginForm')->name('admin.login');
Route::post('admin/admin-login','admin\Auth\LoginController@login')->name('admin.login');



Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');




//social logins
Route::get('auth/{service}', 'Auth\FacebookController@redirectToProvider');
Route::get('auth/{service}/callback', 'Auth\FacebookController@handleProviderCallback');





