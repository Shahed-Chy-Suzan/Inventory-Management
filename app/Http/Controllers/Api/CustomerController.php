<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DB;
use Image;
use App\Models\Customer;

class CustomerController extends Controller
{

//-----------------index----------------------------------------------------
    public function index()
    {
        $customer=DB::table('customers')->orderBy('id','DESC')->get();
        return response()->json($customer);
    }

//------------------Insert/Store--------------------------------------------
    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'name' => 'required|max:255',
            'address' => 'required',
            'phone' => 'required|unique:customers',
        ]);

        if($request->photo){
            $position = strpos($request->photo, ';');
            $sub=substr($request->photo, 0 ,$position);
            $ext=explode('/', $sub)[1];
            $name=time().".".$ext;
            $img=Image::make($request->photo)->resize(240,200);
            $upload_path='backend/customer/';
            $image_url=$upload_path.$name;
            $img->save($image_url);

            $customer = new Customer;
            $customer->name = $request->name;
            $customer->email = $request->email;
            $customer->phone = $request->phone;
            $customer->address = $request->address;
            $customer->photo =  $image_url;
            $customer->save();
        }else{
            $customer = new Customer;
            $customer->name = $request->name;
            $customer->email = $request->email;
            $customer->phone = $request->phone;
            $customer->address = $request->address;
            $customer->save();
        }
    }


//----------------------------Show(id)-------------------------------------------
    public function show($id)
    {
        $customer=DB::table('customers')->where('id',$id)->first();
        return response()->json($customer);
    }

//---------------------------Edit/Update----------------------------------------
    public function update(Request $request, $id)
    {
        $validatedData = $request->validate([
            'name' => 'required|max:255',
            'address' => 'required',
            'phone' => 'required',
        ]);

        $data=array();
        $data['name']=$request->name;
        $data['email']=$request->email;
        $data['phone']=$request->phone;
        $data['address']=$request->address;
        $image=$request->newphoto;
        if ($image) {
            $position = strpos($image, ';');
            $sub=substr($image, 0 ,$position);
            $ext=explode('/', $sub)[1];
            $name=time().".".$ext;
            $img=Image::make($image)->resize(240,200);
            $upload_path='backend/customer/';
            $image_url=$upload_path.$name;
            $success=$img->save($image_url);
            if  ($success) {
                $data['photo']=$image_url;
                $img=DB::table('customers')->where('id',$id)->first();
                $image_path = $img->photo;
                //$done=unlink($image_path);
                if($image_path){
                    $done=unlink($image_path);
                }
                $user=DB::table('customers')->where('id',$id)->update($data);
            }
        }else{
            $oldlogo=$request->photo;
            $data['photo']=$oldlogo;
            DB::table('customers')->where('id',$id)->update($data);

        }
    }

//---------------------------Delete--------------------------------------------
    public function destroy($id)
    {
        $customer=DB::table('customers')->where('id',$id)->first();
        $photo=$customer->photo;
        if ($photo) {
            unlink($photo);
            DB::table('customers')->where('id',$id)->delete();
        }else{
            DB::table('customers')->where('id',$id)->delete();
        }
    }
}
