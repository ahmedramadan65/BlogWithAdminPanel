<?php

namespace App\Http\Controllers\admin;

use Illuminate\Http\Request;
use App\Model\Admin\Admin;
use App\Model\Admin\Role;
use App\Http\Controllers\Controller;

class UserCont extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function __construct(){

        $this->middleware('can:users.superAdmin');
    }

    public function index()
    {   
        $users = Admin::all();
        return view('admin.user.show',compact('users'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {   
        $roles= Role::all();
        return view('admin.user.create',compact('roles'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request,[
            'name'=>'required|string|max:255',
            'email'=>'required|string|max:255|email|unique:admins',
            'phone'=>'required|numeric',
            'password'=>'required|string|min:8|confirmed'
        ]);
        $request->status ? : $request['status'] = 0;
        $request['password'] = bcrypt($request->password);
        $user=Admin::create($request->all());
        $user->roles()->sync($request->role);
        return redirect( route('user.index') );
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $user = Admin::where('id',$id)->first();
        $roles= Role::all();
        return view('admin.user.edit',compact('user','roles'));
    }
    

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $this->validate($request,[
            'name'=>'required|string|max:255',
            'email'=>'required|string|max:255|email',
            'phone'=>'required|numeric',
        ]);
        $request->status ? : $request['status'] = 0;
        $user=Admin::where('id',$id)->update($request->except('_token','_method','role'));
        Admin::find($id)->roles()->sync($request->role);
        return redirect( route('user.index') )->with('message','Permission updated successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        Admin::where('id',$id)->delete();
        return redirect()->back()->with('message','Permission deleted successfully');
    }
}
