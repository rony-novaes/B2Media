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
    return view('home');
});

Route::get('/login',[App\Http\Controllers\AuthController::class, 'loggedOneUser'])->name('login');

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');


Route::prefix('/sale')->group(function() {
    Route::post('/', [App\Http\Controllers\SalesController::class, 'sale']);
    Route::post('/product', [App\Http\Controllers\SalesController::class, 'product']);
});
