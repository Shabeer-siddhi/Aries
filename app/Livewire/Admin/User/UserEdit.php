<?php

namespace App\Livewire\Admin\User;

use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Livewire\Component;
use Illuminate\Validation\Rule;


class UserEdit extends Component
{

    public $user;
    public $password;
    public $password_confirmation;

    public function mount(User $user)
    {
        $this->user = $user;
    }

    public function rules()
    {
        return [
            'user.name' => 'required',
            'user.status' => 'required',
            'user.email' => [
                'required',
                Rule::unique('users', 'email')->ignore($this->user->id),
            ],
            'password' => 'nullable|confirmed',
            'password_confirmation' => 'nullable|required_with:password|same:password|min:6'
        ];
    }

    protected $messages = [
        'password_confirmation.required_with' => "Please confirm your password",
        'password_confirmation.same' => "The password you entered does not match",
    ];

    public function save()
    {
        $this->validate();

        if ($this->password) {
            $this->user->password = Hash::make($this->password);
        }

        $this->reset(['password', 'password_confirmation']);

        $this->user->save();

        session()->flash('status', 'User successfully updated.');
        return redirect()->route('admin.users.index');
    }

    public function render()
    {
        return view('livewire.admin.user.user-edit')->with([
            'user' => $this->user
        ])->extends('admin.layouts.app');
    }
}
