Мои маппинги из интернета.
    офис -> haproxy v -> mts
    интернет -> haproxy el59 -> офис и магазины el59 (+vpn)
    офис -> haproxy v  -> домашний note
    сотрудник domru - portmapper -> vpn -> domru

Устанавливаем балансировщик нагрузки HAProxy на CentOS https://habr.com/ru/companies/otus/articles/512238/
Установка и настройка HAProxy на Linux https://www.dmosk.ru/miniinstruktions.php?mini=haproxy-centos7

apt install haproxy
systemctl enable haproxy
systemctl start haproxy

 /etc/haproxy/haproxy.cfg
    global. Глобальные настройки, распространяемые на все публикации.
    defaults. Настройки, применяемые по умолчанию, если они не указаны явно в публикации.
    frontend. Правила обработки запросов, приходящих на сервер и передачи этих запросов серверам backend. Может быть несколько.
    backend. Настройка конечных серверов, которые обрабатывают запросы и возвращают результаты. Может быть несколько.

При настройке прослушивания внешних запросов, основное, что мы указываем:

IP-адрес и порт прослушивания.
Правила, по которым обрабатываются запросы.
Группы серверов, на которые будет перекинут запрос.
Пример:

frontend balance_http
    bind 192.168.0.15:80

    acl url_stat       path_end       -i .css .js

    use_backend static          if url_stat
    default_backend webserver

backend webserver
    balance     roundrobin
    server  server1 192.168.0.20:80 check
    server  server2 192.168.0.30:80 check

Открыть порты:
iptables -I INPUT 1 -p tcp --dport 80 -j ACCEPT
iptables -I INPUT 1 -p tcp --dport 443 -j ACCEPT