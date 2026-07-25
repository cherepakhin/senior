Попытка 2.

###Запуск

Запускается в docker:

````shell
./run_teamcity.sh
````

Log:
````text
/run-services.sh
/services/check-server-volumes.sh

/run-server.sh
TeamCity server.xml parameter: -config conf/server.xml
Java executable is found: '/opt/java/openjdk/bin/java'
2026-07-25 18:17:48 UTC: Starting TeamCity server
...
TeamCity initialized, server UUID: 280e2536-b82a-4b68-9138-6021b80aa09c, URL: http://localhost:8111
TeamCity is running in professional mode
[TeamCity] Super user authentication token: 1594039885074809882 (use empty username with the token as the password to access the server)
...

````

Ждать!!! 3-5 мин. Потом открыть [http://v:8111/favorite/projects?mode=builds](http://v:8111/favorite/projects?mode=builds)


Отдельно агента не запускал, и он есть в интерфейсе Teamcity, но КАЖЕТСЯ(??????) его нужно запустить из build-agent/agent_run.sh (??????)

###Остановка

Control+C

````shell
docker ps
````

````text
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
````

НО!
vasi@v:~/po/teamcity$ ./run_teamcity.sh
docker: Error response from daemon: Conflict. The container name "/teamcity-server-instance" is already in use by container "e8029f52ee5580a14174e215a0aaf0c7853e144a123927a620bc21e6594b4f27". You have to remove (or rename) that container to be able to reuse that name.
See 'docker run --help'.


````shell
sudo docker ps -a
CONTAINER ID   IMAGE                                 COMMAND                  CREATED       STATUS                     PORTS     NAMES
98b2b9871f59   jetbrains/teamcity-server             "/run-services.sh"       6 hours ago   Exited (0) 9 minutes ago             teamcity-server-instance
c9ae13621a88   opensearchproject/opensearch:latest   "./opensearch-docker…"   12 days ago   Exited (130) 12 days ago             opensearch-node
````
````shell
docker stop 98b
98b
````

````shell
docker rm teamcity-server-instance
````

Остановка агента:

````shell
ps -ax | grep agent
````

````shell
kill -9 123
````
