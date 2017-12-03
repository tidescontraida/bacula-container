#############################
### Dockerfile to create a Bacula DB
######
FROM mariadb@sha256:801ba73f78da191339d1cf2acdb98f2ea6fe2d38974e838a4a5f1535563e4ed7

MAINTAINER "CJJ < cassio@nido.com.br >"

ENV TZ=America/Sao_Paulo

ENV MYSQL_ROOT_PASSWORD "M9hJENnxROGW15Pj"

### Copia o arquivo com o DUMP da base de dados do Bacula
### Para que seja carregado na criacao do Container.
### Este recurso está contido no arquivo docker-entrypoint.sh,
### que e fornecido com a imagem oiginal
COPY confs/bacula.sql /docker-entrypoint-initdb.d/

EXPOSE 3306/tcp

##################
### References ###
##################
# https://serverfault.com/questions/796762/creating-a-docker-mysql-container-with-a-prepared-database-scheme (2017-10-08 at 20:00)
