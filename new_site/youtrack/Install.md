# Установка

https://vc.ru/services/1008745-kak-ustanovit-youtrack-na-svoi-sobstvennyi-server

Устанавливаем образ на сервер:

````shell
docker pull jetbrains/youtrack:2023.3.22912
````

Запускаем контейнер:

````shell
docker run -it --name youtrack \
-v ./data:/opt/youtrack/data \
-v ./conf:/opt/youtrack/conf \
-v ./logs:/opt/youtrack/logs \
-v ./backups:/opt/youtrack/backups \
-p 8080:8080 \
jetbrains/youtrack:2023.3.22912
````

Проброс портов в docker:
Допустим, у нас есть контейнер с веб-сервером Nginx. 
Чтобы сделать его доступным на порту 8080 хостовой машины, запустим:
docker run -d -p 8080:80 nginx


docker rm /youtrack

docker container rm e25


vasi@v:~/po/youtrack$ docker run -it --name youtrack1 -v /home/vasi/po/youtrack/data:/opt/youtrack/data -v /home/vasi/po/youtrack/conf:/opt/youtrack/conf -v /home/vasi/po/youtrack/logs:/opt/youtrack/logs -v /home/vasi/po/youtrack/backups:/opt/youtrack/backups -p 8086:8080 jetbrains/youtrack:2023.3.22912

http://v:8086/install/hub


YouTrack License KeyGet a 60-day evaluation license for 10,000 users or buy YouTrack
42bd2ce4dbaf8554bf082946a1c039d4384e81a99ed53fb75215c1b6ace8d34cf66889fdeee418cbe93d54f38f6e94a8a05a0108234b1955582d566283e3d084b23a0b8b52b016b0e610abcbbe7573fa3ff8fb3cdc9346dc94ef5f596f5b12719abcb02e6fae23d98f53f22a01788066aac7298b7fe79cc3dcd6f8df2fb41ab4

 License Limitations
Expiration date	Unlimited
User can change logo	false
Product type	YouTrack
License type	Free license
Renewal possible until	Thu Dec 31 12:55:16 UTC 2099
Maximum users count	10

http://v:8086/agiles/157-0/current
admin/pass

