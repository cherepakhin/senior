1. Запустить run_opensearch.sh (B.._.7)
2. Просмотр nodes curl -X GET "https://localhost:9200/_cat/nodes?v" -ku admin:<password>
3. Просмотр plugins curl -X GET "https://localhost:9200/_cat/plugins?v" -ku admin:<password>
4. export ES_PASS=B.._.7 - установка переменной пароля OpenSearch