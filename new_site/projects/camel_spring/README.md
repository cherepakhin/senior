Различные способы задания конфигурации Spring Beans
----------------

1. [С помощью xml-файла resources/beans.xml](#xml_file)
2. [С помощью @Configuration и @Bean в conf/ConfigFromJava](#configuration)

[Примечания](#other)

<a id="xml_file"></a>
### С помощью xml-файла [resources/beans.xml](https://github.com/cherepakhin/camel_spring/blob/main/src/main/resources/beans.xml).

Определение [resources/beans.xml](https://github.com/cherepakhin/camel_spring/blob/main/src/main/resources/beans.xml):

````xml

<bean id="russianGreeter" class="ru.perm.v.springconfig.greeters.RussianGreeter"/>
<bean id="danishGreeter" class="ru.perm.v.camelinaction.greeters.greeters.DanishGreeter"/>
<bean id="englishGreeter" class="ru.perm.v.springconfig.greeters.EnglishGreeter"/>

<bean id="greetMain" class="ru.perm.v.springconfig.greeters.GreetMainApplication">
<property name="greeter" ref="russianGreeter"/>
</bean>
````

Импорт в проект:

````java
@Configuration
@ImportResource({"classpath*:beans.xml"})
public class BeansConfiguration {
}
````

Или можно так подгрузить и получить bean :

````java
@SpringBootApplication
public class GreetMainApplication {

    public static void main(String[] args) {
        SpringApplication.run(GreetMainApplication.class, args);
        ApplicationContext context =
                new ClassPathXmlApplicationContext("beans.xml");

        GreeterService greeterService =
                (GreeterService) context.getBean("selectedGreeterService");
        System.out.println(greeterService.getHello()); // Hello, vasi!
    }
}
````

или как обычно:

````java
@RestController
@RequestMapping("/greet")
public class GreeterRest {

    /**
     * inject from beans.xml property <property name="greeter" ref="russianGreeter"/>
     */
    @Autowired
    GreeterService selectedGreeterService;
````

Запуск:

````shell
$ mvn compile exec:java -Dexec.mainClass=ru.perm.v.camelinaction.springconfig.GreetMainApplication
````

<a id="configuration"></a>
### С помощью @Configuration и @Bean в [conf/ConfigFromJava](https://github.com/cherepakhin/camel_spring/blob/main/src/main/java/ru/perm/v/springconfig/conf/ConfigFromJava.java). 

С помощью @Configuration и @Bean. Показано в [conf/ConfigFromJava](https://github.com/cherepakhin/camel_spring/blob/main/src/main/java/ru/perm/v/springconfig/conf/ConfigFromJava.java):

````java
@Configuration
public class ConfigFromJava {
    @Bean
    public String beanOneFromConfigFromJava() {
    return "beanOne";
    }

    @Bean
    public String beanTwoFromConfigFromJava() {
        return "beanTwo";
    }
}
````

[resources/beans.xml](https://github.com/cherepakhin/camel_spring/blob/main/src/main/resources/beans.xml)
Использование в [ru.perm.v.springconfig.rest.ConfigFromJavaRest.java](https://github.com/cherepakhin/camel_spring/blob/main/src/main/java/ru/perm/v/springconfig/rest/ConfigFromJavaRest.java) как обычно:

````java
@RestController
@RequestMapping("/simple_conf")
public class ConfigFromJavaRest {
@Autowired
String beanOneFromConfigFromJava;

    @Autowired
    String beanTwoFromConfigFromJava;

    ....
````

### Unit tests

````shell
$ mvn test
````


### Сборка исполняемого jar

````shell
$ mvn package
````

Запуск:

````shell
java -jar target/camel-spring-0.0.1.jar
````

<a id="other"></a>
### Примечания:

- Удален WARNING "172 [main] WARN org.springframework.beans.factory.xml.ResourceEntityResolver - DTD/XSD XML entity http://www.springframework.org/schema/beans/spring-beans.xsd not found, falling back to remote https resolution". Исправлен заголовок файла beans.xml.
````shell
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE beans PUBLIC "-//SPRING//DTD BEAN//EN" "http://www.springframework.org/dtd/spring-beans.dtd">
````
- Исправление ошибки: 
An exception occured while executing the Java class. Line 15 in XML document from class path resource [beans.xml] is invalid: Attribute "xmlns" must be declared for elementtype "beans". Причина - удален заголовок: 
````shell
<!DOCTYPE beans PUBLIC "-//SPRING//DTD BEAN//EN" "http://www.springframework.org/dtd/spring-beans.dtd">
````
