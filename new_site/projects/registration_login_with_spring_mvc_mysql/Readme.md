## Registration, Login with Spring MVC, MySql

### Content:

[Requirements](#requirements)<br/>
[Maven wrapper setup](#maven_wrapper_setup)<br/>
[Config database](#config_database)<br/>
[Run](#run)<br/>
[Package FAT JAR](#fat_jar)<br/>
[Use](#use)<br/>
[Copy to server](#copy_to_server)<br/>
[Run as service in Linux](#run_as_service_in_linux)
[Example Spring Boot 3 and Spring Security 8](#example_spring_boot_3)<br/>

<a id="requirements"></a>
### Requirements

Used Java 17, database MySql, name database __login_system__.

No unit tests.

Users/pass:

| User              | Password |
|-------------------|----------|
| ivan@example.com  | pass     |
| ivan@ya.ru        | pass     |

<a id="maven_wrapper_setup"></a>
### Setup Maven wrapper

Generate version 3.6.3:

````shell
export JAVA_HOME=/usr/lib/jvm/java-1.17.0-openjdk-amd64
mvn -N wrapper:wrapper -Dmaven=3.6.3
./mvnw clean package
````

<a id="config_database"></a>
### Config database

Set database in application.properties:

````yaml
spring.datasource.url=jdbc:mysql://v:3306/login_system
spring.datasource.username=vasi
spring.datasource.password=pass
````

<a id="run"></a>
### Run

[./run.sh](run.sh):

<a id="fat_jar"></a>
### Package FAT JAR

````shell
./mvnw clean package
````

Run FAT JAR:

````shell
export JAVA_HOME=/usr/lib/jvm/java-1.17.0-openjdk-amd64
/usr/lib/jvm/java-17-openjdk-amd64/bin/java -jar target/registration-login-demo-0.0.1-SNAPSHOT.jar
````

Run on port 8088:
````shell
/usr/lib/jvm/java-17-openjdk-amd64/bin/java -jar target/registration-login-demo-0.0.1-SNAPSHOT.jar --server.port=8088
````

<a id="use"></a>
### Use

````shell
export JAVA_HOME=/usr/lib/jvm/java-1.17.0-openjdk-amd64
./mvnw clean spring-boot:run
````
Registration:
![doc/registration.png](doc/registration.png)

Login form:
[http://127.0.0.1:8089/registration/login](http://127.0.0.1:8089/registration/login)

![doc/login_form.png](doc/login_form.png)

Login error:
[http://127.0.0.1:8089/registration/login?error](http://127.0.0.1:8089/registration/login?error)

![doc/login_fail.png](doc/login_fail.png)

Show users if login OK:

[http://127.0.0.1:8089/registration/users](http://127.0.0.1:8089/registration/users)

![doc/users_if_logged.png](doc/users_if_logged.png)

Run on port 8088:
````shell
/usr/lib/jvm/java-17-openjdk-amd64/bin/java -jar target/registration-login-demo-0.0.1-SNAPSHOT.jar --server.port=8088
````

<a id="copy_to_server"></a>
### Copy to server

[./cp_to_v.sh](./cp_to_v.sh):

````shell
scp ./target/registration-login-demo-0.0.1.jar vasi@v:/home/vasi/po
````

<a id="run_as_service_in_linux"></a>
### Run as service in Linux

/etc/systemd/system/registration-login-demo.service:

````shell
[Unit]
Description=Registration login demo
Wants=network-online.target
After=network-online.target
[Service]
Type=simple
User=vasi
Group=vasi
ExecReload=/bin/kill -HUP
ExecStart=/usr/lib/jvm/java-17-openjdk-amd64/bin/java -jar /home/vasi/po/registration-login-demo-0.0.1.jar --server.port=8089
SyslogIdentifier=registration-login-demo
Restart=always
[Install]
WantedBy=multi-user.target
````

Start service:
````shell
systemctl start registration-login-demo
````
[http://v:8089/registration/](http://v:8089/registration/)

[http://v:8089/registration/login](http://v:8089/registration/login)

Stop service:
````shell
systemctl stop registration-login-demo
````

Status service:
````shell
systemctl status registration-login-demo
````

<a id="example_spring_boot_3"></a>
### Example Spring Boot 3 and Spring Security 8

Registration-login-module using springboot, spring mvc, spring security and thymeleaf

http://www.javaguides.net/2018/10/user-registration-module-using-springboot-springmvc-springsecurity-hibernate5-thymeleaf-mysql.html

### Setup Apache2

/etc/apache2/sites-enabled# cat 000-default-le-ssl.conf:

````text
<IfModule mod_ssl.c>
    <VirtualHost *:443>
    ....
	#demo registration
	ProxyPass        /registration http://192.168.1.20:8089/registration
	ProxyPassReverse /registration http://192.168.1.20:8089/registration
    ....
	ProxyPreserveHost On
    </VirtualHost>
</IfModule>
````

After restart apache2 service will be available [https://v.perm.ru/registration/](https://v.perm.ru/registration/).