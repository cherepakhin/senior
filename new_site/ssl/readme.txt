В "sert_testing" опыты из https://test.playincloud.ru/index.php/spravochnik/43-certs

=================================================
$ cd ~/temp/ssl/Enable-https-SSL-for-Spring-Boot~/temp/ssl/Enable-https-SSL-for-Spring-Boot
(проект в ssl/proj/)

$ echo $JAVA_HOME
/usr/lib/jvm/java-11-openjdk-amd64

ssl/proj/run.sh

mvn spring-boot:run

https://127.0.0.1:8443/hello (открывается через httpS)

screen.png


=================================================
Опыты из https://java-online.ru/keystore-keytool.xhtml

Просмотр сертификата:
root@v:/etc/letsencrypt/live/v.perm.ru# keytool -list -keystore keystore.p12
Enter keystore password: ПАРОЛЯ НЕТ

*****************  WARNING WARNING WARNING  *****************
* The integrity of the information stored in your keystore  *
* has NOT been verified!  In order to verify its integrity, *
* you must provide your keystore password.                  *
*****************  WARNING WARNING WARNING  *****************

Keystore type: PKCS12
Keystore provider: SUN

Your keystore contains 1 entry

tomcat, Jul 27, 2025, PrivateKeyEntry,
Certificate chain length: 0

Хранилище ключей (keystore): Это файл, который содержит все ваши ключи и сертификаты.
Здесь хранилище keystore содержит один сертификат "tomcat"

Сертификат — это электронный документ, который подтверждает подлинность открытого ключа. Состоит из:
    - Публичный ключ: Часть пары ключей, которая передается другим.
    - Информация о владельце: Имя, организация, доменное имя и прочая информация о том, кому принадлежит этот сертификат.
    - Информация о CA (удостоверяющем центре): У кого был выдан этот сертификат.
    - Цифровая подпись: Удостоверяющий центр подписывает ваш сертификат своим закрытым ключом, чтобы подтвердить его подлинность.


