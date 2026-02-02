https://stackoverflow.com/questions/46670046/adding-crt-to-spring-boot-to-enable-ssl

pass: B..67

Выполнить:
1.
keytool -genkey -alias v.perm.ru -keyalg RSA -keystore KeyStore.jks -keysize 2048
(/home/vasi/prog/sert/spring/step1.sh)

2.
keytool -certreq -alias v.perm.ru -keystore KeyStore.jks -file v_perm_ru.csr
(/home/vasi/prog/sert/spring/step2.sh)

3.
keytool -importkeystore -srckeystore KeyStore.jks -destkeystore v_perm_ru.p12 -srcstoretype JKS -deststoretype PKCS12 -deststorepass B..67
(/home/vasi/prog/sert/spring/step3.sh)

Будут сгенерированы файлы:
KeyStore.jks
v_perm_ru.csr
v_perm_ru.p12

В spring-boot приложении vacancy_backend
положить файлы v_perm_ru.csr, v_perm_ru.p12 в resources/

в application.yml указать:
....
server:
  port: 8443
  ssl.enabled: true
  ssl.key-store: /home/vasi/prog/sert/spring/v_perm_ru.p12
  ssl.key-store-password: B..67
  ssl.keyStoreType: PKCS12
....

Содержимое root@v:/home/vasi/prog/sert/spring (см.выше генерацию сертификата)
root@v:/home/vasi/prog/sert/spring# ll
total 36
drwxrwxr-x 2 vasi vasi 4096 Jul 16 14:28 ./
drwxrwxr-x 3 vasi vasi 4096 Jul 16 15:33 ../
-rw-rw-r-- 1 vasi vasi 2734 Jul 16 14:23 KeyStore.jks
-rw-rw-r-- 1 vasi vasi    5 Jul 16 14:24 pass
-rwxrwxr-x 1 vasi vasi   81 Jul 16 14:20 step1.sh*
-rwxrwxr-x 1 vasi vasi   76 Jul 16 14:23 step2.sh*
-rwxrwxr-x 1 vasi vasi  190 Jul 16 14:28 step3.sh*
-rw-rw-r-- 1 vasi vasi 1093 Jul 16 14:24 v_perm_ru.csr
-rw-rw-r-- 1 vasi vasi 2734 Jul 16 14:28 v_perm_ru.p12


После запуска
vasi-note:~/prog/java/vacancy_backend$ ./run.sh

Открыть https://127.0.0.1:8443/api/vacancy/ , проверить свойства соединения (значок "замок" в адресной строке "Срок действия")
Дата выдачи	среда, 16 июля 2025г. в 14:23:59
Срок действия истекает	вторник, 14 октября 2025г. в 14:23:59

Генерация jar:
$ ./gradlew bootJar
(~/prog/java/vacancy_backend$ ./build_jar.sh)

Запуск на сервере:
Скопировать на сервер
vasi@v:~/temp/vacancy/back$ java -jar vacancy_backend-0.0.1-SNAPSHOT.jar

Открыть https://192.168.1.20:8443/api/vacancy/
Будет предупреждение! Но откроется с https. Просмотреть свойства сертификата.

======================================
Продление:
/usr/bin/certbot renew --noninteractive (не пробовал)