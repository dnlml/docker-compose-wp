export $(grep -v '^#' .env | xargs -d '\n')

BACKUP_FOLDER='./db_backup/'
BACKUP_NAME=$(date "+%d_%m_%Y_%H_%M_%S")

find "$BACKUP_FOLDER" -mtime +10 -type f -delete

docker exec ${PMA_HOST} /usr/bin/mysqldump \
  -u ${MYSQL_USER} --password=${MYSQL_PASSWORD} \
  ${MYSQL_DATABASE} | gzip > "$BACKUP_FOLDER""$MYSQL_DATABASE"_"$BACKUP_NAME".sql.gz

unset $(grep -v '^#' .env | sed -E 's/(.*)=.*/\1/' | xargs -d '\n')
