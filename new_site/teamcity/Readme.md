[https://hub.docker.com/r/jetbrains/teamcity-server](https://hub.docker.com/r/jetbrains/teamcity-server)

````shell
docker pull jetbrains/teamcity-server
````

````shell
docker run --name teamcity-server-instance  \
-v /home/vasi/po/teamcity/data:/data/teamcity_server/datadir \
-v /home/vasi/po/teamcity/logs:/opt/teamcity/logs  \
-p 8111:8111 \
jetbrains/teamcity-server
````

Локальные рабочие каталоги в /home/vasi/po/teamcity
port 8111

vasi/pass

=======================================================================
TeamCity initialized, server UUID: 280e2536-b82a-4b68-9138-6021b80aa09c, URL: http://localhost:8111
TeamCity is running in professional mode
[TeamCity] Super user authentication token: 1301150662062241858 (use empty username with the token as the password to access the server)

С ноута: [http://v:8111/favorite/projects](http://v:8111/favorite/projects)
