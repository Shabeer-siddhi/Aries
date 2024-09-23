@extends('admin.layouts.app')

@section('content')
    <div class="row">
        <div class="col-10">
            <div class="mb-2">
                <h1>Projects</h1>
            </div>
        </div>

        <div class="col-2">
            <div class="mb-2">
                <div class="top-right-button-container float-none">
                    <button type="button" class="btn btn-outline-primary btn-lg top-right-button  mr-1" data-toggle="modal"
                        data-backdrop="static" data-target="#exampleModal">ADD NEW</button>
                    <div class="modal fade modal-right" id="exampleModal" tabindex="-1" role="dialog"
                        aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Add New Project</h5>
                                    <button type="button" class="btn" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <form id="new_project" method="POST" action="{{ route('admin.projects.store') }}">
                                        @csrf
                                        <div class="form-group">
                                            <label>Name</label>
                                            <input name="name" type="text" class="form-control" placeholder=""
                                                required>
                                        </div>
                                        <div class="form-group">
                                            <label>Description</label>
                                            <textarea name="description" class="form-control form-control-lg" columns="5" required></textarea>
                                        </div>
                                        <div class="">
                                            <label>Shared Users</label>
                                            <select multiple name="users" class="form-control select2-multiple">
                                                {{-- <option value="" disabled selected>--Select user--</option> --}}
                                                @foreach ($users as $user)
                                                    <option value="{{ $user->id }}">{{ $user->name }}</option>
                                                @endforeach
                                            </select>
                                        </div>

                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-outline-primary"
                                        data-dismiss="modal">Cancel</button>
                                    <button type="button" id="new_project_button" class="btn btn-primary">Submit</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-12">
            <livewire:admin.tables.projects />
        </div>
    </div>
@endsection


@push('header')
    <style>
        .form-group {
            margin-bottom: 10px;
        }
        .select2-container{
            z-index: 999999;
        }
    </style>
@endpush

@push('footer')
    <script>
        $('#new_project_button').on('click', function() {
            $('#new_project').submit();
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
