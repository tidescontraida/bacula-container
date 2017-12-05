# bacula-docker-BETA

Stack para solução de backup com Bacula com Docker.

Caso ver a documenação detalhada, acesso o link abaixo:

http://www.tidescontraida.com.br/bacula/bacula-docker/


# Passo a Passo

- Para subir este Stack, siga os passos abaixo:

    - Tenha certeza de quem tem o Docker instalado e funcionando;
    - Tenha um cluster do swarm inicializado;
    - O git deve estar instalado;
    - Faça o clone do repositório do projeto;
    - Acesse o diretório **bacula-docker/**;
    - Edite o arquivo **stack.yml** e altere o local onde será efetuado o backup, assim como o local onde ficará o base de dados do MariaDB;

```
Nota
Neste caso estamos fazendo o backup no "/tmp/backups" e a base de dados do MariaDB está no "/tmp/mariadb".
É interessante que estes diretórios já existam.
Para o projeto em um ambiente de produção, faça os ajustes necessário,
ou seja, deve-se alterar tanto neste arquivo, quanto no bacula-sd.conf.

```
   - Crie o stack com o comando abaixo:

    # docker stack deploy -c stack.yml bacula

```
Importante
Este processo demora um pouco, pois ele tem que baixar as imagens do container e criá-los em seu ambiente.
Também pode apresentar alguns erros devido a criação do container de Banco de Dados.
Mas basta esperar que todos devem inicializar corretamente.

```
- Para validar o funcionamento, use uma das duas opções abaixo:
    - Acesse o container do Director e execute o comando **bconsole**.
    - Acesse via browser o endereço http://127.0.0.1:8082/webacula e faça o login com as credenciais:
        - Usuário: root
        - Senha: M9hJENnxROGW15Pj

# Demonstração

EM BREVE!!!

# Ah, nos ajude a melhorar isto!

# #TiDescontraida