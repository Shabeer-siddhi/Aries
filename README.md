# Project Setup

-   Clone the github repo
-   Setup env
    -   Change the mail configuration(used for password reset mail)
-   Run `composer install`
-   Run `php artisan migrate`
-   Run `php artisan db:seed`
-   Run `npm install`
-   Run `npm run dev`
-   Run `php artisan serve` to run the project

Admin login endpoint: /admin/login
The default admin user account is created while running the seeder, and the username and password is as follows:

-   Username: admin@example.com
-   Password: password

I have also added the sql file i have used.