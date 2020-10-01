<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Supplier;
use Illuminate\Http\Request;
use Image;
use DB;

class SupplierController extends Controller
{

//-----------------index------------------------------------------
    public function index()
    {
        $suppliers= Supplier::all();
        return response()->json($suppliers);
    }

//------------------Insert/Store----------------------------------
    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'name' => 'required',
            'email' => 'required',
            'phone' => 'required|unique:suppliers',
        ]);

        if($request->photo){
            $position = strpos($request->photo, ';');
            $sub=substr($request->photo, 0 ,$position);
            $ext=explode('/', $sub)[1];
            $name=time().".".$ext;
            $img=Image::make($request->photo)->resize(240,200);
            $upload_path='backend/supplier/';
            $image_url=$upload_path.$name;
            $img->save($image_url);

            $supplier = new Supplier;
            $supplier->name = $request->name;
            $supplier->email = $request->email;
            $supplier->phone = $request->phone;
            $supplier->address = $request->address;
            $supplier->shopname = $request->shopname;
            $supplier->photo =  $image_url;
            $supplier->save();
        }else{
            $supplier = new Supplier;
            $supplier->name = $request->name;
            $supplier->email = $request->email;
            $supplier->phone = $request->phone;
            $supplier->address = $request->address;
            $supplier->shopname = $request->shopname;
            $supplier->save();
        }
    }


//----------------------------Show(id)--------------------------------
    public function show($id)
    {
        $supplier=DB::table('suppliers')->where('id',$id)->first();
        return response()->json($supplier);
    }

//-----------------------Edit/Update----------------------------------
    public function update(Request $request, $id)
    {
        $data = array();
        $data['name']=$request->name;
        $data['email']=$request->email;
        $data['phone']=$request->phone;
        $data['address']=$request->address;
        $data['shopname']=$request->shopname;
        $image=$request->newphoto;
        if ($image) {
            $position = strpos($image, ';');
            $sub=substr($image, 0 ,$position);
            $ext=explode('/', $sub)[1];
            $name=time().".".$ext;
            $img=Image::make($image)->resize(240,200);
            $upload_path='backend/supplier/';
            $image_url=$upload_path.$name;
            $success=$img->save($image_url);
            if ($success) {
                $data['photo']=$image_url;
                $img=DB::table('suppliers')->where('id',$id)->first();
                $image_path = $img->photo;
                //$done=unlink($image_path);
                if($image_path){
                    $done=unlink($image_path);
                }
                $user=DB::table('suppliers')->where('id',$id)->update($data);
            }
        }else{
            $oldlogo=$request->photo;
            $data['photo']=$oldlogo;
            DB::table('suppliers')->where('id',$id)->update($data);
        }
    }

//---------------------------Delete-----------------------------------------
    public function destroy($id)
    {
        $supplier = DB::table('suppliers')->where('id',$id)->first();
        $photo = $supplier->photo;
        if ($photo) {
            unlink($photo);
            DB::table('suppliers')->where('id',$id)->delete();
        }else{
            DB::table('suppliers')->where('id',$id)->delete();
        }
    }
}
