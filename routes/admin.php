<?php

use App\Http\Controllers\Admin\AdminDashboardController;
use App\Http\Controllers\Admin\Projects\ProjectController;
use App\Http\Controllers\Admin\Projects\TaskController;
use App\Livewire\Admin\User\UserEdit;
use App\Livewire\Admin\User\UserIndex;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Admin Routes
|--------------------------------------------------------------------------
|
| This file contains the routes used for the admin section. The routes are prefixed "admin"(defined in RouteServiceProvider).
|
*/



Route::middleware('admin')->group(function () {
    Route::get('/dashboard', [AdminDashboardController::class, 'index'])->name('dashboard');

    Route::prefix('users')->name('users.')->group(function () {
        Route::get('/', UserIndex::class)->name('index');
        Route::get('/edit/{user}', UserEdit::class)->name('edit');
    });

    Route::resource('projects', ProjectController::class);
    Route::resource('projects.tasks', TaskController::class);
});
