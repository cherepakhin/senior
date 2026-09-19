1. Установка переменной пароля OpenSearch
````shell
   export ES_PASS=B.._.7
   ````
2. Запустить
 ````shell
run_opensearch.sh 
````
(B.._.7)
2. Просмотр nodes 
````shell
 curl -X GET "https://localhost:9200/_cat/nodes?v" -ku admin:<password>
````
3. Просмотр plugins 
````shell
curl -X GET "https://localhost:9200/_cat/plugins?v" -ku admin:<password>
````

