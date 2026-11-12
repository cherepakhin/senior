Что такое SOAP? 
https://systems.education/soap-integration?ysclid=mwapbimvjb269953656

note:/home/vasi/prog/java/soap

SOAP and Spring Boot

https://kosenkov.pro/spring/soap-spring-boot-web-service/

https://github.com/Bouncer77/soap-producer-web-service

note:/home/vasi/prog/java/soap/soap-producer-web-service

WSDL - Web Services Description Language. Это стандарт, который описывает веб-службы с помощью XML. По сути, это «паспорт» сервиса, который чётко фиксирует его интерфейс: какие методы доступны, какие параметры они принимают, какой формат ответа ожидается и где находится сам сервис.

# Получить файл WSDL

<div style="background: #ffffff; overflow: auto; width: auto; border: solid #092A8F; border-width: .1em .1em .1em .8em; padding: .2em .6em;">
<pre style="margin: 0; line-height: 125%;">
http http://localhost:8080/ws/countries.wsdl
</pre></div>

или

```shell
http http://localhost:8080/ws/countries.wsdl > test1_result.xml
```

[test1_result.xml](./test1_result.xml)

# Использование WSDL

Параметры запроса __request.xml__ (получить информацию об Испании):

```xml
<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"
				  xmlns:gs="http://spring.io/guides/gs-producing-web-service">
   <soapenv:Header/>
   <soapenv:Body>
      <gs:getCountryRequest>
         <gs:name>Spain</gs:name>
      </gs:getCountryRequest>
   </soapenv:Body>
</soapenv:Envelope>
```

Выполнение запроса с параметром __request.xml__ к __SOAP сервису__ http://localhost:8080/ws:

```shell
curl --header "content-type: text/xml" -d @request.xml http://localhost:8080/ws
```

Или с форматированием результата:

````shell
curl --header "content-type: text/xml" -d @request.xml http://localhost:8080/ws  | xmllint --format - | source-highlight -s xml -f esc
````

Ответ:

````xml
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   721  100   416  100   305  61647  45198 --:--:-- --:--:-- --:--:--  117k
<?xml version="1.0"?>
<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/">
  <SOAP-ENV:Header/>
  <SOAP-ENV:Body>
    <ns2:getCountryResponse xmlns:ns2="http://spring.io/guides/gs-producing-web-service">
      <ns2:country>
        <ns2:name>Spain</ns2:name>
        <ns2:population>46704314</ns2:population>
        <ns2:capital>Madrid</ns2:capital>
        <ns2:currency>EUR</ns2:currency>
      </ns2:country>
    </ns2:getCountryResponse>
  </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
````

### Tydy

```shell
curl --header "content-type: text/xml" -d @request.xml http://localhost:8080/ws  | tidy -xml -iq
```

```shell
<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/">

  <SOAP-ENV:Header />
  <SOAP-ENV:Body>
    <ns2:getCountryResponse xmlns:ns2="http://spring.io/guides/gs-producing-web-service">

      <ns2:country>
        <ns2:name>Spain</ns2:name>
        <ns2:population>46704314</ns2:population>
        <ns2:capital>Madrid</ns2:capital>
        <ns2:currency>EUR</ns2:currency>
      </ns2:country>
    </ns2:getCountryResponse>
  </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
```

### XmlLint

```shell
curl --header "content-type: text/xml" -d @request.xml http://localhost:8080/ws  | xmllint --format -
```

Ключевой момент — использовать дефис (-) в качестве имени файла в командной строке. Это сигнализирует утилите, что входные данные нужно брать из канала, а не из файла. 

### Xmlstarlet

```shell
curl --header "content-type: text/xml" -d @request.xml http://localhost:8080/ws  | xmlstarlet fo
```

### Color highlighting

С форматированием (xmllint) и выделение цветом (source-highlight):  

Запрос:
```shell
curl --header "content-type: text/xml" -d @request.xml http://localhost:8080/ws  | xmllint --format - | source-highlight -s xml -f esc
```

Ответ:
````shell
% Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
Dload  Upload   Total   Spent    Left  Speed
100   721  100   416  100   305  49265  36120 --:--:-- --:--:-- --:--:-- 90125
<?xml version="1.0"?>
<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/">
    <SOAP-ENV:Header/>
        <SOAP-ENV:Body>
            <ns2:getCountryResponse xmlns:ns2="http://spring.io/guides/gs-producing-web-service">
                <ns2:country>
                    <ns2:name>Spain</ns2:name>
                    <ns2:population>46704314</ns2:population>
                    <ns2:capital>Madrid</ns2:capital>
                    <ns2:currency>EUR</ns2:currency>
                </ns2:country>
            </ns2:getCountryResponse>
    </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
````

