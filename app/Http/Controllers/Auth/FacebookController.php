<?php

namespace App\Http\Controllers\Auth;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User;
use Socialite;
use Exception;
use Auth;

class FacebookController extends Controller
{
     public function redirectToProvider($service)
    {
        return Socialite::driver($service)->redirect();
    }


    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function handleProviderCallback($service)
    {		
    		if($service == 'twitter'){
    			$userSocial = Socialite::driver($service)->user();
    		}else{
    			$userSocial = Socialite::driver($service)->stateless()->user();
    		}
            

            $findUser=User::where('email',$userSocial->email)->first();
            if ($findUser) {
            	Auth::login($findUser);
            	return redirect(route('homepage'));
            }else{
            	$user = new User;
	            $user->name = $userSocial->name;
	            $user->email = $userSocial->email;
	            $user->password = bcrypt(12345678);
	            $user->save();
	            Auth::login($user);
	            return redirect(route('homepage'));
            }
    }
}
