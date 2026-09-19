curl -X GET "https://v:9200/students/_search?pretty" -ku admin:Bazilio_67 -H 'Content-Type: application/json' -d'
{
    "query": {
        "bool": {
            "filter": [
                {
                  "range": {
                    "grad_year": { "lt": "1967"}
                  }
                }
            ]
        }
    }
}'
