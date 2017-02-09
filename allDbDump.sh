#!/bin/sh

# sudo crontab -e
# 17 22 * * * /home/mmahmood/Dropbox/Linux/allDbDump.sh


mysqldump -u root -proot --all-databases | gzip -v > /home/mmahmood/Dropbox/DB_Dumps/alldb.sql.gz
