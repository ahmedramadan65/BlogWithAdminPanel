<?php

namespace App\Http\Controllers\admin\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Model\Admin\Admin;
use Illuminate\Foundation\Auth\AuthenticatesUsers;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = 'admin/home';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest:admin')->except('logout');
    }
    public function showLoginForm()
    {
        return view('admin.login');
    }

    public function login(Request $request)
    {
        $this->validateLogin($request);

        // If the class is using the ThrottlesLogins trait, we can automatically throttle
        // the login attempts for this application. We'll key this by the username and
        // the IP address of the client making these requests into this application.
        

        if ($this->attemptLogin($request)) {
            return $this->sendLoginResponse($request);
        }

        

        return $this->sendFailedLoginResponse($request);
    }

    protected function guard()
    {
        return Auth::guard('admin');
    }

    public function logout(Request $request)
    {
        $this->guard()->logout();

        $request->session()->invalidate();

        return $this->loggedOut($request) ?: redirect('/');
    }

    protected function credentials(Request $request)
    {   
        //kol el klam da ry7 le el fun de 
        //$this->sendFailedLoginResponse($request);
        $admin=Admin::where('email',$request->email)->first();
        if (count($admin)) {
            if ($admin->status == 0) {
            return ['email'=>'inactive','password'=>'You Are Not Active,Please Contact Admin To login'];
            }else{
            return ['email'=>$request->email,'password'=>$request->password,'status'=>1];
            }
        }        
        return $request->only($this->username(), 'password');
    }
}
