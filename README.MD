## Lampish wp setup
This is a docker setup that creates a separated container for wp, mysql and on for phpMyAdmin. A mysql daily backup is available and will keep track of tha latest 10 days.


## Requirements
- Install docker
- Nginx proxy from https://github.com/dnlml/docker-compose-nginx-proxy must be already installed and running.

## How To
- Add inside in `public` the wp-content folder.
- copy .env_example and rename it .env, updating the vars inside.
- Add a redirect of type A in your hosting table and set a subdomain to be used as phpmyadmin url. make it point to your server IP.
- At the line 4 of the docker-compose.yml replace formato120_mysql with the $(MSQL_CONTAINER_NAME) value you added in the .env.
- Run `docker-compose up -d`


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

