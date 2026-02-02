Разбираемся с Redis (habr)
https://habr.com/ru/companies/wunderfund/articles/685894/

Redis — это база данных, размещаемая в памяти, которая используется, в основном, в роли кеша, находящегося перед другой, «настоящей» базой данных, вроде MySQL или PostgreSQL.

(High Availability, HA

информация с самого начала будет находиться в структурах данных, которые нужны программисту

во многих других ситуациях.
В частности — в реализациях механизма издатель/подписчик, в задачах потоковой обработки данных, в системах, где нужно работать с очередями.

Вот какие типы данных поддерживает Redis:
Строка (String)
Битовый массив (Bitmap)
Битовое поле (Bitfield)
Хеш-таблица (Hash)
Список (List)
Множество (Set)
Упорядоченное множество (Sorted set)
Геопространственные данные (Geospatial)
Структура HyperLogLog (HyperLogLog)
Поток (Stream)

Memcached может показывать отличные результаты производительности в ограниченных окружениях кеширования. А при использовании этой системы в распределённом кластере нужны дополнительные настройки. Redis же поддерживает подобные сценарии работы сразу после установки.

мы решили распределить хранимые нами данные по множеству машин. Это называют шардингом. В результате каждый экземпляр Redis, входящий в состав кластера, считается хранилищем шарда, или фрагмента, всех данных.

=============================================================================
root@v:/etc# apt install redis
....
Created symlink /etc/systemd/system/redis.service → /usr/lib/systemd/system/redis-server.service.
Created symlink /etc/systemd/system/multi-user.target.wants/redis-server.service → /usr/lib/systemd/system/redis-server.service.

root@v:/etc# systemctl status redis
● redis-server.service - Advanced key-value store
     Loaded: loaded (/usr/lib/systemd/system/redis-server.service; enabled; pre>
     Active: active (running) since Sun 2024-12-22 18:03:25 +05; 2min 2s ago
       Docs: http://redis.io/documentation,
             man:redis-server(1)
   Main PID: 1307637 (redis-server)
     Status: "Ready to accept connections"
      Tasks: 5 (limit: 13882)
     Memory: 4.1M (peak: 5.0M)
        CPU: 226ms
     CGroup: /system.slice/redis-server.service
             └─1307637 "/usr/bin/redis-server 127.0.0.1:6379"


port 6379

root@v:/etc# redis-benchmark -h localhost -p 6379 -n 100000 -c 50 -d 100

...
Summary:
  throughput summary: 62111.80 requests per second
  latency summary (msec):
          avg       min       p50       p95       p99       max
        0.427     0.112     0.423     0.503     0.559     0.895

This command runs a benchmark test against a Redis server, simulating 50 concurrent clients (-c 50) and executing 100,000 (-n 100 000) requests. The results provide insights into the throughput and latency of Redis operations, helping identify potential bottlenecks.

