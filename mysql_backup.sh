#!/bin/bash

DB_USER="root" DB_PASSWORD="Katri istuu kadulla klo 15" DB_NAME="wp_database" BACKUP_FOLDER="/root/mysql_backup"

echo "Performing MySQL dump for ${DB_NAME}..." [ -d "${BACKUP_FOLDER}" ] || mkdir -p "${BACKUP_FOLDER}" cd "${BACKUP_FOLDER}"

mysqldump --opt -u ${DB_USER} -p${DB_PASSWORD} ${DB_NAME} | gzip > ${DB_NAME}$(date +%F%T).sql.gz

echo "MySQL dump completed and saved in ${BACKUP_FOLDER}."
