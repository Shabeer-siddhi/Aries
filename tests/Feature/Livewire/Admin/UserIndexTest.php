<?php

namespace Tests\Feature\Livewire\Admin;

use App\Livewire\Admin\UserIndex;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Livewire\Livewire;
use Tests\TestCase;

class UserIndexTest extends TestCase
{
    /** @test */
    public function renders_successfully()
    {
        Livewire::test(UserIndex::class)
            ->assertStatus(200);
    }
}
