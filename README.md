# project
============

### How to setup your machine for local development
#### Requirements:

##### Ansible Version 2.3.0.0 or Above.

##### Virtual Box Version 5.0.14 or Above.


You'll need to do a couple things on your machine first to get it setup for development.
Instructions below assume you've already cloned this repo and are inside the root folder.


1. Install pip modules into virtualenv:
    ```shell
    pip install ansible==2.3.0.0
    ```

2. Update /etc/hosts:
    Add the following line to your /etc/hosts file:

    ```shell
    127.0.0.1 local.myapp.com
    ```

3. Run vagrant at the **root level of the repository**:
    ```shell
    vagrant up
    ```

    This will start an Ubuntu instance in your virtual box and will install all necessary packages.
    If this is your first time running the command, it can take up to 20 minutes.


4. Get the latest copy of the production data and import to your database.
    After you get a copy of the production data dump, place it inside this corpsite repo.

    ```shell
    vagrant ssh
    corpsite
    mysql -u vagrant appdynamics_django < <NAME_OF_PROD_DUMP>.sql
    ```
    **TODO: make this data dump step automatic after S3 bucket is moved to portal AWS account.**

5. Afterwards, you'll want to apply any migrations from your branch/develop that hasn't been released to production yet.
    ```shell
    python manage.py migrate
    ```

6. You should now be able to hit the following URL(s) in your browser:

    ```
    https://local.myapp.com:8383
    ```
    :+1:

### Shortcuts inside of vagrant ssh.
**Note: You will login as vagrant user, but everyhting on the site is running by root user.**

**To login as root: sudo -s**

1. Go to the project folder:
    ```
    base_myapp
    ```

2. Go to the static files folder:
    ```
    static
    ```

3. Go to the media files folder:
    ```
    media
    ```

4. See the logs:
    ```
    log_myapp (To see uwsgi log, this is evrything you see when you ./manage.py runserver.)
    log_redis (To see redis log.)
    ```

5. Redis command:
    ```
    redis-cli
    ```

6. Restart server:
    ```
    restart-server
    ```
    Runs sudo service supervisord restart

### Other Helpful Commands ###

1. Database:
    ```
    mysql -u vagrant appdynamics_django < [some.sql file]
    ```

2. Restart the server:
    ```
    sudo service nginx reload (To reload Nginx.)
    sudo service supervisord status (To check the status of web server and redis server.)
    sudo service supervisord restart (To restart both web server and redis server.)
    ```

### Troubleshooting

1. If you see some of the text are not in the correct position, this is because Alpasso is not setup correctly. You can fix it by:
    * Resize the window, and all the text should go to the right place.
    * Run portal-setup to setup portal-alpasso. (**Suggested**)
2. You may need to remove .sass-cache/ inside the corpsite repo.
