@if ($errors->any())
    <div class="alert alert-danger">
        <ul class="m-0 p-0">
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif

@if (session()->has('error'))
    <div class="alert alert-danger">
        <p class="mb-0">{{ session('error') }}</p>
    </div>
@endif
