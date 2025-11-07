Разработчик Yandex

ClickHouse, — это столбцовая (колоночная) база данных.

Установка
https://www.dmosk.ru/miniinstruktions.php?mini=clickhouse-linux

sudo apt install apt-transport-https ca-certificates dirmngr
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 8919F6BD2B48D754
sudo echo "deb https://packages.clickhouse.com/deb stable main" > /etc/apt/sources.list.d/clickhouse.list
sudo apt update
sudo apt install clickhouse-server clickhouse-client

Использование
Строка      #2          #3          #4
n           1000        1001        1002
name        name1       name2       name3
address     address1    address2    address3

vasi@v:~$ sudo systemctl status clickhouse-server.service
--------------
sudo mcedit /etc/clickhouse-server/config.xml
--------------
http_port 8123
tcp_port 9000

http://127.0.0.1:8123/
OK
--------------
http://127.0.0.1:9000/
Port 9000 is for clickhouse-client program.
You must use port 8123 for HTTP.

--------------
vasi@v:~$ clickhouse-client

CREATE DATABASE test_db;

CREATE TABLE my_first_table (user_id UInt32,message String) ENGINE = MergeTree PRIMARY KEY (user_id) ORDER BY user_id;
CREATE TABLE users(id UInt32,name String, age Int32) ENGINE = MergeTree PRIMARY KEY (id) ORDER BY id;
INSERT INTO users (id, name, age) VALUES (1, 'Мария', 25);
select * from users;
--------------
$ clickhouse-client -m

Параметр -m (или --multiline) включает многострочный режим ввода запроса чтобы выполнить запрос, необходимо завершить его ТОЧКОЙ С ЗАПЯТОЙ и нажать ENTER.

Чтобы выйти из clickhouse-client, можно нажать Ctrl+D или ввести вместо запроса exit, quit, q или logout
---------------
Пример 2
create table address(n UInt32, street String, house String) ENGINE = MergeTree PRIMARY KEY(n) order by n; ;
INSERT INTO address (n, street, house) VALUES (1, 'Леонова', '7');
select * from address;
---------------------------------------------------------
INSERT INTO address (n, street, house) VALUES (2, 'Комсомольский пр-т', '96а');

select * from address;

┌─n─┬─street──┬─house─┐
│ 1 │ Леонова │ 7     │
└───┴─────────┴───────┘
┌─n─┬─street─────────────┬─house─┐
│ 2 │ Комсомольский пр-т │ 96а   │
└───┴────────────────────┴───────┘

2 rows in set. Elapsed: 0.034 sec.
---------------------------------------------------------
v.perm.ru :) select * from address order by n;

SELECT *
FROM address
ORDER BY n ASC

┌─n─┬─street─────────────┬─house─┐
│ 1 │ Леонова            │ 7     │
│ 2 │ Комсомольский пр-т │ 96а   │
│ 3 │ Куйбышева          │ 50    │
└───┴────────────────────┴───────┘
---------------------------------------------------------
select * from address where n=2;
---------------------------------------------------------
alter table address update  house = '50б' where n=3;
---------------------------------------------------------
alter table address delete where n=3;
---------------------------------------------------------
