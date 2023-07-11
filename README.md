# php-mysql-test

[Original Instructions](https://github.com/microsoft/vscode-dev-containers/tree/main/containers/php-mariadb)

```
mariadb -h localhost -P 3306  --protocol=tcp -u root --password=mariadb -D mariadb
```

```
apache2ctl start
```


Database config information for [database-client](https://database-client.com/#/document) stored here:
```/home/vscode/.vscode-remote/data/User/globalStorage/cweijan.vscode-mysql-client2```

To add queries to git:
```
devcontainer.json

sudo rm -f /home/vscode/.dbclient && sudo ln -s \"$(pwd)/.dbclient\"  /home/vscode/
```

# Add Mongo

* Install [MongoDB Extension](https://marketplace.visualstudio.com/items?itemName=mongodb.mongodb-vscode)
* Install [Docker-in-Docker](https://aaronblondeau.com/posts/november_2021/github-codespaces/). Choose ```Modify your active configuration...```
* Install [Mongo via Docker](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-community-with-docker/)
* Run Mongo: ```docker run --name mongo -d -p 27017:27017/tcp mongodb/mongodb-community-server:latest```
* Connect to mongo via: ```mongosh```
* If you run via the Docker extension, --rm is used which removed the container on exit. 

# Install MongoDB PHP Libraries
* [Instructions](https://www.mongodb.com/developer/languages/php/php-setup/)
* ```sudo pecl install mongodb```
* or ```composer install``` in pdoExamples directory
* Add mongodb.ini to /usr/local/etc/php/conf.d
  *   ```extension=mongodb.so```
* Install PHP libraries via composer in pdoExamples directory
  *   ```composer require mongodb/mongodb```

# Add Redis

* Following these instructions:
  *   [Redis](https://aaronblondeau.com/posts/november_2021/github-codespaces/)
  *   Using this [extension](https://database-client.com/#/document).
* Install [Docker-in-Docker](https://aaronblondeau.com/posts/november_2021/github-codespaces/)) if you  have not already
* Install Redis in Docker:
  *  ```docker pull redis```
* Start Redis
  *  ```docker run --name local-redis -p 6379:6379 -d redis```

# Install Redis PHP Libraries
* [Instructions](https://developer.redis.com/develop/php/)
*   ```sudo pecl install redis```
* Add redis.ini to /usr/local/etc/php/conf.d
  *   ```extension=redis.so```
* [Examples](https://github.com/redis-developer/redis-php-getting-started/)

# PHP
* [Online testing](https://onlinephp.io/)
* [Password Generation](https://onlinephp.io/password-hash)
* [Store DB password in file](https://www.php.net/manual/en/pdo.construct.php)
* Configure [Intelephense](https://github.com/bmewburn/intelephense-docs/blob/master/installation.md)
  * Install [stubs](https://github.com/bmewburn/vscode-intelephense/issues/793) for intelephense (redis, mongo, mongodb)
    *   See .vscode/settings.json in this repos

# DEBUG PHP
* Xdebug is running on port 9000, not 9003
* Choose ```Listen for Xdebug```

# Windows in a Dev Container
* You can run this repository on Windows if you install Docker
  *   Install the [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) extension in VS Code locally
* ~~Before you checkout the repository set the line endings in Windows~~
  *   ~~```git config --local core.autocrlf false```~~
  *   [Documentation](https://www.aleksandrhovhannisyan.com/blog/crlf-vs-lf-normalizing-line-endings-in-git/) on Line 
Endings
  *   fixed with ```.gitattributes```
  *   ```* text=auto eol=lf```
* Might need to add new ssh keys in the container
*   If ssh-agent is running in Windows, that might interfere with ssh keys in the container
* Will need to mark the directory as safe from inside the container:
  *   ```git config --global --add safe.directory /workspaces/Mariadb_MongoDB_Redis_WebApp_Example```
  *   --local instead of --global?
