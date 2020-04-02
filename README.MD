## Lampish wp setup
Create a public folder in the same level of this file and add inside the wp-content folder

### To Backup
- to setup daily backup for the latest 10 days:
  - create a folder named `db_backup` in the same level of this file
  - run `crontab -e`
  - add the following: `0 3 * * * /absolute/path/to/backup.sh`


### To connect to one container
Run `docker exec -it container_name_or_hash bash`

### Fix permission if needed
Connect to the docker containing wp and fix permission of the wp-content using chown -R www-data wp-content

