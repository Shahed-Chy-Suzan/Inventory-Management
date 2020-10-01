<?php

use Illuminate\Support\Facades\Route;  //--Eita dile ar "route" er niche error er red-wave ta r show kore na.

// use Illuminate\Http\Request;

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });
//===================//=================//=================//==================//=================//=========



//---------------------For_JWT-------------------------
Route::group([

    'middleware' => 'api',
    'prefix' => 'auth'

], function ($router) {
                                                        //--JWT(auth)
    Route::post('login', 'AuthController@login');
    Route::post('signup', 'AuthController@signup');
    Route::post('logout', 'AuthController@logout');
    Route::post('refresh', 'AuthController@refresh');
    Route::post('me', 'AuthController@me');
});


//----------------------For_CRUD-----------------------------------
Route::apiResource('/employee','Api\EmployeeController');      //--Employee
Route::apiResource('/supplier','Api\SupplierController');      //--Supplier
Route::apiResource('/category','Api\CategoryController');      //--Category
Route::apiResource('/product','Api\ProductController');        //--Product
Route::apiResource('/expense','Api\ExpenseController');        //--Expense
Route::apiResource('/Customer','Api\CustomerController');      //--Customer


Route::Post('/salary/paid/{id}','Api\SalaryController@Paid');      //--Salary_routes
Route::Get('/salary','Api\SalaryController@AllSalary');
Route::Get('/salary/view/{id}','Api\SalaryController@ViewSalary');
Route::Get('/edit/salary/{id}','Api\SalaryController@EditSalary');
Route::Post('/salary/update/{id}','Api\SalaryController@SalaryUpdate');
Route::Post('/stock/update/{id}','Api\SalaryController@StockUpdate');

Route::get('/getting/product/{id}','Api\PosController@GetProduct');     //--POS

Route::get('/addTocart/{id}','Api\CartController@AddToCart');   //--Cart
Route::get('/cart/product','Api\CartController@CartProduct');
Route::get('/remove/cart/{id}','Api\CartController@removeCart');
Route::get('/increment/{id}','Api\CartController@Increment');
Route::get('/decrement/{id}','Api\CartController@Decrement');
Route::get('/vats','Api\CartController@Vats');                 //--Vat

Route::post('/orderdone','Api\PosController@OrderDone');      //--Order_Done

Route::get('/orders','Api\OrderController@TodayOrder');
Route::get('/order/details/{id}','Api\OrderController@OrderDetails');
Route::get('/order/orderdetails/{id}','Api\OrderController@OrderDetailsAll');
Route::post('/search/order/','Api\OrderController@SearchOrderDate');           //--SearchByDate
Route::post('/search/month/','Api\OrderController@SearchMonth');

//--home_component-----
Route::get('/today/sell','Api\PosController@TodaySell');
Route::get('/today/income','Api\PosController@TodayIncome');
Route::get('/today/due','Api\PosController@TodayDue');
Route::get('/today/expense','Api\PosController@TodayExpense');
Route::get('/stockout','Api\PosController@Stockout');

