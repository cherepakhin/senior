User/pass: kibanaserver:kibanaserver 
root@v:/usr/share/opensearch/plugins/opensearch-security/tools# ./hash.sh
[Password:]pass
$2y$12$z9HkOQL2M45F2RFFM.CKWekznMJVs0cIzFK.V7oYylosNXFyElyYW



sudo env OPENSEARCH_INITIAL_ADMIN_PASSWORD=OpenPass_67 dpkg -i opensearch-3.8.0-linux-x64.deb

### NOT starting on installation, please execute the following statements to configure opensearch service to start automatically using systemd
sudo systemctl daemon-reload
sudo systemctl enable opensearch.service

### You can start opensearch service by executing
sudo systemctl start opensearch.service

### Create opensearch demo certificates in /etc/opensearch/
See demo certs creation log in /var/log/opensearch/install_demo_configuration.log

### Breaking change in packaging since 2.13.0
In 2.13.0 and later releases of OpenSearch, we have changed the permissions associated with access to installed files
If you are configuring tools that require read access to the OpenSearch configuration files, we recommend you add the user that runs these tools to the 'opensearch' group
For more information, see https://github.com/opensearch-project/opensearch-build/pull/4043
Processing triggers for libc-bin (2.39-0ubuntu8.5) ...
==============================================
sudo systemctl daemon-reload
sudo systemctl enable opensearch.service

### You can start opensearch service by executing
sudo systemctl start opensearch.service
==============================================

https://docs.opensearch.org/latest/install-and-configure/install-dashboards/index/

sudo dpkg -i opensearch-dashboards-3.8.0-linux-x64.deb

vasi@v:~/po/opensearch/distr$ cat /var/log/opensearch/install_demo_configuration.log
### OpenSearch Security Demo Installer
### ** Warning: Do not use on production or public reachable systems **
OpenSearch install type: rpm/deb on Linux 6.8.0-51-generic amd64
OpenSearch config dir: /etc/opensearch/
OpenSearch config file: /etc/opensearch/opensearch.yml
OpenSearch bin dir: /usr/share/opensearch/bin/
OpenSearch plugins dir: /usr/share/opensearch/plugins/
OpenSearch lib dir: /usr/share/opensearch/lib/
Detected OpenSearch Version: 3.8.0
Detected OpenSearch Security Version: 3.8.0.0
Admin password set successfully.
### Success
### Execute this script now on all your nodes and then start all nodes
### OpenSearch Security will be automatically initialized.
### If you like to change the runtime configuration
### change the files in ../../../config/opensearch-security and execute:
sudo "/usr/share/opensearch/plugins/opensearch-security/tools/securityadmin.sh" -cd "/etc/opensearch/opensearch-security" -icl -key "/etc/opensearch/kirk-key.pem" -cert "/etc/opensearch/kirk.pem" -cacert "/etc/opensearch/root-ca.pem" -nhnv
### or run ./securityadmin_demo.sh
### To use the Security Plugin ConfigurationGUI
### To access your secured cluster open https://<hostname>:<HTTP port> and log in with admin/<your-custom-admin-password>.
### (Ignore the SSL certificate warning because we installed self-signed demo certificates)

sudo mcedit /etc/opensearch-dashboards/opensearch_dashboards.yml

add "server.host: 0.0.0.0"

sudo systemctl restart opensearch-dashboards

http://v:5601/app/login

default username: kibanaserver
default password: kibanaserver

curl -X GET https://localhost:9200 -u 'kibanaserver:kibanaserver' --insecure
{
"name" : "v.perm.ru",
"cluster_name" : "opensearch",
"cluster_uuid" : "-rORXRSXQZu9UGt-265vZw",
"version" : {
"distribution" : "opensearch",
"number" : "3.8.0",
"build_type" : "deb",
"build_hash" : "e5a3c5691be87af6c12dbe3e158c59c04ee72973",
"build_date" : "2026-08-01T18:48:02.434955647Z",
"build_snapshot" : false,
"lucene_version" : "10.5.0",
"minimum_wire_compatibility_version" : "2.19.0",
"minimum_index_compatibility_version" : "2.0.0"
},
"tagline" : "The OpenSearch Project: https://opensearch.org/"
}
---------------------------------------------------------------
Status/Health
curl -X GET "https://localhost:9200/_cluster/health" -u 'kibanaserver:kibanaserver' --insecure | jq
{
"cluster_name": "opensearch",
"status": "green",
"timed_out": false,
"number_of_nodes": 1,
"number_of_data_nodes": 1,
"discovered_master": true,
"discovered_cluster_manager": true,
"active_primary_shards": 8,
"active_shards": 8,
"relocating_shards": 0,
"initializing_shards": 0,
"unassigned_shards": 0,
"delayed_unassigned_shards": 0,
"number_of_pending_tasks": 0,
"number_of_in_flight_fetch": 0,
"task_max_waiting_in_queue_millis": 0,
"active_shards_percent_as_number": 100.0
}

