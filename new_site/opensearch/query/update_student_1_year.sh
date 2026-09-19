curl -X POST "https://v:9200/students/_update/1" -ku admin:$ES_PASS -H 'Content-Type: application/json' -d'{
 "doc": {
    "grad_year": 1967
  }
}
'| jq
