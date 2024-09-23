@extends('admin.layouts.auth',['body_class'=>'background show-spinner no-footer','title'=>'Reset Password'])
@section('content')
    <div class="container">
        <div class="row h-100">
            <div class="col-12 col-md-10 mx-auto my-auto">
                <div class="card auth-card">
                    <div class="position-relative image-side ">
                        <p class=" text-white h2">MAGIC IS IN THE DETAILS</p>
                        <p class="white mb-0">
                            Please use your e-mail to reset your password.
                            <br>If you know your password, please
                            <a href="{{ route('login') }}" class="white">Login</a>.
                        </p>
                    </div>
                    <div class="form-side">
                        {{-- <a href="{{ route('home') }}">
                            <span class="logo-single"></span>
                        </a> --}}
                        <h6 class="mb-4">Reset Password</h6>
                        <x-status />
                        <x-errors />
                        <form action="{{ route('password.update') }}" method="POST">
                            @csrf
                            <input type="hidden" name="token" value="{{ request()->route('token') }}">
                            <label class="form-group has-float-label mb-4">
                                <input type="email" name="email" required="" class="form-control" />
                                <span>E-mail</span>
                            </label>
                            <label class="form-group has-float-label mb-4">
                                <input type="password" name="password" required="" class="form-control" />
                                <span>Password</span>
                            </label>
                            <label class="form-group has-float-label mb-4">
                                <input type="password" name="password_confirmation" required="" class="form-control" />
                                <span>Confirm Password</span>
                            </label>

                            <div class="d-flex justify-content-end align-items-center">
                                <button class="btn btn-primary btn-lg btn-shadow" type="submit">RESET</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

{{-- @extends('layouts.auth',['body_class'=>'background show-spinner no-footer'])
@section('content')
    <div>

        <div class="login_wrapper">
            <div class="animate form login_form">
                <section class="login_content">

                    <x-status />
                    <x-errors />

                    <form action="{{ route('password.update') }}" method="POST">
                        @csrf
                        <input type="hidden" name="token" value="{{ request()->route('token') }}">
                        <h1></h1>
                        <div>
                            <input type="email" name="email" class="form-control" placeholder="Email" required="" />
                        </div>
                        <div>
                            <input type="password" name="password" class="form-control" placeholder="Password"
                                required="" />
                        </div>
                        <div>
                            <input type="password" name="password_confirmation" class="form-control"
                                placeholder="Confirm Password" required="" />
                        </div>
                        <div>
                            <button class="btn btn-primary submit" type="submit">Submit</button>
                            <a class="reset_pass" href="{{ route('login') }}">Login</a>
                        </div>

                        <div class="clearfix"></div>

                        <div class="separator">
                            <div class="clearfix"></div>
                            <br />
                            <div>
                                <h1> EPG Hotels & Resorts</h1>
                                <p>©2016 All Rights Reserved. EPG Hotels & Resorts</p>
                            </div>
                        </div>
                    </form>
                </section>
            </div>

        </div>
    </div>
@endsection --}}
