#!/bin/bash
sed -i 's/;date.timezone =/date.timezone = America\/Sao_Paulo/' /etc/php/7.0/apache2/php.ini
sed -i 's/max_execution_time = 30/max_execution_time = 3600/' /etc/php/7.0/apache2/php.ini

sed -i 's/db.config.host     = localhost/db.config.host  = db/' /usr/src/webacula/application/config.ini
sed -i 's/db.config.username = bacula/db.config.username = root/' /usr/src/webacula/application/config.ini
sed -i 's/db.config.password = bacula/db.config.password = 'M9hJENnxROGW15Pj'/' /usr/src/webacula/application/config.ini
sed -i 's/catalog\.version = 15/catalog\.version = 16/' /usr/src/webacula/application/config.ini

chown -R www-data.www-data /usr/src/webacula
chmod 775 /etc/bacula
chmod 777 /usr/src/webacula/data/cache

chmod -R 777 /var/lib/php/sessions/

echo "www-data ALL=NOPASSWD: /usr/sbin/bconsole" >> /etc/sudoers

a2enmod rewrite
a2ensite webacula.conf

mv /usr/src/webacula  /var/www