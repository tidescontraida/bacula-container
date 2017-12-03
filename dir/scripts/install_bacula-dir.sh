#!/bin/bash

cd /usr/local/src/

cd bacula*

./configure --enable-build-dird=yes --enable-build-stored=no --with-readline=/usr/include/readline --disable-conio --bindir=/usr/bin --sbindir=/usr/sbin --with-scriptdir=/usr/libexec/bacula/ --with-working-dir=/var/spool/bacula/ \
--with-logdir=/var/log --enable-smartalloc --with-mysql --with-archivedir=/mnt/backup

make -j8 && make install && make install-autostart

/usr/bin/mkdir -p /opt/bacula/log
