<div>

    @if ($task->completed == 1)
        <button disabled class="btn btn-outline-success">Completed &#9989;</button>
    @else
        <button id="edit_task_row" data-task="{{ $task }}" class="btn btn-dark">Edit &#128393;</button>
        @if ($task->start_time && !$task->end_time)
            <button wire:click="$dispatch('end', [{{ $task->id }}])" class="btn btn-primary">End &#9932;</button>
        @endif
        @if (!$task->start_time)
            <button class="btn btn-secondary" wire:click="$dispatch('start', [{{ $task->id }}])">Start
                &#9658;</button>
        @endif
    @endif
    <button wire:click="$dispatch('delete', [{{ $task->id }}])" class="btn btn-danger">Delete</button>
</div>
