<div>
    <div class="row">
        <div class="col-12">
            <h1 class="text-capitalize">Customers</h1>
            <nav class="breadcrumb-container d-none d-sm-block d-lg-inline-block" aria-label="breadcrumb">
                <ol class="breadcrumb pt-0">
                    <li class="breadcrumb-item">
                        <a href="{{ route('admin.dashboard') }}">Dashboard</a>
                    </li>
                    <li class="breadcrumb-item">
                        <a href="{{ route('admin.users.index') }}">Customers</a>
                    </li>
                    <li class="breadcrumb-item text-capitalize active" aria-current="page">Edit Customer</li>
                </ol>
            </nav>
            <div class="separator mb-5"></div>
        </div>
    </div>

    <div class="row">
        <div class="col-12">



            <form wire:submit.prevent="save" method="POST">
                @csrf
                <div class="row">
                    <div class="col-12 col-md-12 col-xl-8 col-left">
                        <div class="card mb-4">
                            <div class="card-body">
                                <x-admin.livewire.input name="user.name" text="Name" isRequired />
                                <x-admin.livewire.input name="user.email" text="Email" type="email" isRequired />
                                <x-admin.livewire.input name="password" text="Password" type="password" />
                                <x-admin.livewire.input name="password_confirmation" text="Confirm Password"
                                    type="password" />

                            </div>
                        </div>
                    </div>

                    <div class="col-12 col-md-12 col-xl-4 col-right">
                        <div class="card mb-4">
                            <div class="card-body">
                                <div class="action-butns">
                                    <button type="submit" class="btn btn-primary mb-4 w-100">Update</button>
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Status:</label>
                                    <div wire:ignore>
                                        <select name="user.status" wire:model="user.status"
                                            class="form-control mb-3">
                                            <option value="1">Active</option>
                                            <option value="0">Inactive</option>
                                        </select>
                                    </div>
                                </div>


                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
