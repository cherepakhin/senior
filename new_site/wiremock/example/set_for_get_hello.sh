# Файл для настройки wiremock. Выполнить после запуска ./run.sh
# GET на URL http://127.0.0.1:8080/get/this вернуть "Here it is!"
curl -X POST --data '{ "request": { "url": "/get/this", "method": "GET" }, "response": { "status": 200, "body": "Here it is!\n" }}' http://localhost:8080/__admin/mappings
# Проверка curl http://localhost:8080/get/this