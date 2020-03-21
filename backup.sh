export $(grep -v '^#' .env | xargs -d '\n')

backup_name=$(date "+%d_%m_%Y_%H_%M_%S")

docker exec ${PMA_HOST} /usr/bin/mysqldump \
  -u ${MYSQL_USER} --password=${MYSQL_PASSWORD} \
  ${MYSQL_DATABASE} > "$MYSQL_DATABASE"_"$backup_name".sql
unset $(grep -v '^#' .env | sed -E 's/(.*)=.*/\1/' | xargs -d '\n')
