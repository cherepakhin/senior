#!/bin/bash

# Get nodes. Results:
# ip         heap.percent ram.percent cpu load_1m load_5m load_15m node.role node.roles                                        cluster_manager name
# 172.17.0.2           63          97   7    0.60    1.11     0.88 dimr      cluster_manager,data,ingest,remote_cluster_client *               d990c7a69503
curl -X GET "https://v:9200/_cat/nodes?v" -ku admin:$ES_PASS
