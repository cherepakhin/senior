#TODO: Добавить Hello java проект.

https://ydb.tech/docs/ru/quickstart?version=v26.1

````shell
mkdir ~/ydbd && cd ~/ydbd
````

````shell
curl https://install.ydb.tech | bash
````

````text
Preparing target directory /home/vasi/tools/yadb
Moving files from temporary to target directory

Installation completed successfully.

You may run 'start.sh ram' or 'start.sh disk' in the /home/vasi/tools/yadb directory to start server/database, stop.sh to stop.
````

````shell
./start.sh ram
````

````shell
sudo ufw allow from 192.168.1.79 to any port 2135 proto tcp
````

Проверка:

````shell
curl http://localhost:8765/monitoring/ping
````

