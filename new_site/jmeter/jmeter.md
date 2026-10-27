Источник: [https://jmeter.apache.org/download_jmeter.cgi](https://jmeter.apache.org/download_jmeter.cgi)

[Установка и запуск JMeter на Linux CentOS](https://www.dmosk.ru/miniinstruktions.php?mini=jmeter-install-linux)

Установка в несколько шагов:
- Генерация ключей
- Настройка сервера
- Настройка клиента

### Генерация ключей

vasi@vasi-note:~/tools/jmeter/bin$ ./create-rmi-keystore.sh
Enter the distinguished name. Provide a single dot (.) to leave a sub-component empty or press ENTER to use the default value in braces.
What is your first and last name?
[Unknown]:  Vasi
What is the name of your organizational unit?
[Unknown]:  Che
What is the name of your organization?
[Unknown]:  Pt
What is the name of your City or Locality?
[Unknown]:  Perm
What is the name of your State or Province?
[Unknown]:  
What is the two-letter country code for this unit?
[Unknown]:  RU
Is CN=Vasi, OU=Che, O=Pt, L=Perm, ST=Unknown, C=RU correct?
[no]:  yes

Generating 2,048 bit RSA key pair and self-signed certificate (SHA384withRSA) with a validity of 7 days
for: CN=Vasi, OU=Che, O=Pt, L=Perm, ST=Unknown, C=RU
Copy the generated rmi_keystore.jks to jmeter/bin folder or reference it in property 'server.rmi.ssl.keystore.file'

### Настройка сервера

Создать файл: jmeter_start_v.sh:

````shell
./jmeter-server -Djava.rmi.server.hostname=192.168.1.79
````

Запустить сервер : /home/vasi/tools/jmeter/bin/server_start_v.sh

### Запуск как сервис linux

[jmeter.service](./jmeter.service)

````text
[Unit]
Description=Apache Jmeter server
Documentation=https://jmeter.apache.org/usermanual/remote-test.html
Wants=network-online.target
After=network-online.target

[Service]
LimitNOFILE=10240
Type=simple
Restart=on-failure
RestartSec=180s
WorkingDirectory=/tmp
ExecStart=/home/vasi/tools/jmeter/bin/server_start_v.sh

[Install]
WantedBy=multi-user.target
````

### Настройка клиента

На клиентском компьютере открываем файл /home/vasi/tools/jmeter/bin/jmeter.properties:

Редактируем:

````text
remote_hosts=192.168.1.79
````

где 192.168.1.79 - IP адрес сервера

Запуск клиента:

````shell
~/tools/jmeter/bin$ ./jmeter.sh
````
