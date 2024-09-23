<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ env('APP_NAME') }} - {{ $title ?? '' }}</title>

    <link rel="stylesheet" href="{{ asset('font/iconsmind-s/css/iconsminds.css') }}" />
    <link rel="stylesheet" href="{{ asset('font/simple-line-icons/css/simple-line-icons.css') }}" />
    {{-- <link rel="stylesheet" href="{{ asset('css/vendor/bootstrap.min.css') }}" /> --}}
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="{{ asset('css/vendor/bootstrap-float-label.min.css') }}" />
    <link rel="stylesheet" href="{{ asset('css/vendor/component-custom-switch.min.css') }}" />
    <link rel="stylesheet" href="{{ asset('css/vendor/perfect-scrollbar.css') }}" />
    <link rel="stylesheet" href="{{ asset('css/vendor/select2.min.css') }}" />
    <link rel="stylesheet" href="{{ asset('css/vendor/select2-bootstrap.min.css') }}" />
    @stack('header')

    @vite(['resources/css/app.css', 'resources/js/app.js'])

    <link rel="stylesheet" href="{{ asset('css/main.css') }}" />

    @livewireScripts()
    @livewireStyles()

</head>


<body class="menu-sub-hidden show-spinner rounded {{ $body_class ?? '' }}" id="{{ $body_id ?? 'app-container' }}">

    {{-- Navbar Start --}}
    @include('admin.parts.topnav')
    {{-- Navbar End --}}

    {{-- Sidenav Start --}}
    {{-- @include('parts.sidenav') --}}
    <x-side-nav />
    {{-- Sidenav End --}}

    {{-- Main Content Start --}}
    <main class="default-transition">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <x-status />
                    <x-errors-status />
                </div>
            </div>
        </div>
        @yield('content')
    </main>
    {{-- Main Content End --}}

    {{-- Footer Start --}}
    @include('admin.parts.footer')
    {{-- Footer End --}}

    {{-- Logout Form Start --}}
    <form action="{{ route('logout') }}" method="post" id="logoutForm">
        @csrf
    </form>
    {{-- Logout Form End --}}

    <script src="{{ asset('js/vendor/jquery-3.3.1.min.js') }}"></script>
    <script src="{{ asset('js/vendor/bootstrap.bundle.min.js') }}"></script>
    <script src="{{ asset('js/vendor/perfect-scrollbar.min.js') }}"></script>
    <script src="{{ asset('js/vendor/select2.full.js') }}"></script>
    <script src="{{ asset('js/dore.script.js') }}"></script>
    @stack('footer')
    <script src="{{ asset('js/scripts.js') }}"></script>
</body>

</html>
