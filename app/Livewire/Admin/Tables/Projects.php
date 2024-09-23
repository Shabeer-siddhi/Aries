<?php

namespace App\Livewire\Admin\Tables;

use App\Models\Projects\Project;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use PowerComponents\LivewirePowerGrid\Button;
use PowerComponents\LivewirePowerGrid\Column;
use PowerComponents\LivewirePowerGrid\Exportable;
use PowerComponents\LivewirePowerGrid\Facades\Filter;
use PowerComponents\LivewirePowerGrid\Facades\Rule;
use PowerComponents\LivewirePowerGrid\Footer;
use PowerComponents\LivewirePowerGrid\Header;
use PowerComponents\LivewirePowerGrid\PowerGrid;
use PowerComponents\LivewirePowerGrid\PowerGridFields;
use PowerComponents\LivewirePowerGrid\PowerGridComponent;

final class Projects extends PowerGridComponent
{
    public function setUp(): array
    {
        return [
            Header::make()->showSearchInput(),
            Footer::make()
                ->showPerPage()
                ->showRecordCount(),
        ];
    }

    public function datasource(): Collection
    {
        // return Project::query();

        $user_id = Auth::user()->id;

        return Project::where(function ($query) use ($user_id) {
            // Check if user is the owner or an authorized user
            $query->where('user_id', $user_id) // Project owner check
                ->orWhereHas('users', function ($q) use ($user_id) { // Shared project user check
                    $q->where('user_id', $user_id);
                });
        })->with([
            'users',
            'owner',
            'tasks'
        ])->get();


        // return auth()->user()->projects()->with('tasks')->get();
    }

    public function fields(): PowerGridFields
    {
        return PowerGrid::fields()
            ->add('id')
            ->add('name')
            ->add('name')
            ->add('total_time')
            ->add('name_lower', fn(Project $model) => strtolower(e($model->name)))
            ->add('owner', fn(Project $model) => ucfirst(e($model->owner->name)))
            ->add('tasks', fn(Project $model) => ucfirst(e($model->tasks()->count())))
            ->add('created_at')
            ->add('created_at_formatted', fn(Project $model) => Carbon::parse($model->created_at)->format('d/m/Y H:i:s'));
    }

    public function columns(): array
    {
        return [
            Column::make('ID', 'id')
                ->searchable()
                ->sortable(),

            Column::make('Name', 'name')
                ->searchable()
                ->sortable(),

            Column::make('Owner', 'owner')
                ->searchable()
                ->sortable(),

            Column::make('No:of tasks', 'tasks')
                ->sortable(),
                
            Column::make('Total Time', 'total_time')
                ->sortable(),

            Column::make('Created at', 'created_at')
                ->hidden(),

            Column::make('Created at', 'created_at_formatted', 'created_at')
                ->searchable(),

            Column::action('Action')
        ];
    }

    public function filters(): array
    {
        return [
            // Filter::inputText('name'),
            // Filter::datepicker('created_at_formatted', 'created_at'),
        ];
    }

    #[\Livewire\Attributes\On('delete')]
    public function delete($project_id): void
    {
        $project = Project::findOrFail($project_id);
        $this->authorize('delete', $project);
        $project->tasks()->delete();
        $project->users()->detach();
        $project->delete();
    }

    public function actions(Project $row): array
    {
        return [
            Button::add('edit')
                ->slot('Edit')
                ->class('btn btn-secondary')
                ->route('admin.projects.edit', ['project' => $row]),

            Button::add('view')
                ->slot('View')
                ->class('btn btn-warning')
                ->route('admin.projects.show', ['project' => $row]),

            Button::add('delete')
                ->slot('Delete')
                ->class('btn btn-primary')
                ->confirm('Are you sure you want to delete this project?')
                ->dispatch('delete', ['project_id' => $row->id]),
        ];
    }


    public function actionRules(Project $row): array
    {
        return [
            Rule::button('edit')
                ->when(fn($row) => $row->user_id !== Auth::user()->id)
                ->hide(),

            Rule::button('delete')
                ->when(fn($row) => $row->user_id !== Auth::user()->id)
                ->hide(),
        ];
    }
}
