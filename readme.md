# Test Task

## Implementation details
1. Solution is contained in `src` folder.
2. This is fully working containerized environment with nginx, php-fpm, mysql and phpMyAdmin container.
3. Database is not storing values after stopping containers. Each new start will provide fresh database.
4. Simplest possible solution is used. First I thought how to implement this with 10 interfaces and 15 classes. Then remembered old good YAGNI and KISS principles.
5. Database is called `infuse` and table is called `visitors`.

## Assumptions
1. Empty url is an url. If `banner.php` will be called as is then entry will be added to the database with empty `page_url` value. It was done based on following considerations: if image was viewed, then we need to capture this.

## Deployment instructions
1. Docker Desktop is required (please note that this was tested only on Mac).
2. Download source code and go to the root directory.
3. Execute `docker-compose up -d`. It may take some time to execute.
4. Access http://localhost:8098/index1.html and http://localhost:8098/index2.html
5. Access http://localhost:8099/ for phpMyAdmin where you can check database data.
6. Execute `docker-compose down` to delete and clean up.