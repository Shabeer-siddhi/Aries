<?php

namespace App\Livewire\Admin\User;

use Livewire\Component;

class UserIndex extends Component
{
    public function render()
    {
        return view('livewire.admin.user.user-index')->extends('admin.layouts.app');
    }
}
