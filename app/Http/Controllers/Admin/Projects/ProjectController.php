<?php

namespace App\Http\Controllers\Admin\Projects;

use App\Http\Controllers\Controller;
use App\Models\Projects\Project;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ProjectController extends Controller
{
    public function index()
    {
        $projects = auth()->user()->projects()->with('tasks')->get();
        $users = User::whereStatus(true)->whereNot('id', Auth::user()->id)->get();
        return view('admin.projects.index')->with(compact('projects', 'users'));
    }

    public function store(Request $request)
    {
        $project = auth()->user()->projects()->create([
            'name' => $request->name,
            'description' => $request->description,
            'user_id' => Auth::user()->id,
        ]);
        $project->users()->attach($request->users);
        session()->flash('status', 'Project successfully created.');
        return redirect()->back();
    }

    public function show(Project $project)
    {
        $this->authorize('view', $project);
        $project->load('tasks');
        return view('admin.projects.show')->with(compact('project'));
    }

    public function edit(Project $project)
    {
        $this->authorize('edit', $project);
        return response()->json($project->load('tasks'));
    }

    public function update(Request $request, Project $project)
    {
        $this->authorize('update', $project);
        $project->update($request->all());
        return response()->json($project);
    }

    public function destroy(Project $project)
    {
        $this->authorize('delete', $project);
        $project->delete();
        return response()->json(null, 204);
    }
}
