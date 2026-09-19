1. Установка переменной пароля OpenSearch
````shell
   export ES_PASS=B.._.7
   ````
2. Запустить (run_opensearch.sh)
 ````shell
docker run -it -p 9200:9200 -p 9600:9600 -e OPENSEARCH_INITIAL_ADMIN_PASSWORD=$ES_PASS -e "discovery.type=single-node"  --name opensearch-node opensearchproject/opensearch:latest 
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
4. Примеры запросов к OpenSearch в папке __query__.  
