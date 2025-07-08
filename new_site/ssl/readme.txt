$ cd ~/temp/ssl/Enable-https-SSL-for-Spring-Boot~/temp/ssl/Enable-https-SSL-for-Spring-Boot
(проект в ssl/proj/)

$ echo $JAVA_HOME
/usr/lib/jvm/java-11-openjdk-amd64

ssl/proj/run.sh

mvn spring-boot:run

https://127.0.0.1:8443/hello (открывается через httpS)

screen.png

-----------------------
8/07/24
Просмотр:
v$ cd /home/vasi/tools/ssl
v$ ./key_view.sh

------------------------
8/07/24
Генерация:
vasi@v:/home/vasi/tools/ssl/sert$ ./gen.sh
Enter Export Password:
Verifying - Enter Export Password:
Пароля НЕТ или B..67!

Сгенерированный keystore.p12 скопировать в /etc/letsencrypt/live/v.perm.ru
-----------------------
Просмотр, на пример, в https://v.perm.ru

Общее имя (ЦС)	v.perm.ru
Организация	<Не является частью сертификата>
Подразделение	<Не является частью сертификата>
Общее имя (ЦС)	E5
Организация	Let's Encrypt
Подразделение	<Не является частью сертификата>
Дата выдачи	воскресенье, 8 июня 2025г. в 08:15:48
Срок действия истекает	суббота, 6 сентября 2025г. в 08:15:47
