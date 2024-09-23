<?php

namespace App\Models\Projects;

use App\Models\User;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class Project extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'description',
        'user_id'
    ];


    public function tasks()
    {
        return $this->hasMany(Task::class);
    }

    public function owner()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function users()
    {
        return $this->belongsToMany(User::class, 'project_user');
    }

    public function getTotalTimeAttribute()
    {
        $total_time = $this->tasks()->sum('total_time');
        $minutes = $total_time % 60;
        $hours = intval($total_time / 60);
        return $hours . ' ' . Str::plural("Hour", $hours) . ", " . $minutes . ' ' . Str::plural('Min', $minutes);
    }
}
