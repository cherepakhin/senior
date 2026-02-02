Проект: vasi-note:~/prog/java/spring-boot/camunda_springboot_db

# create database camunda_example
# \connect camunda_example;

$ psql --dbname=camunda_example

Параметры подключения указать в application.yml:

````
spring:
  datasource:
    url: ${PG_URL:jdbc:postgresql://127.0.0.1:5432/camunda_example}
    username: ${PG_USER:postgres}
    password: ${PG_PASSWORD:postgres}
  jpa:
    hibernate:
      ddl-auto: update
camunda:
  bpm:
    admin-user:
      password: demo
      id: demo
      first-name: Demo
      last-name: Demo
      email: vasi.che@gmail.com
````

(!!!Как-то создал БД)

Работа с Camunda
http://localhost:8080/
будет перенаправлено на http://localhost:8080/camunda/app/welcome/default/#!/welcome

Вход в Camunda admin:
http://localhost:8080/camunda/app/admin/default/#/system?section=system-settings-general

login.png

User: demo
Password: demo

after_login.png


