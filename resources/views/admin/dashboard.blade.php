@extends('admin.layouts.app', ['body_class' => '', 'title' => 'Dashboard'])
@section('content')
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <h1>Dashboard</h1>
                <div class="separator mb-5"></div>
            </div>
            <div class="col-lg-12 col-xl-12">
                <div class="icon-cards-row mb-4">
                    <div class="dashboard-numbers">
                        <div class="row no-gutters">
                            <div class="col-lg-3">
                                <a href="#" class="card">
                                    <div class="card-body text-center">
                                        <i class="simple-icon-layers"></i>
                                        <p class="card-text mb-0">Project</p>
                                        <p class="lead text-center">{{ $data['project_count'] }}</p>
                                    </div>
                                </a>
                            </div>
                            <div class="col-lg-3">
                                <a href="#" class="card">
                                    <div class="card-body text-center">
                                        <i class="simple-icon-list"></i>
                                        <p class="card-text mb-0">Total Tasks</p>
                                        <p class="lead text-center">{{ $data['task_count'] }}</p>
                                    </div>
                                </a>
                            </div>
                            <div class="col-lg-3">
                                <a href="#" class="card">
                                    <div class="card-body text-center">
                                        <i class="simple-icon-check"></i>
                                        <p class="card-text mb-0">Completed Tasks</p>
                                        <p class="lead text-center">{{ $data['task_completed_count'] }}</p>
                                    </div>
                                </a>
                            </div>
                            <div class="col-lg-3">
                                <a href="#" class="card">
                                    <div class="card-body text-center">
                                        <i class="simple-icon-exclamation"></i>
                                        <p class="card-text mb-0">Pending Tasks</p>
                                        <p class="lead text-center">{{ $data['task_pending_count'] }}</p>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
@endsection
