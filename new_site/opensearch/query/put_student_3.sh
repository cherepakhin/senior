# id=2 указан в _doc/2
curl -X PUT "https://v:9200/students/_doc/3" -H 'Content-Type: application/json' -ku admin:Bazilio_67 -d'
{
  "name": "Sveta",
  "gpa": 4,
  "grad_year": 1966
}'
