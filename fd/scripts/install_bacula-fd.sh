#!/bin/bash

cd /usr/local/src/

cd bacula*

./configure --enable-client-only --enable-build-dird=no --enable-build-stored=no --bindir=/usr/bin \
--sbindir=/usr/sbin --with-scriptdir=/usr/libexec/bacula --with-working-dir=/var/spool/bacula \
--with-logdir=/var/log --enable-smartalloc

make -j8 && make install && make install-autostart-fd

/usr/bin/mkdir -p /opt/bacula/log
