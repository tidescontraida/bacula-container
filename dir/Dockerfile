#############################
### Dockerfile to create a Bacula Dir server
### Operational System CentOS-7
######
FROM centos@sha256:26f74cefad82967f97f3eeeef88c1b6262f9b42bc96f2ad61d6f3fdf544759b8

MAINTAINER "CJJ < cassio@nido.com.br >"

ENV TZ=America/Sao_Paulo

### Install dependencies
RUN yum install -y epel-release && \
  yum install -y gcc-c++ readline-devel zlib-devel lzo-devel libacl-devel mt-st mtx \
	libssl-dev mariadb-devel mariadb-server wget make \
	yum clean all

ADD packages/bacula-9.0.3.tar.gz /usr/local/src
COPY scripts/install_bacula-dir.sh /usr/local/sbin

RUN chmod +x /usr/local/sbin/* && \
  /usr/local/sbin/install_bacula-dir.sh

COPY confs/* /etc/bacula/

# Start the service bacula-dir in foreground (-f)
ENTRYPOINT ["/usr/sbin/bacula-dir", "-f"]

EXPOSE 9101/tcp

##################
### References ###
##################
### http://www.bacula.com.br/comandos-de-compilacao/ (2017-10-03 at 11:59)
### http://www.backupcentral.com/forum/19/97796 (2017-10-03 at 15:10)
### https://linux.die.net/man/8/bacula-dir (2017-10-03 at 17:29)
