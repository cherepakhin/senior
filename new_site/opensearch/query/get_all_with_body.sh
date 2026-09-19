#!/bin/bash

# Get information from the Elasticsearch server
curl -X GET "https://v:9200/_search?pretty" -H 'Content-Type: application/json' -ku admin:$ES_PASS -d'{  "query": {    "match_all": {}  }}'