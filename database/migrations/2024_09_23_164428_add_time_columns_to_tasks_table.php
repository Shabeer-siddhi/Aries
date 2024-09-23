<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('tasks', function (Blueprint $table) {
            $table->after('description', function (Blueprint $table) {
                $table->timestamp('start_time')->nullable();
                $table->timestamp('end_time')->nullable();
                $table->integer('total_time')->nullable();
            });
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('tasks', function (Blueprint $table) {
            $table->dropColumn([
                'start_time',
                'end_time',
                'total_time'
            ]);
        });
    }
};
