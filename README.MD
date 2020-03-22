## Lampish wp setup

### TODO:
- Backup strategy for wp. how to link changes from container wp-content and public/wp-content folder
- add chron tab to automatically execute DB backup

### NOTES:
- connetc to the docker containing wp and fix permission of the wp-content using chown -R www-data wp-content
- docker exec -it container_name_or_hash bash
- 
