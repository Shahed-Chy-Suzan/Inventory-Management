<?php

namespace App\Http\Controllers\Api;

use App\Models\Category;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DB;

class CategoryController extends Controller
{

//-----------------index-------------------------------------------
    public function index()
    {
        $categories= Category::all();
        //DB::table('categories')->get();
        return response()->json($categories);
    }

//------------------Insert/Store------------------------------------
    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'category_name' => 'required|unique:categories|max:255',
        ]);

        $category = new Category;
        $category->category_name = $request->category_name;
        $category->save();

        //query builder
        // $data = array();
        // $data['category_name'] = $request->category_name;
        // DB::table('categories')->insert($data);
    }

//----------------------------Show(id)-----------------------------------
    public function show($id)
    {
        //query builder
        //$categoru=DB::table('categories')->where('id',$id)->first();
        $category=Category::findorfail($id);
        return response()->json($category);
    }

//---------------------------Edit/Update---------------------------------
    public function update(Request $request, $id)
    {
        $data = array();
        $data['category_name']=$request->category_name;
        DB::table('categories')->where('id',$id)->update($data);
        // $category=Category::findorfail($id);
        // $category->save();
    }

//---------------------------Delete--------------------------------------
    public function destroy($id)
    {
        DB::table('categories')->where('id',$id)->delete();
        // $category=Category::findorfail($id);
        // $category->delete();
    }
}