или с ключом pretty

curl -X GET "https://localhost:9200/_cluster/health?pretty" -u 'kibanaserver:kibanaserver' --insecure
{
"cluster_name" : "opensearch",
"status" : "green",
"timed_out" : false,
"number_of_nodes" : 1,
"number_of_data_nodes" : 1,
"discovered_master" : true,
"discovered_cluster_manager" : true,
"active_primary_shards" : 8,
"active_shards" : 8,
"relocating_shards" : 0,
"initializing_shards" : 0,
"unassigned_shards" : 0,
"delayed_unassigned_shards" : 0,
"number_of_pending_tasks" : 0,
"number_of_in_flight_fetch" : 0,
"task_max_waiting_in_queue_millis" : 0,
"active_shards_percent_as_number" : 100.0
}
---------------------------------------------------------------
curl https://127.0.0.1:9200 -u kibanaserver:kibanaserver  -k
{
"name" : "v.perm.ru",
"cluster_name" : "opensearch",
"cluster_uuid" : "-rORXRSXQZu9UGt-265vZw",
"version" : {
"distribution" : "opensearch",
"number" : "3.8.0",
"build_type" : "deb",
"build_hash" : "e5a3c5691be87af6c12dbe3e158c59c04ee72973",
"build_date" : "2026-08-01T18:48:02.434955647Z",
"build_snapshot" : false,
"lucene_version" : "10.5.0",
"minimum_wire_compatibility_version" : "2.19.0",
"minimum_index_compatibility_version" : "2.0.0"
},
"tagline" : "The OpenSearch Project: https://opensearch.org/"
}

---------------------------------------------------------------
sudo cat /etc/opensearch-dashboards/opensearch_dashboards.yml | grep pass

export JAVA_HOME=/usr/lib/jvm/java-1.21.0-openjdk-amd64
root@v:/usr/share/opensearch/plugins/opensearch-security/tools# /usr/share/opensearch/plugins/opensearch-security/tools/hash.sh
[Password:]B.._67
$2y$12$/llbERmCNRZi/FkTfTJpI.6u3DMuF9x.6pY7iVCcLDYV2CkBezTba


curl -k -u 'kibanaserver:kibanaserver' -XPUT "https://localhost:9200/_plugins/_security/api/internalusers/vasi" -H 'Content-Type: application/json' -d' {"password": "Bazilio67","opendistro_security_roles": ["maintenance_staff","database_manager"]}
curl -k -u 'kibanaserver:kibanaserver' -XPUT "https://localhost:9200/_plugins/_security/api/internalusers/vasi" -H 'Content-Type: application/json' -d' {"password": "Bazilio67","opendistro_security_roles": ["maintenance_staff","database_manager"]}
==================================================================
Отключил плагин security:
plugins.security.disabled: true
==================================================================
Проверка:
curl https://localhost:9200 -ku kibanaserver:kibanaserver
{
"name" : "v.perm.ru",
"cluster_name" : "opensearch",
"cluster_uuid" : "-rORXRSXQZu9UGt-265vZw",
"version" : {
"distribution" : "opensearch",
"number" : "3.8.0",
"build_type" : "deb",
"build_hash" : "e5a3c5691be87af6c12dbe3e158c59c04ee72973",
"build_date" : "2026-08-01T18:48:02.434955647Z",
"build_snapshot" : false,
"lucene_version" : "10.5.0",
"minimum_wire_compatibility_version" : "2.19.0",
"minimum_index_compatibility_version" : "2.0.0"
},
"tagline" : "The OpenSearch Project: https://opensearch.org/"
}
==================================================================

Log in with the default username admin and the default password admin

Установлено в docker на v. В 'ps -ax':

Запуск (17.09.2026):
~/po/opensearch/ok/orig$ ./run.sh

sudo env OPENSEARCH_INITIAL_ADMIN_PASSWORD=OpenPass_67
export OPENSEARCH_INITIAL_ADMIN_PASSWORD=OpenPass_67

docker compose up > log.txt

Пароль нужен СЛОЖНЫЙ!!! С ПРОСТЫМ НЕ ВЗЛЕТИТ!!!

