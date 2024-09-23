<?php

namespace App\View\Components;

use Illuminate\View\Component;

class SideNav extends Component
{
    public $enquiryCount;
    /**
     * Create a new component instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->enquiryCount = 1;
    }

    /**
     * Get the view / contents that represent the component.
     *
     * @return \Illuminate\Contracts\View\View|\Closure|string
     */
    public function render()
    {
        return view('admin.components.side-nav');
    }
}
