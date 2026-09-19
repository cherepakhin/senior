#!/bin/bash

# get all students
curl -X GET "https://v:9200/students/_search?pretty" -ku admin:$ES_PASS -H 'Content-Type: application/json' -d'
{
  "query": {
    "match_all": {}
  }
}' | jq

