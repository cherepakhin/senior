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

