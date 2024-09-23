@extends('admin.layouts.auth', ['body_class' => 'background show-spinner no-footer', 'title' => 'Login'])
@section('content')
    <div class="container">
        <div class="row h-100">
            <div class="col-12 col-md-10 mx-auto my-auto">
                <div class="card auth-card">
                    <div class="position-relative image-side ">

                        <p class=" text-white h2">MAGIC IS IN THE DETAILS</p>

                        <p class="white mb-0">
                            Please use your credentials to login.
                        </p>
                    </div>
                    <div class="form-side">
                        {{-- <a href="{{ route('home') }}">
                            <span class="logo-single"></span>
                        </a> --}}
                        <h6 class="mb-4">Login</h6>

                        <x-status />
                        <x-errors />

                        <form action="{{ route('login') }}" method="POST" id="login-form">
                            @csrf
                            <label class="form-group has-float-label mb-4">
                                <input type="email" name="email" class="form-control" required="" />
                                <span>E-mail</span>
                            </label>

                            <label class="form-group has-float-label mb-4">
                                <input class="form-control" name="password" type="password" placeholder="" required="" />
                                <span>Password</span>
                            </label>

                            {{-- {!! NoCaptcha::display() !!} --}}
                            <div class="alert alert-danger mb-2" style="display: none" role="alert" id="captcha-error">
                                Please complete the captcha.
                            </div>

                            <div class="d-flex justify-content-between align-items-center">
                                <a href="{{ route('password.request') }}">Forget password?</a>
                                <button class="btn btn-primary btn-lg btn-shadow" type="submit">LOGIN</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
@push('header')
    {{-- {!! NoCaptcha::renderJs() !!} --}}
@endpush
@push('footer')
    {{-- <script>
        $('#login-form').on('submit', function(e) {
            $('#captcha-error').hide();
            if (grecaptcha.getResponse() == "") {
                $('#captcha-error').show();
                e.preventDefault();
            }
        });
    </script> --}}
@endpush
