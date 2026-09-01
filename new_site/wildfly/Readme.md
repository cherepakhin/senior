Склонировал [https://github.com/wildfly/wildfly](https://github.com/wildfly/wildfly)

Clone:
````shell
git clone https://github.com/wildfly/wildfly.git
````

### Установка

(на ноуте!!!)

````shell
~/prog/java/wildfly$ ./mvnw install
````

````text
[INFO] ------------------------------------------------------------------------
[INFO] Reactor Summary for WildFly: Parent Aggregator 42.0.0.Beta1-SNAPSHOT:
[INFO]
[INFO] WildFly: Parent Aggregator ......................... SUCCESS [ 25.427 s]
[INFO] WildFly: Naming Subsystem .......................... SUCCESS [01:20 min]
[INFO] WildFly: EE ........................................ SUCCESS [ 20.752 s]
[INFO] WildFly: Application Client Bootstrap .............. SUCCESS [  2.642 s]
[INFO] WildFly: Concurrency SPI ........................... SUCCESS [  2.877 s]
[INFO] WildFly: Weld ...................................... SUCCESS [  0.746 s]
[INFO] WildFly: Weld Subsystem SPI ........................ SUCCESS [  2.644 s]
[INFO] WildFly: Weld Common Tools ......................... SUCCESS [  4.846 s]
[INFO] WildFly: IIOP Openjdk Subsystem .................... SUCCESS [02:19 min]
[INFO] WildFly: Transaction Subsystem ..................... SUCCESS [ 19.092 s]
[INFO] WildFly: Batch Integration Subsystem (JBeret implementation) SUCCESS [01:05 min]
[INFO] WildFly: Bean Validation ........................... SUCCESS [  7.371 s]
[INFO] WildFly: Common Dependency Management (Base Dependencies) SUCCESS [  0.103 s]
[INFO] WildFly: Shared Standard and Legacy Dependency Management (Base Dependencies) SUCCESS [  0.084 s]
[INFO] WildFly: Shared Standard and Preview Dependency Management (Base Dependencies) SUCCESS [  0.181 s]
[INFO] WildFly: Dependency Management (Base Dependencies) . SUCCESS [  0.049 s]
[INFO] WildFly: BOM of Test Dependencies .................. SUCCESS [  0.034 s]
[INFO] WildFly: EE Feature-Pack Parent .................... SUCCESS [  0.039 s]
[INFO] WildFly: EE Feature-Pack Product Configuration ..... SUCCESS [  0.419 s]
[INFO] WildFly: EE Feature-Pack Local Galleon Content ..... SUCCESS [  1.006 s]
[INFO] WildFly: EE Feature-Pack Shared Galleon Content -- Legacy SUCCESS [  2.718 s]
[INFO] WildFly: JPA ....................................... SUCCESS [  0.039 s]
[INFO] WildFly: Jipijapa SPI .............................. SUCCESS [  1.872 s]
[INFO] WildFly: Jipijapa Hibernate 7 (JPA 3.2) integration  SUCCESS [ 29.364 s]
[INFO] WildFly: Clustering subsystems and modules ......... SUCCESS [  6.491 s]
[INFO] WildFly: Server clustering modules ................. SUCCESS [  0.171 s]
[INFO] WildFly: Public server clustering API .............. SUCCESS [  1.640 s]
[INFO] WildFly: Server clustering requirements/services ... SUCCESS [  1.986 s]
[INFO] WildFly: Connector Subsystem ....................... SUCCESS [01:01 min]
[INFO] WildFly: Clustering services ....................... SUCCESS [  0.763 s]
[INFO] WildFly: Common code for clustering subsystems ..... SUCCESS [  5.745 s]
[INFO] WildFly: SFSB clustering ........................... SUCCESS [  0.250 s]
[INFO] WildFly: SFSB clustering - SPI ..................... SUCCESS [  2.524 s]
[INFO] WildFly: Infinispan modules ........................ SUCCESS [  0.245 s]
[INFO] WildFly: Infinispan embedded modules ............... SUCCESS [  0.112 s]
[INFO] WildFly: Infinispan embedded services .............. SUCCESS [  7.048 s]
[INFO] WildFly: Singleton modules ......................... SUCCESS [  0.113 s]
[INFO] WildFly: Singleton API ............................. SUCCESS [ 10.056 s]
[INFO] WildFly: EJB client clustering module .............. SUCCESS [  9.965 s]
[INFO] WildFly: Common abstractions for cache-based bean manager implementations SUCCESS [ 18.357 s]
[INFO] WildFly: SFSB clustering - Infinispan integration .. SUCCESS [ 18.349 s]
[INFO] WildFly: EJB Subsystem ............................. SUCCESS [02:20 min]
[INFO] WildFly: JPA Subsystem ............................. SUCCESS [  8.266 s]
[INFO] WildFly: Persistence 3.2 PersistenceCdiExtension service implementation SUCCESS [  0.605 s]
[INFO] WildFly: Concurrency Impl 3.1 ...................... SUCCESS [  6.508 s]
[INFO] WildFly: JPA Subsystem -- Persistence 3.2 .......... SUCCESS [  0.428 s]
[INFO] WildFly: EE Feature-Pack Shared Galleon Content -- Preview SUCCESS [ 44.966 s]
[INFO] WildFly: Jipijapa EclipseLink integration .......... SUCCESS [  4.557 s]
[INFO] WildFly: Jipijapa Hibernate Search integration ..... SUCCESS [  0.685 s]
[INFO] WildFly: Jakarta Enterprise Beans and Jakarta Messaging client combined properties SUCCESS [  0.265 s]
[INFO] WildFly: Jakarta Data Integration .................. SUCCESS [  6.049 s]
[INFO] WildFly: Clustering marshalling modules ............ SUCCESS [  0.070 s]
[INFO] WildFly: Marshalling for WildFly clustering: ProtoStream integration SUCCESS [  0.318 s]
[INFO] WildFly: Distributable EJB Subsystem ............... SUCCESS [ 17.247 s]
[INFO] WildFly: Clustering Jakarta Expression Language API modules SUCCESS [  0.073 s]
[INFO] WildFly: Clustering support for the Eclipse Expressly implementation of the Jakarta Expression Language API SUCCESS [  3.802 s]
[INFO] WildFly: Clustering Jakarta Faces modules .......... SUCCESS [  0.068 s]
[INFO] WildFly: Clustering support for the Jakarta Faces API SUCCESS [  2.840 s]
[INFO] WildFly: Clustering support for the Mojarra implementation of Jakarta Faces SUCCESS [  4.243 s]
[INFO] WildFly: Infinispan client modules ................. SUCCESS [  0.071 s]
[INFO] WildFly: Infinispan Client API ..................... SUCCESS [  9.269 s]
[INFO] WildFly: Infinispan Client requirements and services SUCCESS [  0.725 s]
[INFO] WildFly: JGroups modules ........................... SUCCESS [  0.069 s]
[INFO] WildFly: JGroups API ............................... SUCCESS [  0.259 s]
[INFO] WildFly: JGroups SPI ............................... SUCCESS [  0.393 s]
[INFO] WildFly: Clustering marshalling API ................ SUCCESS [  0.297 s]
[INFO] WildFly: Marshalling for WildFly clustering: JBoss Marshalling integration SUCCESS [  0.351 s]
[INFO] WildFly: JGroups Subsystem ......................... SUCCESS [ 40.078 s]
[INFO] WildFly: Server clustering extension ............... SUCCESS [  1.652 s]
[INFO] WildFly: Infinispan subsystem ...................... SUCCESS [01:23 min]
[INFO] WildFly: Requirements for WildFly clustering singleton service configurators SUCCESS [  0.406 s]
[INFO] WildFly: WildFly clustering singleton service implementation SUCCESS [  4.382 s]
[INFO] WildFly: Singleton extension ....................... SUCCESS [ 14.714 s]
[INFO] WildFly: Web session clustering .................... SUCCESS [  0.069 s]
[INFO] WildFly: Web session clustering API ................ SUCCESS [  0.232 s]
[INFO] WildFly: Web session clustering - Container SPI .... SUCCESS [  1.453 s]
[INFO] WildFly: Web session clustering requirements and service providers SUCCESS [  1.650 s]
[INFO] WildFly: Web Common Classes ........................ SUCCESS [  2.094 s]
[INFO] WildFly: JSF ....................................... SUCCESS [  0.028 s]
[INFO] WildFly: JSF Subsystem ............................. SUCCESS [  3.951 s]
[INFO] WildFly: Distributable Web Subsystem ............... SUCCESS [ 29.672 s]
[INFO] WildFly: Undertow .................................. SUCCESS [ 59.846 s]
[INFO] WildFly: Web session clustering - Undertow integration SUCCESS [  8.713 s]
[INFO] WildFly: Clustering Weld modules ................... SUCCESS [  0.066 s]
[INFO] WildFly: Clustering support for Weld ............... SUCCESS [  6.819 s]
[INFO] WildFly: Weld EJB .................................. SUCCESS [  1.086 s]
[INFO] WildFly: Clustering support for Weld's ejb module .. SUCCESS [  3.036 s]
[INFO] WildFly: Clustering support for Weld's web module .. SUCCESS [  2.865 s]
[INFO] WildFly: Datasources with Agroal connection pool ... SUCCESS [  6.259 s]
[INFO] WildFly: Jakarta Security .......................... SUCCESS [  3.310 s]
[INFO] WildFly: Elytron OpenID Connect Client Extension ... SUCCESS [ 34.591 s]
[INFO] WildFly: Base Health Extension ..................... SUCCESS [  3.698 s]
[INFO] WildFly: JAX-RS Integration ........................ SUCCESS [ 17.133 s]
[INFO] WildFly: JDR ....................................... SUCCESS [  9.957 s]
[INFO] WildFly: JSF Injection Handlers .................... SUCCESS [  0.494 s]
[INFO] WildFly: JSR-77 Subsystem .......................... SUCCESS [  2.764 s]
[INFO] WildFly: Keycloak Subsystem ........................ SUCCESS [  5.208 s]
[INFO] WildFly: Mail subsystem ............................ SUCCESS [  8.441 s]
[INFO] WildFly: Messaging Subsystem Parent With ActiveMQ Artemis SUCCESS [  0.031 s]
[INFO] WildFly: Messaging Injection With ActiveMQ Artemis . SUCCESS [ 13.466 s]
[INFO] WildFly: Messaging Subsystem With ActiveMQ Artemis . SUCCESS [02:00 min]
[INFO] WildFly: Base Metrics Extension .................... SUCCESS [  3.870 s]
[INFO] WildFly: mod_cluster Subsystem ..................... SUCCESS [  0.036 s]
[INFO] WildFly: mod_cluster Extension ..................... SUCCESS [ 20.749 s]
[INFO] WildFly: mod_cluster Undertow Integration .......... SUCCESS [  4.420 s]
[INFO] WildFly: PicketLink Subsystem ...................... SUCCESS [ 10.880 s]
[INFO] WildFly: POJO Subsystem ............................ SUCCESS [  4.616 s]
[INFO] WildFly: RTS Subsystem ............................. SUCCESS [  7.077 s]
[INFO] WildFly: Service Archive Subsystem ................. SUCCESS [  5.546 s]
[INFO] WildFly: Security Subsystem parent ................. SUCCESS [  0.024 s]
[INFO] WildFly: Security Subsystem ........................ SUCCESS [  8.088 s]
[INFO] WildFly: System JMX Module ......................... SUCCESS [  0.476 s]
[INFO] WildFly: Web Services Subsystem .................... SUCCESS [  0.031 s]
[INFO] WildFly: Web Services Server Integration Subsystem . SUCCESS [ 12.608 s]
[INFO] WildFly: XTS Subsystem ............................. SUCCESS [  6.012 s]
[INFO] WildFly: Web Services OpenSAML ConfigurationPropertiesSource Impl SUCCESS [  2.247 s]
[INFO] WildFly: Weld Bean Validation ...................... SUCCESS [  0.492 s]
[INFO] WildFly: Weld Subsystem ............................ SUCCESS [  9.646 s]
[INFO] WildFly: Weld JPA .................................. SUCCESS [  0.524 s]
[INFO] WildFly: Weld Transactions ......................... SUCCESS [  0.335 s]
[INFO] WildFly: Weld Webservices .......................... SUCCESS [  0.405 s]
[INFO] WildFly: EE Feature-Pack Shared Galleon Content .... SUCCESS [01:41 min]
[INFO] WildFly: Jakarta Enterprise Beans and Jakarta Messaging client combined jar SUCCESS [01:04 min]
[INFO] WildFly: EE Full Galleon Pack ...................... SUCCESS [01:37 min]
[INFO] WildFly: EE Feature-Pack Channel ................... SUCCESS [ 49.396 s]
[INFO] WildFly BOM Builders ............................... SUCCESS [  0.036 s]
[INFO] WildFly BOM Builders: Tools Builder ................ SUCCESS [ 25.754 s]
[INFO] WildFly BOM Builders: Client ....................... SUCCESS [  0.112 s]
[INFO] WildFly BOM Builders: Client EJB Builder ........... SUCCESS [03:10 min]
[INFO] WildFly BOM Builders: Client JAXWS Builder ......... SUCCESS [  6.804 s]
[INFO] WildFly BOM Builders: Client JMS Builder ........... SUCCESS [  1.659 s]
[INFO] WildFly BOM Builders: Server ....................... SUCCESS [  0.034 s]
[INFO] WildFly BOM Builders: Server EE .................... SUCCESS [  0.034 s]
[INFO] WildFly BOM Builders: Server EE Standard Builder ... SUCCESS [ 11.295 s]
[INFO] WildFly BOM Builders: Server EE Standard With Tools Builder SUCCESS [  1.240 s]
[INFO] WildFly: Common Dependency Management (Expansion Dependencies) SUCCESS [  0.030 s]
[INFO] WildFly: Dependency Management (Expansion Dependencies) SUCCESS [  0.033 s]
[INFO] WildFly Preview: Dependency Management (Base Dependencies) SUCCESS [  0.038 s]
[INFO] WildFly Preview: Dependency Management (Expansion Dependencies) SUCCESS [  0.030 s]
[INFO] WildFly Preview: Parent ............................ SUCCESS [  0.042 s]
[INFO] WildFly Preview: Feature-Pack Product Configuration  SUCCESS [  0.367 s]
[INFO] WildFly Preview: Feature-Pack Local Galleon Content  SUCCESS [  2.670 s]
[INFO] WildFly: MicroProfile modules ...................... SUCCESS [  0.032 s]
[INFO] WildFly: MicroProfile Config Extension With SmallRye SUCCESS [01:04 min]
[INFO] WildFly: MicroProfile Metrics Extension With SmallRye SUCCESS [  3.750 s]
[INFO] WildFly: Observability modules ..................... SUCCESS [  0.022 s]
[INFO] WildFly: Micrometer API ............................ SUCCESS [  0.233 s]
[INFO] WildFly: Base Micrometer Extension ................. SUCCESS [ 15.587 s]
[INFO] WildFly: MicroProfile Fault Tolerance modules ...... SUCCESS [  0.029 s]
[INFO] WildFly: MicroProfile Fault Tolerance - Deployment . SUCCESS [  1.038 s]
[INFO] WildFly: MicroProfile Fault Tolerance - Extension .. SUCCESS [  4.595 s]
[INFO] WildFly: MicroProfile Health Extension With SmallRye SUCCESS [  7.531 s]
[INFO] WildFly: MicroProfile JWT Extension With SmallRye .. SUCCESS [  3.569 s]
[INFO] WildFly: MicroProfile LRA Extensions ............... SUCCESS [  0.056 s]
[INFO] WildFly: MicroProfile LRA Coordinator extension .... SUCCESS [  5.768 s]
[INFO] WildFly: MicroProfile LRA Participant extension .... SUCCESS [ 10.092 s]
[INFO] WildFly: MicroProfile OpenAPI modules .............. SUCCESS [  0.022 s]
[INFO] WildFly: SPI for MicroProfile OpenAPI .............. SUCCESS [  3.494 s]
[INFO] WildFly: Host service provider for MicroProfile OpenAPI SUCCESS [  1.283 s]
[INFO] WildFly: MicroProfile OpenAPI Extension With SmallRye SUCCESS [  4.314 s]
[INFO] WildFly: OpenTelemetry API ......................... SUCCESS [  7.552 s]
[INFO] WildFly: Base OpenTelemetry Extension .............. SUCCESS [ 11.012 s]
[INFO] WildFly: MicroProfile OpenTracing Extension ........ SUCCESS [  4.530 s]
[INFO] WildFly: MicroProfile Reactive Messaging Parent .... SUCCESS [  0.051 s]
[INFO] WildFly: MicroProfile Reactive Messaging Config .... SUCCESS [  2.501 s]
[INFO] WildFly: MicroProfile Reactive Messaging Common .... SUCCESS [  0.755 s]
[INFO] WildFly: MicroProfile Reactive Messaging Kafka ..... SUCCESS [  6.937 s]
[INFO] WildFly: MicroProfile Reactive Messaging Extension With SmallRye SUCCESS [  6.841 s]
[INFO] WildFly: MicroProfile Reactive Messaging AMQP ...... SUCCESS [  2.682 s]
[INFO] WildFly: MicroProfile Reactive Streams Operators Parent SUCCESS [  0.026 s]
[INFO] WildFly: MicroProfile Reactive Streams Operators Extension With SmallRye SUCCESS [  4.821 s]
[INFO] WildFly: MicroProfile Reactive Streams Operators CDI Provider SUCCESS [  0.437 s]
[INFO] WildFly: MicroProfile Telemetry Parent ............. SUCCESS [  0.029 s]
[INFO] WildFly: MicroProfile Telemetry CDI Provider ....... SUCCESS [  0.248 s]
[INFO] WildFly: MicroProfile Telemetry Extension .......... SUCCESS [  3.273 s]
[INFO] WildFly: Feature-Pack Parent ....................... SUCCESS [  0.033 s]
[INFO] WildFly: Feature-Pack Shared Galleon Content ....... SUCCESS [ 38.596 s]
[INFO] WildFly Preview: Galleon Feature-Pack .............. SUCCESS [01:27 min]
[INFO] WildFly: Preview Feature-Pack Channel .............. SUCCESS [  0.383 s]
[INFO] WildFly BOM Builders: Server EE Preview Builder .... SUCCESS [  2.301 s]
[INFO] WildFly BOM Builders: Server EE Preview With Tools Builder SUCCESS [  1.409 s]
[INFO] WildFly: Feature-Pack Product Configuration ........ SUCCESS [  0.149 s]
[INFO] WildFly: Feature-Pack Local Galleon Content ........ SUCCESS [  0.181 s]
[INFO] WildFly: Galleon Pack .............................. SUCCESS [ 51.047 s]
[INFO] WildFly: Feature-Pack Channel ...................... SUCCESS [  0.091 s]
[INFO] WildFly BOM Builders: Server Expansion ............. SUCCESS [  0.031 s]
[INFO] WildFly BOM Builders: Server Expansion Standard Builder SUCCESS [01:56 min]
[INFO] WildFly BOM Builders: Server Expansion Standard With Tools Builder SUCCESS [  1.634 s]
[INFO] WildFly BOM Builders: Server Expansion Preview Builder SUCCESS [  2.015 s]
[INFO] WildFly BOM Builders: Server Expansion Preview With Tools Builder SUCCESS [  1.471 s]
[INFO] WildFly: EE Full Thin Server Build ................. SUCCESS [01:21 min]
[INFO] WildFly Test Suite: Shared ......................... SUCCESS [ 59.659 s]
[INFO] WildFly: EE Full Distribution ...................... SUCCESS [01:26 min]
[INFO] WildFly: EE Full Galleon Pack Layer Tests .......... SUCCESS [ 19.625 s]
[INFO] WildFly: Exported Jakarta EE Specification APIs .... SUCCESS [  0.033 s]
[INFO] WildFly: Validation Tests for Exported Jakarta EE Specification APIs SUCCESS [  0.122 s]
[INFO] WildFly: Web Services Tests Integration Subsystem .. SUCCESS [  0.261 s]
[INFO] WildFly: Thin Server Build ......................... SUCCESS [01:14 min]
[INFO] WildFly: Distribution .............................. SUCCESS [01:22 min]
[INFO] WildFly Test Suite: Base Server Build Demander ..... SUCCESS [  0.025 s]
[INFO] WildFly: Dependency Management (Expansion Test Dependencies) SUCCESS [  0.018 s]
[INFO] WildFly Test Suite: Expansion Server Build Demander  SUCCESS [  0.020 s]
[INFO] WildFly Test Suite: Aggregator ..................... SUCCESS [  0.550 s]
[INFO] WildFly Test Suite: Integration (parent) ........... SUCCESS [  1.327 s]
[INFO] WildFly Test Suite: Integration - Web .............. SUCCESS [02:24 min]
[INFO] WildFly Test Suite: Integration - Smoke ............ SUCCESS [03:55 min]
[INFO] WildFly Test Suite: Base Server Aggregator ......... SUCCESS [  0.030 s]
[INFO] WildFly Test Suite: Expansion Aggregator ........... SUCCESS [  0.026 s]
[INFO] WildFly: Galleon Pack Layer Tests .................. SUCCESS [ 13.689 s]
[INFO] WildFly: Release ................................... SUCCESS [  0.032 s]
[INFO] WildFly Preview: BOM of Test Dependencies .......... SUCCESS [  0.025 s]
[INFO] WildFly Preview: Dependency Management (Expansion Test Dependencies) SUCCESS [  0.026 s]
[INFO] WildFly Preview: Thin Server Build ................. SUCCESS [ 46.887 s]
[INFO] WildFly Preview: Distribution ...................... SUCCESS [01:04 min]
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  55:56 min
[INFO] Finished at: 2026-08-22T21:25:23+05:00
[INFO] -------------------------------------------------
````

### Документация

/home/vasi/prog/java/wildfly_quickstart/quickstart/guide

./generate-guides.sh

~/prog/java/wildfly_quickstart/quickstart/guide/target/guides$ ls
epub  html  pdf  xml

[file:///home/vasi/prog/java/wildfly_quickstart/quickstart/guide/target/guides/html/guide.html](file:///home/vasi/prog/java/wildfly_quickstart/quickstart/guide/target/guides/html/guide.html)

### Запуск (с ноута)

````shell
cd ~/prog/java/wildfly/build/target/wildfly-42.0.0.Beta1-SNAPSHOT/bin
./standalone.sh -b 0.0.0.0 -bmanagement 0.0.0.0
````

(запущено с доступом с любого хоста)

````text
To stop the server, press Ctrl + C, or use the admin console
````

WFLYSRV0060: Http management interface listening on http://127.0.0.1:9990/management
Admin console listening on http://127.0.0.1:9990

__Добавил:__

admin1
B..._67
administrators
OK

vasi
B..._67
administrators
OK
--------------------------------------
[http://localhost:9990/console](http://localhost:9990/console)

[http://127.0.0.1:8080/helloworld/HelloWorld](http://127.0.0.1:8080/helloworld/HelloWorld)
--------------------------------------

### Запуск С ДОСТУПОМ ИЗ СЕТИ:

````shell
./standalone.sh -b 0.0.0.0 -bmanagement 0.0.0.0
````

````shell
vasi-note:~/prog/java/wildfly/build/target/wildfly-42.0.0.Beta1-SNAPSHOT/bin$ ./standalone.sh -b 0.0.0.0 -bmanagement 0.0.0.0
````

В логе такой сообщение:

````text
INFO  [org.jboss.ws.common.management] (MSC service thread 1-7) JBWS022052: Starting JBossWS 7.4.1.Final (Apache CXF 4.1.8)
````
___Apache CXF !!!__

### Проверка

Развернуто:
[http://localhost:9990/console/index.html#deployments;path=deployment~dply-helloworldwar](http://localhost:9990/console/index.html#deployments;path=deployment~dply-helloworldwar)
[http://127.0.0.1:8080/myproject-1.0-SNAPSHOT/](http://127.0.0.1:8080/myproject-1.0-SNAPSHOT/)

[http://192.168.1.79:8080/helloworld/HelloWorld](http://192.168.1.79:8080/helloworld/HelloWorld)
[file:///home/vasi/prog/java/wildfly_quickstart/quickstart/guide/target/guides/html/guide.html#_the_helloworld_quickstart_in_depth](file:///home/vasi/prog/java/wildfly_quickstart/quickstart/guide/target/guides/html/guide.html#_the_helloworld_quickstart_in_depth)

Проверка с v:
vasi@v:~$ http http://192.168.1.79:8080/helloworld/HelloWorld

Проверка:
http http://127.0.0.1:8080/helloworld/HelloWorld
HTTP/1.1 200 OK
Connection: keep-alive
Content-Length: 91
Content-Type: text/html;charset=ISO-8859-1
Date: Sun, 23 Aug 2026 09:04:01 GMT

<html><head><title>helloworld</title></head><body>
<h1>Hello World!</h1>
</body></html>

### Deploy из war

http://localhost:9990/console/index.html#deployments;path=deployment~dply-myproject-10-snapshotwar

После deploy открыть:
[http://192.168.1.79:8080/myproject-1.0-SNAPSHOT/](http://192.168.1.79:8080/myproject-1.0-SNAPSHOT/)

(будет картинка из проекта с Wicket) из /home/vasi/prog/java/wicket_start/myproject
с Apache __Wicket__.

### БАЗА

Уже установлен драйвер для H2 и база ExampleDS.

Как установить драйвер - НЕ ПРОВЕРИЛ
   Способ А: через автодеплой (проще для разработки). 
   Положите JAR-файл драйвера в директорию ${WILDFLY_HOME}/standalone/deployments/

### Подключение через командную строку

````shell
vasi@vasi-note:~/prog/java/wildfly/preview/build/target/wildfly-preview-42.0.0.Beta1-SNAPSHOT/bin$ ./jboss-cli.sh
You are disconnected at the moment. Type 'connect' to connect to the server or 'help' for the list of supported commands.
[disconnected /] connect
[standalone@localhost:9990 /]
````

или

````shell
connect 192.168.1.79:9990
[standalone@192.168.1.79:9990 /] 
````

[https://github.com/wildfly/quickstart](https://github.com/wildfly/quickstart)
Склонировано в note:~/prog/java/wildfly_quickstart/quickstart

[Deploy Spring Boot on WildFly application server](https://dev.to/jakmar17/deploy-spring-boot-on-wildfly-application-server-2029)

Вроде, нормально:
[https://github.com/wildfly/quickstart/tree/main/helloworld](https://github.com/wildfly/quickstart/tree/main/helloworld)

Настройка работы с БД:
https://www.tune-it.ru/web/bleizard/blog/-/blogs/1331555

[https://docs.wildfly.org/quickstart/spring-resteasy/](https://docs.wildfly.org/quickstart/spring-resteasy/)

### Apache CXF

https://help.eclipse.org/latest/index.jsp?topic=%2Forg.eclipse.jst.ws.cxf.doc.user%2Ftasks%2Fcreate_client.html
[SOAP-сервер на Java при участии Apache CXF и Spring (2012)](https://habr.com/ru/articles/137543/)

### Генерация клиентских классов по wsdl 
каталоги src должны существовать

````shell
wsimport -s src -d generated -verbose http://localhost:5000/hello?wsdl
````

### PostgesSQL

**2. Добавьте драйвер в WildFly.** Есть несколько подходов:
* **Через модули.** В директории `[WILDFLY_HOME]/modules` создайте структуру (например, `org/postgresql/main`) и положите туда JAR-файл драйвера (например, `postgresql-42.7.1.jar`). Внутри создайте `module.xml`, где укажете путь к JAR и зависимости (обычно `javax.api` и `javax.transaction.api`). Альтернативно — использовать `jboss-cli.sh`. [1](https://www.wildfly.org/guides/database-integrating-with-postgresql/)[13](https://www.marmo.dev/use-postgresql-with-wildfly/)
* **Через веб-консоль.** В консоли администратора (по умолчанию на порту 9990) 
  перейдите в **Configuration → Subsystems → Datasources → Non-XA**, 
 нажмите **Add**. Укажите JNDI-имя (например, `java:jboss/datasources/PostgresDS`), 
 выберите обнаруженный драйвер и заполните параметры подключения: URL 
 (`jdbc:postgresql://<хост>:<порт>/<имя_базы>`), логин, пароль. После заполнения нажмите **Test connection**, чтобы убедиться, что всё работает. [1](https://www.wildfly.org/guides/database-integrating-with-postgresql/)[3](https://www.tune-it.ru/web/bleizard/blog/-/blogs/1331555)[8](https://bgasparotto.com/add-datasource-wildfly)

**3. Создайте источник данных (DataSource).** Снова в веб-консоли или через редактирование `standalone.xml` определите источник, который будет использовать драйвер. Пример конфигурации:
```xml
<datasource jndi-name="java:jboss/datasources/PostgresDS" pool-name="PostgresDS">
    <connection-url>jdbc:postgresql://localhost:5432/my_db</connection-url>
    <driver>postgresql</driver>
    <security>
        <user-name>my_user</user-name>
        <password>my_password</password>
    </security>
</datasource>

кластер?


