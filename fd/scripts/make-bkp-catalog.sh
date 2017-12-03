#!/bin/bash

clear 

### Script to backup of Bacula Catalog
/usr/bin/mysqldump -u root -pM9hJENnxROGW15Pj -h db bacula > /opt/bacula/catalog-bacula.sql