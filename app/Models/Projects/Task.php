<?php

namespace App\Models\Projects;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Task extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'description',
        'completed',
        'project_id',
        'start_time',
        'end_time',
        'total_time'
    ];
    public function project()
    {
        return $this->belongsTo(Project::class);
    }

    public function setEndTimeAttribute($value)
    {
        $this->attributes['end_time'] = $value;

        // Calculate the total time (in minutes) when start_time and end_time are both set
        if ($this->start_time && $value) {
            $start = Carbon::parse($this->start_time);
            $end = Carbon::parse($value);
            $this->attributes['total_time'] = $start->diffInMinutes($end);
            $this->attributes['completed'] = 1;
        }
    }
}
