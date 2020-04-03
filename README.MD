# Lampish wp setup
This is a docker setup that creates a separated container for wp, mysql and on for phpMyAdmin. A mysql daily backup is available and will keep track of tha latest 10 days.

## Requirements
- Linux Ubuntu
- Docker
- Nginx proxy from https://github.com/dnlml/docker-compose-nginx-proxy must be already installed and running.

## folder structure
Create a `/sites` folder and clone this project inside it as the following:

```
/home/myUsername/
│
└───nginx-proxy
│   │
│   └───...
│
└───sites
    │
    └───site1
    │
    └───site2
```
Rename the cloned folder with the name you prefer and remove the `/.git` folder (`rm -rf ./.git`)

## How To
- Add inside in `public` the wp-content folder.
- rename .env_example in .env (`mv .env_example .env`) and updates the vars inside.
- Add a redirect of type A in your hosting table and set a subdomain to be used as phpmyadmin url. make it point to your server IP.
- At the line 4 of the docker-compose.yml replace `rename_me_as_MSQL_CONTAINER_NAME` with the $(MSQL_CONTAINER_NAME) value you added in the .env.
- in the `docker-compose.yml` name the `nginx-proxy` with the name of the network.*
- Run `docker-compose up -d`

\* If you are using https://github.com/dnlml/docker-compose-nginx-proxy, you can leave it `nginx-proxy` otherwise you should name it accordingly.


### To Backup
- to setup daily backup for the latest 10 days:
  - create a folder named `db_backup` in the same level of this file.
  - edit the backup.sh file and add the absolute path to the variable SITE_PATH.
  - run `crontab -e`.
  - add the following: `0 3 * * * sh /absolute/path/to/backup.sh`.


### To connect to one container
Run `docker exec -it container_name_or_hash bash`

### Fix permission if needed
Connect to the docker containing wp and fix permission of the wp-content using `chown -R www-data wp-content`

