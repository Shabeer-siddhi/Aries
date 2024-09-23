@extends('admin.layouts.app')

@section('content')
    <div class="container-fluid">
        <div class="row">
            <div class="col-10">
                <div class="mb-2">
                    <h1>{{ $project->name }}</h1>
                    <p>{{ $project->description }}</p>
                </div>
            </div>



            <div class="col-2">
                <div class="mb-2">
                    <div class="top-right-button-container float-none">
                        <button type="button" class="btn btn-outline-primary btn-lg top-right-button  mr-1"
                            data-toggle="modal" data-backdrop="static" data-target="#exampleModal">ADD NEW</button>
                        <div class="modal fade modal-right" id="exampleModal" tabindex="-1" role="dialog"
                            aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Add New Task</h5>
                                        <button type="button" class="btn" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <form id="new_task" method="POST"
                                            action="{{ route('admin.projects.tasks.store', [
                                                'project' => $project->id,
                                            ]) }}">
                                            @csrf
                                            <div class="form-group">
                                                <label>Name</label>
                                                <input name="name" type="text" class="form-control" placeholder="" required>
                                            </div>
                                            <div class="form-group">
                                                <label>Description</label>
                                                <textarea name="description" class="form-control form-control-lg" columns="5" required></textarea>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-outline-primary"
                                            data-dismiss="modal">Cancel</button>
                                        <button type="button" id="new_task_button" class="btn btn-primary">Submit</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12">
                <div class="separator mb-5"></div>
                <livewire:admin.tables.tasks project_id="{{ $project->id }}" />
            </div>
        </div>
    </div>


    <div class="modal fade modal-right" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editModalLabel">Add New Task</h5>
                    <button type="button" class="btn" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="edit_task" method="POST"
                        action="{{ route('admin.projects.tasks.update', [
                            'project' => $project->id,
                            'task' => 1,
                        ]) }}">
                        @csrf
                        @method('PUT')

                        <div class="form-group">
                            <label>Name</label>
                            <input name="name" id="edit_task_name" type="text" class="form-control" placeholder="" required>
                        </div>
                        <div class="form-group">
                            <label>Description</label>
                            <textarea name="description" id="edit_task_description" class="form-control form-control-lg" columns="5" required></textarea>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Cancel</button>
                    <button type="button" id="edit_task_button" class="btn btn-primary">Submit</button>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('header')
    <style>
        .opacity-1 {
            opacity: 1 !important;
        }

        .form-group {
            margin-bottom: 10px;
        }
    </style>
@endpush

@push('footer')
    <script>
        $('#new_task_button').on('click', function() {
            $('#new_task').submit();
        });
        $('#edit_task_button').on('click', function() {
            $('#edit_task').submit();
        });

        $('#edit_task_row').on('click', function() {
            var taskId = $(this).data('task');                        
            var form = $('#edit_task');
            var currentAction = form.attr('action');
            var newAction = currentAction.replace(/\/tasks\/\d+/, '/tasks/' + taskId.id);
            form.attr('action', newAction);

            $('#edit_task_name').val(taskId.name);
            $('#edit_task_description').val(taskId.description);
            $('#editModal').modal('show')
        });

        function toggleEditForm(taskId) {
            const form = document.getElementById('edit-form-' + taskId);
            form.style.display = form.style.display === 'none' ? 'block' : 'none';
        }
    </script>
@endpush
