# id=2 указан в _doc/2
curl -X PUT "https://v:9200/students/_doc/2" -H 'Content-Type: application/json' -ku admin:$ES_PASS -d'
{
  "name": "Igor",
  "gpa": 3.89,
  "grad_year": 1967
}'
