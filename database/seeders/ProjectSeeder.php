<?php

namespace Database\Seeders;

use App\Models\Projects\Project;
use App\Models\Projects\Task;
use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class ProjectSeeder extends Seeder
{
    /**
     * Run the database seeds.
     **/
    public function run()
    {
        // Get all users (or limit to specific users, e.g., first 10 users)
        $users = User::all();  // Fetch all existing users

        // Create 10 projects and associate them with random users
        Project::factory()
            ->count(10)
            ->make() // Use make() to get an instance before saving
            ->each(function ($project) use ($users) {
                // Randomly assign a user from the existing users as the owner
                $project->user_id = $users->random()->id;
                $project->save();

                $projectUsers = $users->random(rand(1, 3));

                foreach ($projectUsers as $user) {
                    // Attach each user with additional pivot data (role, assigned_at)
                    $project->users()->attach($user->id);
                }

                // For each project, create 5 tasks
                Task::factory()
                    ->count(5)
                    ->create([
                        'project_id' => $project->id,  // Link tasks to the project
                    ]);
            });
    }
}
