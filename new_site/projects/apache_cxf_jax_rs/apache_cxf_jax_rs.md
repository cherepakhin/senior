# Демонстрация Apache CXF (REST-API JAX-RS)

Apache CXF — это открытый фреймворк для разработки и развёртывания веб-сервисов и REST-API на Java. Он помогает создавать сервисы, используя стандартные API, такие как JAX-WS (для SOAP) и JAX-RS (для REST).

Здесь демонстрируется использование Apache CXF для создания JAX-RS (для REST-API).

### Тестирование

#### Запуск сервиса

Сборка:
````shell
mvn clean package
````

Запуск:
````shell
/usr/lib/jvm/java-8-openjdk-amd64/bin/java -jar target/jaxrs-1.0.0.jar
````

#### Проверка:

````shell
http http://127.0.0.1:5000/movieservice/movie/1001/
````

Ответ:

````text
HTTP/1.1 200 OK
Content-Type: application/json
Server: Jetty(9.4.12.v20180830)
Transfer-Encoding: chunked

{
"id": 1001,
"name": "Aquaman"
}
````


### Ссылки

* [Apache CXF Samples](https://github.com/apache/cxf/blob/main/distribution/src/main/release/samples)