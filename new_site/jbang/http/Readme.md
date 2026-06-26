Для HTTP запросов используется javax.ws.rs.
Код __myfile.java__ взят из [https://www.baeldung.com/jbang-guide](https://www.baeldung.com/jbang-guide)

Запуск:
````shell
jbang myfile.java
````

Запрос:
````shell
http http://127.0.0.1:8080/hello
````

Ответ:
````text
HTTP/1.1 200 OK
Content-Type: application/octet-stream
content-length: 33

Hello from Quarkus with jbang.dev
````
=============================

````shell
jbang template list
````
Вывод:
````text
agent
Agent template
cli
CLI template
gpt
Template using ChatGPT (requires --preview and OPENAI_API_KEY)
gpt.groovy
Template using ChatGPT for groovy (requires --preview and OPENAI_API_KEY)
gpt.kt
Template using ChatGPT for kotlin (requires --preview and OPENAI_API_KEY)
hello
Basic Hello World template
hello.groovy
Basic groovy Hello World template
hello.kt
Basic kotlin Hello World template
jbang-catalog
Template for creating a new JBang catalog hosted on github with automatic renovate updates
qcli
Quarkus CLI template
qmetrics
Quarkus Metrics template
qrest
Quarkus REST template
readme.md
Basic markdown readme template
````
