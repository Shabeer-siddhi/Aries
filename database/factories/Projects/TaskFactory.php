<?php

namespace Database\Factories\Projects;

use App\Models\Projects\Project;
use App\Models\Projects\Task;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Projects\Task>
 */
class TaskFactory extends Factory
{
    protected $model = Task::class;

    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        $hasStartTime = $this->faker->boolean(80);
        $hasEndTime = $this->faker->boolean(60);

        $startTime = $hasStartTime ? $this->faker->dateTimeBetween('-1 week', 'now') : null;
        $endTime = ($hasStartTime && $hasEndTime) ? $this->faker->dateTimeBetween($startTime, '+1 week') : null;
        $totalTime = ($startTime && $endTime) ? $this->faker->numberBetween(1, 480) : null;

        return [
            'name' => $this->faker->sentence(3),
            'description' => $this->faker->paragraph,
            'start_time' => $startTime,
            'end_time' => $endTime,
            'total_time' => $totalTime,
            'completed' => ($endTime && $totalTime) ? 1 : 0,
            'created_at' => now(),
            'updated_at' => now(),
            'project_id' => Project::factory(),
        ];
    }
}
