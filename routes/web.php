<?php

use Illuminate\Support\Facades\Route;

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

Route::get('/', function () {
    return view('welcome');
});


Route::get('/{vue_capture?}',function () {    //--here,"vue_capture" is just a random_variable
    return view('welcome');                 //--if we hit with random route,it will go 'welcome' page
})->where('vue_capture', '[\/\w\.-]*');