При открытии появится надпись "OpenSearch Dashboards server is not ready yet" -> ждать 2-4 минуты.

открыть http://127.0.0.1:5601/app/home#/

с ноута тоже открывается http://v:5601/app/home



````shell
/usr/share/opensearch/jdk/bin/java -Xshare:auto -Dopensearch.networkaddress.cache.ttl=60 -Dopensearch.networkaddress.cache.negative.ttl=10 -XX:+AlwaysPreTouch -Xss1m -Djava.awt.headless=true -Dfile.encoding=UTF-8 -Djna.nosys=true -XX:-OmitStackTraceInFastThrow -XX:+ShowCodeDetailsInExceptionMessages -Dio.netty.noUnsafe=true -Dio.netty.noKeySetOptimization=true -Dio.netty.recycler.maxCapacityPerThread=0 -Dio.netty.allocator.numDirectArenas=0 -Dlog4j.shutdownHookEnabled=false -Dlog4j2.disable.jmx=true -Djava.locale.providers=SPI,CLDR -Xms1g -Xmx1g -XX:+UseG1GC -XX:G1ReservePercent=25 -XX:InitiatingHeapOccupancyPercent=30 -Djava.io.tmpdir=/tmp/opensearch-14753695288402225966 -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=data -XX:ErrorFile=logs/hs_err_pid%p.log -Xlog:gc*,gc+age=trace,safepoint:file=logs/gc.log:utctime,pid,tags:filecount=32,filesize=64m --add-modules=jdk.incubator.vector -javaagent:agent/opensearch-agent.jar --add-opens=java.base/java.nio=org.apache.arrow.memory.core,ALL-UNNAMED -Dorg.apache.lucene.store.MMapDirectory.sharedArenaMaxPermits=1 -Dclk.tck=100 -Djdk.attach.allowAttachSelf=true -Djava.security.policy=/usr/share/opensearch/config/opensearch-performance-analyzer/opensearch_security.policy --add-opens=jdk.attach/sun.tools.attach=ALL-UNNAMED -Dopensearch.cgroups.hierarchy.override=/ -XX:MaxDirectMemorySize=536870912 -Dopensearch.path.home=/usr/share/opensearch -Dopensearch.path.conf=/usr/share/opensearch/config -Dopensearch.distribution.type=tar -Dopensearch.bundled_jdk=true -cp /usr/share/opensearch/lib/* org.opensearch.bootstrap.OpenSearch -Ediscovery.type=single-node
````

Запуск:

````shell
vasi@v:~/po/opensearch/ok$ ./run.sh
````

ЖДАТЬ!!!

Admin panel: http://127.0.0.1:5601/

http://127.0.0.1:5601/app/home

SUDO_COMMAND=/usr/bin/env OPENSEARCH_INITIAL_ADMIN_PASSWORD=B...67
SUDO_USER=vasi

/usr/share/opensearch/config/

TODO: сделать тестовый проект.
https://habr.com/ru/companies/nixys/articles/588609/

vasi@vasi-note:~$ docker ps -a
CONTAINER ID   IMAGE                                           COMMAND                  CREATED        STATUS                  PORTS                                                                                                          NAMES
84c3d4b6196f   opensearchproject/opensearch-dashboards:1.1.0   "./opensearch-dashbo…"   20 hours ago   Up 20 hours             0.0.0.0:5601->5601/tcp, [::]:5601->5601/tcp                                                                    marketplace_os_dashboards
2510f0bdb5dd   marketplace-service_opensearch                  "./opensearch-docker…"   20 hours ago   Up 20 hours (healthy)   0.0.0.0:9200->9200/tcp, [::]:9200->9200/tcp, 9300/tcp, 0.0.0.0:9600->9600/tcp, [::]:9600->9600/tcp, 9650/tcp   marketplace_os


curl http://localhost:9200
{
  "name" : "marketplace_os",
  "cluster_name" : "docker-cluster",
  "cluster_uuid" : "jAScg263Tw2-0X2_I23JLw",
  "version" : {
    "distribution" : "opensearch",
    "number" : "1.1.0",
    "build_type" : "tar",
    "build_hash" : "15e9f137622d878b79103df8f82d78d782b686a1",
    "build_date" : "2021-10-04T21:29:03.079792Z",
    "build_snapshot" : false,
    "lucene_version" : "8.9.0",
    "minimum_wire_compatibility_version" : "6.8.0",
    "minimum_index_compatibility_version" : "6.0.0-beta1"
  },
  "tagline" : "The OpenSearch Project: https://opensearch.org/"
}

