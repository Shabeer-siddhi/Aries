<div class="menu">
    <div class="main-menu">
        <div class="scroll">
            <ul class="list-unstyled">
                <li class="{{ request()->routeIs('admin.dashboard') ? 'active' : '' }}">
                    <a href="{{ route('admin.dashboard') }}">
                        <i class="iconsminds-shop-4"></i>
                        <span>Dashboards</span>
                    </a>
                </li>

                <li class="{{ request()->routeIs('projects*') ? 'active' : '' }}">
                    <a href="{{ route('admin.projects.index') }}">
                        <i class="simple-icon-layers"></i> Projects
                    </a>
                </li>
                <li class="{{ request()->routeIs('users*') ? 'active' : '' }}">
                    <a href="{{ route('admin.users.index') }}">
                        <i class="simple-icon-user"></i> Users
                    </a>
                </li>

            </ul>
        </div>
    </div>

    <div class="sub-menu">
        <div class="scroll">


        </div>
    </div>
</div>
