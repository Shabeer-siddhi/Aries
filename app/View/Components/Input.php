<?php

namespace App\View\Components;

use Illuminate\View\Component;

class Input extends Component
{

    public $type;
    public $name;
    public $text;
    public $model;

    /**
     * Create a new component instance.
     *
     * @return void
     */
    public function __construct($type = 'test', $name = "", $text = "", $model = "")
    {
        $this->type = $type;
        $this->name = $name;
        $this->text = $text;
        $this->model = $model;
    }

    /**
     * Get the view / contents that represent the component.
     *
     * @return \Illuminate\Contracts\View\View|\Closure|string
     */
    public function render()
    {
        return view('admin.components.input');
    }
}
