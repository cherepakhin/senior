Подключение из терминала сервера (v) к терминалу на Win10 машине, запущенной в kvm на v.perm.ru
@v:$ ssh vasi@172.17.0.12
B..7

Microsoft Windows [Version 10.0.19045.5854]
(c) Корпорация Майкрософт (Microsoft Corporation). Все права защищены.

vasi@DESKTOP-EIRT09K C:\Users\vasi>

С ноута не настроены маршруты

vasi-note:~$ ssh vasi@172.17.0.12
ssh: connect to host 172.17.0.12 port 22: No route to host

ip: 172.17.0.12
gw: 172.17.0.1