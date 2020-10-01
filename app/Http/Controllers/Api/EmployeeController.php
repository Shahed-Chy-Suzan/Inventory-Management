<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Employee;
use Image;
use DB;

class EmployeeController extends Controller
{

//-----------------index------------------------------------------
    public function index()
    {
        $employee= Employee::all();
        //$employee= DB::table('employee')->get();
        return response()->json($employee);
    }

//------------------Insert/Store------------------------------------
    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'name' => 'required|unique:employees|max:255',
            'email' => 'required',
            'phone' => 'required|unique:employees',
        ]);

        if($request->photo){
            $position = strpos($request->photo, ';');    //got index_position of ';' from string "data:image/jpeg;base6..."
            $sub = substr($request->photo, 0 ,$position);   //got the portion (data:image/jpeg;)
            $ext = explode('/', $sub)[1];                   //got our 'extention' (jpeg)
            $name = time().".".$ext;
            $img = Image::make($request->photo)->resize(240,200);
            $upload_path= 'backend/employee/';
            $image_url = $upload_path.$name;
            $img->save($image_url);

            $employee = new Employee;
            $employee->name = $request->name;
            $employee->email = $request->email;
            $employee->phone = $request->phone;
            $employee->address = $request->address;
            $employee->salary = $request->salary;
            $employee->nid = $request->nid;
            $employee->joining_date = $request->joining_date;
            $employee->photo =  $image_url;
            $employee->save();
        }else{
            $employee = new Employee;           //used 'eloquent'||Model 'Employee' er new instance
            $employee->name = $request->name;
            $employee->email = $request->email;
            $employee->phone = $request->phone;
            $employee->address = $request->address;
            $employee->salary = $request->salary;
            $employee->nid = $request->nid;
            $employee->joining_date = $request->joining_date;
            $employee->save();
        }
    }


//----------------------------Show(id)-------------------------------------------
    public function show($id)
    {
        $employee=DB::table('employees')->where('id',$id)->first();
        return response()->json($employee);
    }


//---------------------------Edit/Update----------------------------------------
    public function update(Request $request, $id)
    {
        $data = array();
        $data['name']=$request->name;
        $data['email']=$request->email;
        $data['phone']=$request->phone;
        $data['address']=$request->address;
        $data['salary']=$request->salary;
        $data['nid']=$request->nid;
        $data['joining_date']=$request->joining_date;
        $image=$request->newphoto;
        if ($image) {
            $position = strpos($image, ';');
            $sub=substr($image, 0 ,$position);
            $ext=explode('/', $sub)[1];
            $name=time().".".$ext;
            $img=Image::make($image)->resize(240,200);
            $upload_path='backend/employee/';
            $image_url=$upload_path.$name;
            $success=$img->save($image_url);
            if ($success) {
                $data['photo']=$image_url;
                $img=DB::table('employees')->where('id',$id)->first();
                $image_path = $img->photo;
                //$done=unlink($image_path);
                if($image_path){
                    $done=unlink($image_path);
                }
                $user=DB::table('employees')->where('id',$id)->update($data);
            }
        }else{
            $oldlogo=$request->photo;
            $data['photo']=$oldlogo;
            DB::table('employees')->where('id',$id)->update($data);
        }
    }


//---------------------------Delete--------------------------------------------
    public function destroy($id)
    {
        $employee = DB::table('employees')->where('id',$id)->first();
        $photo = $employee->photo;
        if ($photo) {
            unlink($photo);
            DB::table('employees')->where('id',$id)->delete();
        }else{
            DB::table('employees')->where('id',$id)->delete();
        }
    }
}
