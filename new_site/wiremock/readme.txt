WireMock – швейцарский нож в арсенале тестировщика.
Часть 1 https://habr.com/ru/companies/rostelecom/articles/679276/
Часть 2 https://habr.com/ru/company/rostelecom/blog/679330/

Можно использовать для эмуляции стороннего сервиса.
На пример: разрабатываю proxy сервис для работы с удаленным сервисом.
Удаленный сервис может быть перегружен, лимитирован или вообще периодически в отключке.
В случае с МТ.. , нужна была эмуляция сервиса авторизации,
ктр. работал через раз, и пришлось кешировать его ответы. Для unit тестов хватило Mockito.

$ cd v/tools/
$ java -jar wiremock.jar

vasi@vasi-note:~/tools$ java -jar wiremock-jre8-standalone-2.33.2.jar
SLF4J: Failed to load class "org.slf4j.impl.StaticLoggerBinder".
SLF4J: Defaulting to no-operation (NOP) logger implementation
SLF4J: See http://www.slf4j.org/codes.html#StaticLoggerBinder for further details.
 /$$      /$$ /$$                     /$$      /$$                     /$$
| $$  /$ | $$|__/                    | $$$    /$$$                    | $$
| $$ /$$$| $$ /$$  /$$$$$$   /$$$$$$ | $$$$  /$$$$  /$$$$$$   /$$$$$$$| $$   /$$
| $$/$$ $$ $$| $$ /$$__  $$ /$$__  $$| $$ $$/$$ $$ /$$__  $$ /$$_____/| $$  /$$/
| $$$$_  $$$$| $$| $$  \__/| $$$$$$$$| $$  $$$| $$| $$  \ $$| $$      | $$$$$$/
| $$$/ \  $$$| $$| $$      | $$_____/| $$\  $ | $$| $$  | $$| $$      | $$_  $$
| $$/   \  $$| $$| $$      |  $$$$$$$| $$ \/  | $$|  $$$$$$/|  $$$$$$$| $$ \  $$
|__/     \__/|__/|__/       \_______/|__/     |__/ \______/  \_______/|__/  \__/

port:                         8080
enable-browser-proxying:      false
disable-banner:               false
no-request-journal:           false
verbose:                      false
