#############################
### Dockerfile to create a Webacula
### Operational System Debian 9
######
FROM debian@sha256:2e43e863a4ab6e53caf87a37d01d8c144cdcb732ad1b944fcf45cbfd7248a02a

MAINTAINER "CJJ < cassio@nido.com.br >"

ENV TZ=America/Sao_Paulo

RUN apt-get update -y && \
    apt-get install -y apache2 libapache2-mod-php php php-gd php-dev php-mcrypt php-curl && \
    apt-get install -y php-mysqlnd bareos-bconsole sudo

ADD packages/webacula.tar.gz /usr/src/

COPY scripts/finalize-webacula.sh /usr/local/sbin

COPY confs/bconsole.conf /etc/bacula/
COPY confs/webacula.conf /etc/apache2/sites-available/webacula.conf

RUN chmod +x /usr/local/sbin/finalize-webacula.sh && \
    /usr/local/sbin/finalize-webacula.sh

ENV APACHE_LOCK_DIR="/var/lock"
ENV APACHE_PID_FILE="/var/run/apache2.pid"
ENV APACHE_RUN_USER="www-data"
ENV APACHE_GROUP_USER="www-data"
ENV APACHE_LOG_DIR="/var/log/apache2"

ENTRYPOINT ["/usr/sbin/apachectl","-D FOREGROUND"]

EXPOSE 8082/tcp

##################
### References ###
##################
### https://github.com/wanderleihuttel/bacula-utils/blob/master/tutorial/tutorial_de_instalacao_do_webacula_debian9.txt (2017-10-18 at 18:01)
### https://lesleyribeiro.com/2014/09/29/instalacao-e-configuracao-webacula-how-to-install-webacula-bacula-backup-server-on-centos-7/ (2017-10-14 at 11:56)
### https://github.com/wanderleihuttel/webacula (2017-10-14 at 11:57)
### http://www.techietown.info/2016/10/how-to-start-httpdapache-in-foreground/ (2017-10-15 at 11:37)
### https://stackoverflow.com/questions/29643271/how-to-install-webacula-7-on-centos-7 (2017-10-16 at 18:28)