<?php

namespace App\Livewire\Admin\Tables;

use App\Models\Projects\Task;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Carbon;
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
use Illuminate\Support\Str;
use Illuminate\View\View;

final class Tasks extends PowerGridComponent
{

    public string $project_id;

    public function setUp(): array
    {
        return [
            Header::make()->showSearchInput(),
            Footer::make()
                ->showPerPage()
                ->showRecordCount(),
        ];
    }

    public function datasource(): Builder
    {
        return Task::query()->where('project_id', $this->project_id);
    }

    public function fields(): PowerGridFields
    {
        return PowerGrid::fields()
            ->add('id')
            ->add('name')
            ->add('name_lower', fn(Task $model) => strtolower(e($model->name)))
            ->add('start_time')
            ->add('start_time_formatted', fn(Task $model) => $model->start_time ? Carbon::parse($model->start_time)->format('d/m/Y H:i:s') : '--')
            ->add('end_time')
            ->add('end_time_formatted', fn(Task $model) => $model->end_time ? Carbon::parse($model->end_time)->format('d/m/Y H:i:s') : '--')
            ->add('time_taken', function (Task $model) {
                if ($model->end_time && $model->start_time) {
                    $minutes = $model->total_time % 60;
                    $hours = intval($model->total_time / 60);
                    return $hours . ' ' . Str::plural("Hour", $hours) . ", " . $minutes . ' ' . Str::plural('Min', $minutes);
                }
                return "--";
            });
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

            Column::make('Start Time', 'start_time')
                ->hidden(),

            Column::make('Start Time', 'start_time_formatted', 'start_time')
                ->searchable(),

            Column::make('End Time', 'end_time')
                ->hidden(),

            Column::make('End Time', 'end_time_formatted', 'end_time')
                ->searchable(),

            Column::make('Time Taken', 'time_taken'),

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

    #[\Livewire\Attributes\On('start')]
    public function start($rowId): void
    {
        Task::where('id', $rowId)->update([
            'start_time' => Carbon::now()
        ]);
    }

    #[\Livewire\Attributes\On('delete')]
    public function delete($rowId): void
    {
        Task::where('id', $rowId)->delete();
    }

    #[\Livewire\Attributes\On('end')]
    public function end($rowId): void
    {
        $task = Task::findOrFail($rowId);
        $task->end_time = Carbon::now();
        $task->save();
    }

    public function actionsFromView($task): View
    {
        return view('admin.parts.task-action-view', ['task' => $task]);
    }
}
