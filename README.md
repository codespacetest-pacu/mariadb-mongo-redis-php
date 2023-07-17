# php-mysql-test

[Original Instructions](https://github.com/microsoft/vscode-dev-containers/tree/main/containers/php-mariadb)

```
mariadb -h localhost -P 3306  --protocol=tcp -u root --password=mariadb -D mariadb
```

```
apache2ctl start
```
### Note: Start apache AFTER .devcontainer/.devcontainer.json ```postCreateCommand``` stops running. 


Database config information for [database-client](https://database-client.com/#/document) stored here:
```/home/vscode/.vscode-remote/data/User/globalStorage/cweijan.vscode-mysql-client2```

To add queries to git:
```
devcontainer.json

sudo rm -f /home/vscode/.dbclient && sudo ln -s \"$(pwd)/.dbclient\"  /home/vscode/
```
# Mongo and Redis

MongoDB and Redis now each run in their own container configured in .devcontainer/docker-compose.yml. Each database starts automatically.

## Containers & Documentation
* [MongoDB](https://hub.docker.com/r/mongodb/mongodb-community-server)
* [Redis](https://hub.docker.com/_/redis)
* [In-Depth Tutorial, very helpful](https://github.com/0916dhkim/vscode-devcontainer-tutorial)
  
# Add Mongo

* Install [MongoDB Extension](https://marketplace.visualstudio.com/items?itemName=mongodb.mongodb-vscode)
* ~~Install [Docker-in-Docker](https://aaronblondeau.com/posts/november_2021/github-codespaces/). Choose ```Modify your active configuration...```~~
* ~~Install [Mongo via Docker](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-community-with-docker/)~~
* ~~Run Mongo: ```docker run --name mongo -d -p 27017:27017/tcp mongodb/mongodb-community-server:latest```~~
* Connect to mongo via: ```mongosh```
* ~~If you run via the Docker extension, --rm is used which removed the container on exit.~~

# Install MongoDB PHP Libraries 
* [Instructions](https://www.mongodb.com/developer/languages/php/php-setup/)
* ```sudo pecl install mongodb```
  * or ```composer install``` in pdoExamples directory
* Add mongodb.ini to /usr/local/etc/php/conf.d -- done via .devcontainer/.devcontainer.json ```postCreateCommand```
  *   ```extension=mongodb.so```
* Install PHP libraries via composer in pdoExamples directory -- user must do by hand
  *   ```composer require mongodb/mongodb```
  * run after .devcontainer/.devcontainer.json ```postCreateCommand``` stops running. 

# Add Redis

* Following these instructions:
  *   ~~[Redis](https://aaronblondeau.com/posts/november_2021/github-codespaces/)~~
  *   Using this [extension](https://database-client.com/#/document).
* ~~Install [Docker-in-Docker](https://aaronblondeau.com/posts/november_2021/github-codespaces/)) if you  have not already~~
* ~~Install Redis in Docker:~~
  *  ~~```docker pull redis```~~
* ~~Start Redis~~
  *  ~~```docker run --name local-redis -p 6379:6379 -d redis```~~

# Install Redis PHP Libraries
* [Instructions](https://developer.redis.com/develop/php/)
*   ```sudo pecl install redis``` -- done via .devcontainer/.devcontainer.json ```postCreateCommand```
* Add redis.ini to /usr/local/etc/php/conf.d
  *   ```extension=redis.so``` -- done via .devcontainer/.devcontainer.json ```postCreateCommand```
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
* [Shutdown VS Code](https://code.visualstudio.com/docs/devcontainers/containers#_managing-containers) to shutdown the dev container. 
* [Developing inside a Container](https://code.visualstudio.com/docs/devcontainers/containers)
* You can run this repository on Windows if you install Docker
  *   Install the [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) extension in VS Code locally

# Git (when runing on Windows in a Dev Container) 
* ~~Before you checkout the repository set the line endings in Windows~~
  *   ~~```git config --local core.autocrlf false```~~
  *   [Documentation](https://www.aleksandrhovhannisyan.com/blog/crlf-vs-lf-normalizing-line-endings-in-git/) on Line Endings
  *   [More documentation on Line Endings and WSL](https://code.visualstudio.com/docs/remote/troubleshooting#_resolving-git-line-ending-issues-in-wsl-resulting-in-many-modified-files)
  *   fixed with ```.gitattributes```
  *   ```* text=auto eol=lf```
* Need to add new SSH Keys inside the container
*   If ssh-agent is running in Windows, that might interfere with ssh keys in the container
*   If you rebuild the container these SSH Keys are destoryed
* Will need to mark the directory as safe from inside the container:
  *   ```git config --global --add safe.directory /workspaces/mariadb-mongo-redis-php ```
  *   --local instead of --global?
