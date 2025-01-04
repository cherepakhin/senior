Источник:
https://www.elastic.co/guide/en/elasticsearch/reference/current/targz.html

Установка:
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-8.11.0-linux-x86_64.tar.gz
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-8.11.0-linux-x86_64.tar.gz.sha512
shasum -a 512 -c elasticsearch-8.11.0-linux-x86_64.tar.gz.sha512
tar -xzf elasticsearch-8.11.0-linux-x86_64.tar.gz
cd elasticsearch-8.11.0/


22.10
ЗАПУСТИЛОСЬ БЕЗ DOCKER.
==================
Перед запуском
==================
vasi@v:~$ echo $JAVA_HOME
/usr/lib/jvm/java-1.11.0-openjdk-amd64/
(Но elastic использует свою java JVM /home/vasi/po/elasticsearch-8.1.1/jdk
[Eclipse Adoptium/OpenJDK 64-Bit Server VM/17.0.2/17.0.2+8. См.ниже
"warning: ignoring JAVA_HOME=/usr/lib/jvm/java-1.11.0-openjdk-amd64/; using bundled JDK")
vasi@v:~/po/elasticsearch-8.1.1/jdk/bin$ ./java --version
openjdk 17.0.2 2022-01-18

==================
Запуск
==================
vasi@v:~/po/elasticsearch-8.1.1/bin$ ./elasticsearch
----------------------------------------
Log:
warning: ignoring JAVA_HOME=/usr/lib/jvm/java-1.11.0-openjdk-amd64/; using bundled JDK
warning: ignoring JAVA_HOME=/usr/lib/jvm/java-1.11.0-openjdk-amd64/; using bundled JDK
warning: ignoring JAVA_HOME=/usr/lib/jvm/java-1.11.0-openjdk-amd64/; using bundled JDK
[2024-11-22T11:41:51,531][INFO ][o.e.n.Node               ] [v.perm.ru] version[8.1.1], pid[358443], build[default/tar/d0925dd6f22e07b935750420a3155db6e5c58381/2022-03-17T22:01:32.658689558Z], OS[Linux/6.8.0-47-generic/amd64], JVM[Eclipse Adoptium/OpenJDK 64-Bit Server VM/17.0.2/17.0.2+8]
[2024-11-22T11:41:51,537][INFO ][o.e.n.Node               ] [v.perm.ru] JVM home [/home/vasi/po/elasticsearch-8.1.1/jdk], using bundled JDK [true]
[2024-11-22T11:41:51,537][INFO ][o.e.n.Node               ] [v.perm.ru] JVM arguments [-Xshare:auto, -Des.networkaddress.cache.ttl=60, -Des.networkaddress.cache.negative.ttl=10, -Djava.security.manager=allow, -XX:+AlwaysPreTouch, -Xss1m, -Djava.awt.headless=true, -Dfile.encoding=UTF-8, -Djna.nosys=true, -XX:-OmitStackTraceInFastThrow, -XX:+ShowCodeDetailsInExceptionMessages, -Dio.netty.noUnsafe=true, -Dio.netty.noKeySetOptimization=true, -Dio.netty.recycler.maxCapacityPerThread=0, -Dio.netty.allocator.numDirectArenas=0, -Dlog4j.shutdownHookEnabled=false, -Dlog4j2.disable.jmx=true, -Dlog4j2.formatMsgNoLookups=true, -Djava.locale.providers=SPI,COMPAT, --add-opens=java.base/java.io=ALL-UNNAMED, -XX:+UseG1GC, -Djava.io.tmpdir=/tmp/elasticsearch-6176186819399335581, -XX:+HeapDumpOnOutOfMemoryError, -XX:+ExitOnOutOfMemoryError, -XX:HeapDumpPath=data, -XX:ErrorFile=logs/hs_err_pid%p.log, -Xlog:gc*,gc+age=trace,safepoint:file=logs/gc.log:utctime,pid,tags:filecount=32,filesize=64m, -Xms5822m, -Xmx5822m, -XX:MaxDirectMemorySize=3053453312, -XX:G1HeapRegionSize=4m, -XX:InitiatingHeapOccupancyPercent=30, -XX:G1ReservePercent=15, -Des.path.home=/home/vasi/po/elasticsearch-8.1.1, -Des.path.conf=/home/vasi/po/elasticsearch-8.1.1/config, -Des.distribution.flavor=default, -Des.distribution.type=tar, -Des.bundled_jdk=true]
[2024-11-22T11:41:54,313][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [aggs-matrix-stats]
[2024-11-22T11:41:54,314][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [analysis-common]
[2024-11-22T11:41:54,314][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [constant-keyword]
[2024-11-22T11:41:54,314][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [data-streams]
[2024-11-22T11:41:54,314][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [frozen-indices]
[2024-11-22T11:41:54,315][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [ingest-common]
[2024-11-22T11:41:54,315][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [ingest-geoip]
[2024-11-22T11:41:54,315][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [ingest-user-agent]
[2024-11-22T11:41:54,315][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [kibana]
[2024-11-22T11:41:54,316][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [lang-expression]
[2024-11-22T11:41:54,316][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [lang-mustache]
[2024-11-22T11:41:54,316][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [lang-painless]
[2024-11-22T11:41:54,316][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [legacy-geo]
[2024-11-22T11:41:54,317][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [mapper-extras]
[2024-11-22T11:41:54,317][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [mapper-version]
[2024-11-22T11:41:54,317][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [old-lucene-versions]
[2024-11-22T11:41:54,317][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [parent-join]
[2024-11-22T11:41:54,317][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [percolator]
[2024-11-22T11:41:54,318][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [rank-eval]
[2024-11-22T11:41:54,318][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [reindex]
[2024-11-22T11:41:54,318][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [repositories-metering-api]
[2024-11-22T11:41:54,318][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [repository-azure]
[2024-11-22T11:41:54,319][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [repository-encrypted]
[2024-11-22T11:41:54,319][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [repository-gcs]
[2024-11-22T11:41:54,319][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [repository-s3]
[2024-11-22T11:41:54,319][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [repository-url]
[2024-11-22T11:41:54,320][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [runtime-fields-common]
[2024-11-22T11:41:54,320][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [search-business-rules]
[2024-11-22T11:41:54,320][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [searchable-snapshots]
[2024-11-22T11:41:54,320][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [snapshot-based-recoveries]
[2024-11-22T11:41:54,321][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [snapshot-repo-test-kit]
[2024-11-22T11:41:54,321][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [spatial]
[2024-11-22T11:41:54,321][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [transform]
[2024-11-22T11:41:54,321][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [transport-netty4]
[2024-11-22T11:41:54,321][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [unsigned-long]
[2024-11-22T11:41:54,322][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [vector-tile]
[2024-11-22T11:41:54,322][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [vectors]
[2024-11-22T11:41:54,322][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [wildcard]
[2024-11-22T11:41:54,322][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [x-pack-aggregate-metric]
[2024-11-22T11:41:54,322][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [x-pack-analytics]
[2024-11-22T11:41:54,323][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [x-pack-async]
[2024-11-22T11:41:54,323][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [x-pack-async-search]
[2024-11-22T11:41:54,323][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [x-pack-autoscaling]
[2024-11-22T11:41:54,323][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [x-pack-ccr]
[2024-11-22T11:41:54,324][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [x-pack-core]
[2024-11-22T11:41:54,324][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [x-pack-deprecation]
[2024-11-22T11:41:54,324][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [x-pack-enrich]
[2024-11-22T11:41:54,324][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [x-pack-eql]
[2024-11-22T11:41:54,324][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [x-pack-fleet]
[2024-11-22T11:41:54,324][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [x-pack-graph]
[2024-11-22T11:41:54,325][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [x-pack-identity-provider]
[2024-11-22T11:41:54,325][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [x-pack-ilm]
[2024-11-22T11:41:54,325][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [x-pack-logstash]
[2024-11-22T11:41:54,325][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [x-pack-ml]
[2024-11-22T11:41:54,325][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [x-pack-monitoring]
[2024-11-22T11:41:54,326][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [x-pack-ql]
[2024-11-22T11:41:54,326][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [x-pack-rollup]
[2024-11-22T11:41:54,326][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [x-pack-security]
[2024-11-22T11:41:54,326][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [x-pack-shutdown]
[2024-11-22T11:41:54,326][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [x-pack-sql]
[2024-11-22T11:41:54,327][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [x-pack-stack]
[2024-11-22T11:41:54,327][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [x-pack-text-structure]
[2024-11-22T11:41:54,327][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [x-pack-voting-only-node]
[2024-11-22T11:41:54,327][INFO ][o.e.p.PluginsService     ] [v.perm.ru] loaded module [x-pack-watcher]
[2024-11-22T11:41:54,328][INFO ][o.e.p.PluginsService     ] [v.perm.ru] no plugins loaded
[2024-11-22T11:41:54,372][INFO ][o.e.e.NodeEnvironment    ] [v.perm.ru] using [1] data paths, mounts [[/ (/dev/sda3)]], net usable_space [187.7gb], net total_space [365.2gb], types [ext4]
[2024-11-22T11:41:54,373][INFO ][o.e.e.NodeEnvironment    ] [v.perm.ru] heap size [5.6gb], compressed ordinary object pointers [true]
[2024-11-22T11:41:54,437][INFO ][o.e.n.Node               ] [v.perm.ru] node name [v.perm.ru], node ID [9NVvBuA6Qim3F5-_1CivHw], cluster name [elasticsearch], roles [data_warm, data_content, transform, data_hot, ml, data_frozen, ingest, data_cold, data, remote_cluster_client, master]
[2024-11-22T11:41:59,466][INFO ][o.e.x.m.p.l.CppLogMessageHandler] [v.perm.ru] [controller/358722] [Main.cc@123] controller (64 bit): Version 8.1.1 (Build f5fbdbeecb0643) Copyright (c) 2022 Elasticsearch BV
[2024-11-22T11:41:59,594][INFO ][o.e.x.s.Security         ] [v.perm.ru] Security is disabled
[2024-11-22T11:42:00,410][INFO ][o.e.t.n.NettyAllocator   ] [v.perm.ru] creating NettyAllocator with the following configs: [name=elasticsearch_configured, chunk_size=1mb, suggested_max_allocation_size=1mb, factors={es.unsafe.use_netty_default_chunk_and_page_size=false, g1gc_enabled=true, g1gc_region_size=4mb}]
[2024-11-22T11:42:00,438][INFO ][o.e.i.r.RecoverySettings ] [v.perm.ru] using rate limit [40mb] with [default=40mb, read=0b, write=0b, max=0b]
[2024-11-22T11:42:00,474][INFO ][o.e.d.DiscoveryModule    ] [v.perm.ru] using discovery type [multi-node] and seed hosts providers [settings]
[2024-11-22T11:42:01,364][INFO ][o.e.n.Node               ] [v.perm.ru] initialized
[2024-11-22T11:42:01,364][INFO ][o.e.n.Node               ] [v.perm.ru] starting ...
[2024-11-22T11:42:01,595][INFO ][o.e.x.s.c.f.PersistentCache] [v.perm.ru] persistent cache index loaded
[2024-11-22T11:42:01,597][INFO ][o.e.x.d.l.DeprecationIndexingComponent] [v.perm.ru] deprecation component started
[2024-11-22T11:42:01,704][INFO ][o.e.t.TransportService   ] [v.perm.ru] publish_address {192.168.1.20:9300}, bound_addresses {192.168.1.20:9300}
[2024-11-22T11:42:02,697][INFO ][o.e.b.BootstrapChecks    ] [v.perm.ru] bound or publishing to a non-loopback address, enforcing bootstrap checks
[2024-11-22T11:42:02,700][INFO ][o.e.c.c.Coordinator      ] [v.perm.ru] cluster UUID [g3ojVaUHRuefR6zTbSa-FA]
[2024-11-22T11:42:03,057][INFO ][o.e.c.s.MasterService    ] [v.perm.ru] elected-as-master ([1] nodes joined)[{v.perm.ru}{9NVvBuA6Qim3F5-_1CivHw}{6fEAYJNeR1WxjP2OmgsGOg}{192.168.1.20}{192.168.1.20:9300}{cdfhilmrstw} completing election, _BECOME_MASTER_TASK_, _FINISH_ELECTION_], term: 12, version: 159, delta: master node changed {previous [], current [{v.perm.ru}{9NVvBuA6Qim3F5-_1CivHw}{6fEAYJNeR1WxjP2OmgsGOg}{192.168.1.20}{192.168.1.20:9300}{cdfhilmrstw}]}
[2024-11-22T11:42:03,397][INFO ][o.e.c.s.ClusterApplierService] [v.perm.ru] master node changed {previous [], current [{v.perm.ru}{9NVvBuA6Qim3F5-_1CivHw}{6fEAYJNeR1WxjP2OmgsGOg}{192.168.1.20}{192.168.1.20:9300}{cdfhilmrstw}]}, term: 12, version: 159, reason: Publication{term=12, version=159}
[2024-11-22T11:42:03,446][INFO ][o.e.h.AbstractHttpServerTransport] [v.perm.ru] publish_address {192.168.1.20:9200}, bound_addresses {[::1]:9200}, {127.0.0.1:9200}, {192.168.1.20:9200}
[2024-11-22T11:42:03,447][INFO ][o.e.n.Node               ] [v.perm.ru] started
[2024-11-22T11:42:03,964][INFO ][o.e.l.LicenseService     ] [v.perm.ru] license [fc40e350-7072-41dc-a1c0-16b7a52c83e4] mode [basic] - valid
[2024-11-22T11:42:03,969][INFO ][o.e.g.GatewayService     ] [v.perm.ru] recovered [2] indices into cluster_state
[2024-11-22T11:42:05,956][INFO ][o.e.c.r.a.AllocationService] [v.perm.ru] current.health="GREEN" message="Cluster health status changed from [RED] to [GREEN] (reason: [shards started [[.geoip_databases][0]]])." previous.health="RED" reason="shards started [[.geoip_databases][0]]"
[2024-11-22T11:42:06,190][INFO ][o.e.i.g.DatabaseNodeService] [v.perm.ru] retrieve geoip database [GeoLite2-City.mmdb] from [.geoip_databases] to [/tmp/elasticsearch-6176186819399335581/geoip-databases/9NVvBuA6Qim3F5-_1CivHw/GeoLite2-City.mmdb.tmp.gz]
[2024-11-22T11:42:06,193][INFO ][o.e.i.g.DatabaseNodeService] [v.perm.ru] retrieve geoip database [GeoLite2-Country.mmdb] from [.geoip_databases] to [/tmp/elasticsearch-6176186819399335581/geoip-databases/9NVvBuA6Qim3F5-_1CivHw/GeoLite2-Country.mmdb.tmp.gz]
[2024-11-22T11:42:06,194][INFO ][o.e.i.g.DatabaseNodeService] [v.perm.ru] retrieve geoip database [GeoLite2-ASN.mmdb] from [.geoip_databases] to [/tmp/elasticsearch-6176186819399335581/geoip-databases/9NVvBuA6Qim3F5-_1CivHw/GeoLite2-ASN.mmdb.tmp.gz]
[2024-11-22T11:42:06,494][INFO ][o.e.i.g.DatabaseNodeService] [v.perm.ru] successfully loaded geoip database file [GeoLite2-Country.mmdb]
[2024-11-22T11:42:06,506][INFO ][o.e.i.g.DatabaseNodeService] [v.perm.ru] successfully loaded geoip database file [GeoLite2-ASN.mmdb]
[2024-11-22T11:42:07,136][INFO ][o.e.i.g.DatabaseNodeService] [v.perm.ru] successfully loaded geoip database file [GeoLite2-City.mmdb]

----------------------------------------
publish_address {192.168.1.20:9300}, bound_addresses {192.168.1.20:9300}
[2024-11-22T11:42:03,964][INFO ][o.e.l.LicenseService     ] [v.perm.ru] license [fc40e350-7072-41dc-a1c0-16b7a52c83e4] mode [basic] - valid

Проверка
vasi@v:~$ http  http://127.0.0.1:9200

HTTP/1.1 200 OK
X-elastic-product: Elasticsearch
content-encoding: gzip
content-length: 324
content-type: application/json

{
    "cluster_name": "elasticsearch",
    "cluster_uuid": "g3ojVaUHRuefR6zTbSa-FA",
    "name": "v.perm.ru",
    "tagline": "You Know, for Search",
    "version": {
        "build_date": "2022-03-17T22:01:32.658689558Z",
        "build_flavor": "default",
        "build_hash": "d0925dd6f22e07b935750420a3155db6e5c58381",
        "build_snapshot": false,
        "build_type": "tar",
        "lucene_version": "9.0.0",
        "minimum_index_compatibility_version": "7.0.0",
        "minimum_wire_compatibility_version": "7.17.0",
        "number": "8.1.1"
    }
}

Удаленно тоже работает:
vasi@vasi-note:~$ http  http://192.168.1.20:9200

HTTP/1.1 200 OK
X-elastic-product: Elasticsearch
content-encoding: gzip
content-length: 324
content-type: application/json

{
    "cluster_name": "elasticsearch",
    "cluster_uuid": "g3ojVaUHRuefR6zTbSa-FA",
    "name": "v.perm.ru",
    "tagline": "You Know, for Search",
    "version": {
        "build_date": "2022-03-17T22:01:32.658689558Z",
        "build_flavor": "default",
        "build_hash": "d0925dd6f22e07b935750420a3155db6e5c58381",
        "build_snapshot": false,
        "build_type": "tar",
        "lucene_version": "9.0.0",
        "minimum_index_compatibility_version": "7.0.0",
        "minimum_wire_compatibility_version": "7.17.0",
        "number": "8.1.1"
    }
}
=============================================
Запуск как демон
(6GB!!!!)
$ ./bin/elasticsearch -d -p pid
в файл "pid" запишется номер процеса

Для остановки:
$ pkill -F pid
=============================================
Основная конфигурация в /home/vasi/po/elasticsearch-8.1.1/config/elasticsearch.yml

/home/vasi/po/elasticsearch-8.1.1
[2024-11-23T22:51:34.523+05:00][ERROR][elasticsearch-service] This version of
Kibana (v8.15.2) is incompatible with the following Elasticsearch nodes in your

Elasticsearch: v8.1.1 @ 192.168.1.20:9200 (192.168.1.20)
vasi@v:~/po/elasticsearch-8.1.1/bin$ curl -XGET 'localhost:9200'
{
  "name" : "v.perm.ru",
  "cluster_name" : "elasticsearch",
  "cluster_uuid" : "g3ojVaUHRuefR6zTbSa-FA",
  "version" : {
    "number" : "8.1.1",
    "build_flavor" : "default",
    "build_type" : "tar",
    "build_hash" : "d0925dd6f22e07b935750420a3155db6e5c58381",
    "build_date" : "2022-03-17T22:01:32.658689558Z",
    "build_snapshot" : false,
    "lucene_version" : "9.0.0",
    "minimum_wire_compatibility_version" : "7.17.0",
    "minimum_index_compatibility_version" : "7.0.0"
  },
  "tagline" : "You Know, for Search"
}
-----------------------------------------------------------------

Выделение памяти для ElasticSearch
Параметры JVM  в /home/vasi/po/elasticsearch-8.1.1/config/jvm.options
....
-Xms2g
-Xmx2g
....

-----------------------------------------------------------------

https://habr.com/ru/articles/662527/
23 апр 2022 в 11:43
OpenSearch – система полнотекстового поиска. Является ФОРКОМ Elasticsearch. Разработана компанией A9.com, дочерней компанией Amazon.com. В 2021 году Amazon создает новый форк и называет его «OpenSearch».
Стэк OpenSearch (OpenSearch + Logstash-oss-with-OpenSearch-output-plugin + OpenSearch–Dashboards) является бесплатным аналогом с отрытым исходным кодом стэку ELK (Elasticsearch + Logstash + Kibana). В совокупности с Beat’ами (Filebeat, Winlogbeat, и т.д.) образуют полный цикл управления логами: сбор, систематизация, поиск.