## Lampish wp setup
This is a docker setup to have a running nginx (with SSL and HTTP2) that redirect the requests to other containers in which wp is installed. It also create a separated container for mysql and on for phpMyAdmin. A mysql daily backup is available and will keep track of tha latest 10 days.


## How To
- Install docker
- Add inside in `public` the wp-content folder.
- copy .env_example and rename it .env, updating the vars inside.
- Add a redirect of type A in your hosting table and set a subdomain to be used as phpmyadmin url. make it point to your server IP.
- Run `docker-compose up -d`


### To Backup
- to setup daily backup for the latest 10 days:
  - create a folder named `db_backup` in the same level of this file
  - run `crontab -e`
  - add the following: `0 3 * * * /absolute/path/to/backup.sh`


### To connect to one container
Run `docker exec -it container_name_or_hash bash`

### Fix permission if needed
Connect to the docker containing wp and fix permission of the wp-content using `chown -R www-data wp-content`

