# bacula-docker

O Passo a Passo

Para subir este Stack, siga os passos abaixo:

    Tenha certeza de quem tem o Docker instalado e funcionando em seu ambiente, assim como o cluster do swarm inicializado ;
    O git deve estar instalado também em seu ambiente;
    Faça o clone do repositório do projeto, que se encontra neste link;
    Acesse o diretório bacula-docker/;
    Edite o arquivo stack.yml e altere o local onde será efetuado o backup, assim como o local onde ficará o base de dados do MariaDB;

        Nota
        Neste caso estamos fazendo o backup no /tmp/backups e a base de dados do MariaDB está no /tmp/mariadb.
        É interessante que estes diretórios já existam.
        Quando for colocar este projeto em um ambiente de produção, faça os ajustes necessário de acordo com o seu ambiente, ou seja, deve-se alterar tanto neste arquivo, quanto no bacula-sd.conf.

    Crie o stack com o comando abaixo:
    # docker stack deploy -c stack.yml bacula

        Importante
        Este processo demora um pouco, pois ele tem que baixar as imagens do container e criá-los em seu ambiente. Também pode apresentar alguns erros devido a criação do container de Banco de Dados, mas basta esperar que todos devem inicializar corretamente.