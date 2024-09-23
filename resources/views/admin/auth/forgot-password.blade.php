@extends('admin.layouts.auth',['body_class'=>'background show-spinner no-footer','title'=>'Forgot Password'])
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
                        <h6 class="mb-4">Forgot Password</h6>
                        <x-status />
                        <x-errors />
                        <form action="{{ route('password.request') }}" method="POST">
                            @csrf
                            <label class="form-group has-float-label mb-4">
                                <input type="email" name="email" required="" class="form-control" />
                                <span>E-mail</span>
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
