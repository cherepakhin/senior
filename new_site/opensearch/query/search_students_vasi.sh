curl -X GET "https://v:9200/students/_search?q=name:vasi" -ku admin:$ES_PASS -H 'Content-Type: application/json' | jq

