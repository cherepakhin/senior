# Device resolution for Spring Boot

Sample code from [https://www.yihaomen.com/blog/article/169.html](https://www.yihaomen.com/blog/article/169.html)

Generate maven wrapper:

````shell
./mvn -N wrapper:wrapper -Dmaven=3.5.2
````

## Demo

Run (./run.sh):

__Java 11__

````shell
export JAVA_HOME=/usr/lib/jvm/java-1.11.0-openjdk-amd64
./mvnw clean spring-boot:run
````

Open: [http://localhost:8081](http://localhost:8081)

### View from computer:
![doc/standard.png](doc/standard.png)

Log:

see __'Hello desktop user!'__

````text
INFO 785161 --- [nio-8081-exec-6] c.m.mobile.GreetingController            : Hello desktop user!
INFO 785161 --- [nio-8081-exec-1] c.m.mobile.GreetingController            : device: [LiteDevice type=NORMAL]
INFO 785161 --- [nio-8081-exec-1] c.m.mobile.GreetingController            : device form request: [LiteDevice type=NORMAL]
INFO 785161 --- [nio-8081-exec-1] c.m.mobile.GreetingController            : device platform: UNKNOWN
````

### View from mobile (ANDROID phone):

![doc/mobile.png](doc/mobile.png)

see __'Hello mobile user!'__ message (NOT __Hello desktop user!__).

````text
INFO 785161 --- [nio-8081-exec-6] c.m.mobile.GreetingController            : Hello mobile user!
INFO 785161 --- [nio-8081-exec-6] c.m.mobile.GreetingController            : device: [LiteDevice type=MOBILE]
INFO 785161 --- [nio-8081-exec-6] c.m.mobile.GreetingController            : device form request: [LiteDevice type=MOBILE]
INFO 785161 --- [nio-8081-exec-6] c.m.mobile.GreetingController            : device platform: ANDROID
````

The directories __src/main/resources/templates/mobile__, __src/main/resources/templates/tablet__ in __/resources__ is hardcoded, and
the framework automatically determines which folder to retrieve the template from.

[src/main/resources/templates/greeting.html](src/main/resources/templates/greeting.html) - for __DESKTOP__ devices
[src/main/resources/templates/tablet/greeting.html](src/main/resources/templates/tablet/greeting.html) - for __TABLET__ devices
[src/main/resources/templates/mobile/greeting.html](src/main/resources/templates/mobile/greeting.html) - for __MOBILE__ devices

Used __thymeleaf__ template framework.