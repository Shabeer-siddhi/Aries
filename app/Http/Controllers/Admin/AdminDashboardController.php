<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Projects\Project;
use App\Models\Projects\Task;
use Illuminate\Http\Request;

class AdminDashboardController extends Controller
{
    function index()
    {
        $data = [
            'project_count' => Project::count(),
            'task_count' => Task::count(),
            'task_completed_count' => Task::whereCompleted(1)->count(),
            'task_pending_count' => Task::whereCompleted(0)->count(),
        ];

        return view('admin.dashboard')->with(compact('data'));
    }
}
