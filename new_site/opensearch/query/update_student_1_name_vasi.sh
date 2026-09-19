curl -X POST "https://v:9200/students/_update/1" -ku admin:$ES_PASS -H 'Content-Type: application/json' -d'{
 "doc": {
    "name": "Vasi",
    "gpa": 3.89,
    "grad_year": 2024
  }
}
'| jq
