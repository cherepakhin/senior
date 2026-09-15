### Spring Boot, H2, JSP

Проект из [https://github.com/mmafrar/spring-mvc-crud-example.git](https://github.com/mmafrar/spring-mvc-crud-example.git)

ЭТО __JSP__!!!

Java 21

````shell
export JAVA_HOME=/usr/lib/jvm/java-1.21.0-openjdk-amd64
````

Тестов нет.

[run.sh](run.sh):

````
./gradlew bootRun
````

[http://127.0.0.1:8080/api/v1/index](http://127.0.0.1:8080/api/v1/index)
"Hello World!"

[http://127.0.0.1:8080/](http://127.0.0.1:8080/)
![doc/screen1.png](doc/screen1.png)

[http://127.0.0.1:8080/read-contact](http://127.0.0.1:8080/read-contact)
![doc/read-contact.png](doc/read-contact.png)

[http://127.0.0.1:8080/create-contact](http://127.0.0.1:8080/create-contact)
![doc/create-contact.png](doc/create-contact.png)

![doc/form_fill.png](doc/form_fill.png)

![doc/contacts_after_add.png](doc/contacts_after_add.png)

Стартовая страница index.html в папке [resources/static/index.html](resources/static/index.html).
А в ней уже ссылка на JSP и т.д.