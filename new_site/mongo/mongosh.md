#wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | sudo apt-key add -
#wget https://downloads.mongodb.com/compass/mongodb-mongosh_2.1.1_amd64.deb

````shell
sudo echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org.list
sudo apt update
sudo apt install -y mongodb-mongosh
vasi@v:~/temp$ mongosh --version
2.6.0

sudo apt install -y --allow-unauthenticated mongodb-mongosh
````

````shell
note$ mongosh
>quit

v$ mongosh --host 192.168.1.79
>quit

v$ mongosh "mongodb://192.168.1.79:27017"
````
(mongodb - имя БД)

Как установить оболочку MongoDB на Linux
https://labex.io/ru/tutorials/mongodb-how-to-install-mongodb-shell-on-linux-435298
и там же проверка работы

Показать тек. БД
````shell
test> db
test
````

Создать БД:
````shell
test> use mydb
switched to db mydb
````
=================================== С mydatabase на ноутбуке ==========================================
````shell
mongosh -u dbuser -p dbpassword mydatabase
````

````
test> db.users.insertOne({ name: "JohnDoe", age: 30, city: "NewYork" })
{
  acknowledged: true,
  insertedId: ObjectId('697cbdbd76ce273a208ce5b0')
}
````

Разберем эту команду:

db: Представляет текущую базу данных (mydatabase).
users: Название коллекции. Она будет создана автоматически.
insertOne(): Метод для вставки одного документа.
{...}: Сам документ, содержащий поля, такие как name, age и city.


mydatabase> db.users.find()
[
{
_id: ObjectId('697cbdbd76ce273a208ce5b0'),
name: 'JohnDoe',
age: 30,
city: 'NewYork'
}
]

mydatabase> db.books.insertMany([
{ title: "MongoDBBasics", author: "JaneSmith", year: 2023 },
{ title: "PythonProgramming", author: "JohnDoe", year: 2022 },
{ title: "DataScienceHandbook", author: "AliceJohnson", year: 2021 }
])

Ответ:
{
acknowledged: true,
insertedIds: {
'0': ObjectId('697cbf1476ce273a208ce5b1'),
'1': ObjectId('697cbf1476ce273a208ce5b2'),
'2': ObjectId('697cbf1476ce273a208ce5b3')
}
}

Чтобы увидеть все документы в вашей новой коллекции books, снова используйте метод find():

````shell
mydatabase> db.books.find()
[
  {
    _id: ObjectId('697cbf1476ce273a208ce5b1'),
    title: 'MongoDBBasics',
    author: 'JaneSmith',
    year: 2023
  },
  {
    _id: ObjectId('697cbf1476ce273a208ce5b2'),
    title: 'PythonProgramming',
    author: 'JohnDoe',
    year: 2022
  },
  {
    _id: ObjectId('697cbf1476ce273a208ce5b3'),
    title: 'DataScienceHandbook',
    author: 'AliceJohnson',
    year: 2021
  }
]
mydatabase> db.books.countDocuments()
3
````

mydatabase> db.books.find({ author: "JohnDoe" })
[
{
_id: ObjectId('697cbf1476ce273a208ce5b2'),
title: 'PythonProgramming',
author: 'JohnDoe',
year: 2022
}
]

mydatabase> db.books.find({ year: 2023 })
[
{
_id: ObjectId('697cbf1476ce273a208ce5b1'),
title: 'MongoDBBasics',
author: 'JaneSmith',
year: 2023
}
]

mydatabase> db.books.deleteOne({ title: "MongoDBBasics" })
{ acknowledged: true, deletedCount: 1 }

Проверка что удалено:
mydatabase> db.books.find()
[
{
_id: ObjectId('697cbf1476ce273a208ce5b2'),
title: 'PythonProgramming',
author: 'JohnDoe',
year: 2022
},
{
_id: ObjectId('697cbf1476ce273a208ce5b3'),
title: 'DataScienceHandbook',
author: 'AliceJohnson',
year: 2021
}
]

Удаление по условию:
mydatabase> db.books.deleteMany({ year: { $lt: 2022 } })
{ acknowledged: true, deletedCount: 1 }
mydatabase> db.books.find()
[
{
_id: ObjectId('697cbf1476ce273a208ce5b2'),
title: 'PythonProgramming',
author: 'JohnDoe',
year: 2022
}
]
=================== С v на notebook - OK ===================
vasi@v:~/tools/mongo$ mongosh "mongodb://192.168.1.79:27017"
(но ноуте запущено в docker)

=================== Установка на v ===================
echo "deb http://security.ubuntu.com/ubuntu focal-security main" | sudo tee /etc/apt/sources.list.d/focal-security.list
sudo apt-get update
sudo apt-get install libssl1.1
sudo apt-get install -y mongodb-org

info: Adding system user `mongodb' (UID 146) ...
info: Adding new user `mongodb' (UID 146) with group `nogroup' ...
info: Not creating `/nonexistent'.
info: Selecting GID from range 100 to 999 ...
info: Adding group `mongodb' (GID 151) ...
info: Adding user `mongodb' to group `mongodb' ...
Setting up mongodb-org-shell (6.0.27) ...
Setting up mongodb-database-tools (100.14.1) ...
Setting up mongodb-org-mongos (6.0.27) ...
Setting up mongodb-org-database-tools-extra (6.0.27) ...
Setting up mongodb-org-database (6.0.27) ...
Setting up mongodb-org-tools (6.0.27) ...
Setting up mongodb-org (6.0.27) ...

$ sudo systemctl start mongod.service
$ ps -ax | grep mongo
4027975 ?        Ssl    0:00 /usr/bin/mongod --config /etc/mongod.conf

$ mongosh "mongodb://127.0.0.1:27017"
Current Mongosh Log ID:	697cc923145bd2d0938ce5af
Connecting to:		mongodb://127.0.0.1:27017/?directConnection=true&serverSelectionTimeoutMS=2000&appName=mongosh+2.6.0
Using MongoDB:		6.0.27
Using Mongosh:		2.6.0

For mongosh info see: https://www.mongodb.com/docs/mongodb-shell/

------
The server generated these startup warnings when booting
2026-01-30T20:06:24.144+05:00: Using the XFS filesystem is strongly recommended with the WiredTiger storage engine. See http://dochub.mongodb.org/core/prodnotes-filesystem
2026-01-30T20:06:25.690+05:00: Access control is not enabled for the database. Read and write access to data and configuration is unrestricted
------

Доступ из сети:
[https://www.baeldung.com/linux/mongodb-remote-connections](https://www.baeldung.com/linux/mongodb-remote-connections)

vasi@vasi-note:~/tools/mongo$ mongosh "mongodb://192.168.1.20:27017"
Current Mongosh Log ID:	697cca87391c306ba78ce5af
Connecting to:		mongodb://192.168.1.20:27017/?directConnection=true&appName=mongosh+2.6.0
MongoNetworkError: connect ECONNREFUSED 192.168.1.20:27017
vasi@vasi-note:~/tools/mongo$ mongosh "mongodb://192.168.1.20:27017"

$ sudo cat /etc/mongod.conf
....
# network interfaces
net:
port: 27017
bindIp: 0.0.0.0 <- Изменил. Тут было 127.0.0.1
....
------

Проверка:
vasi@vasi-note:~/tools/mongo$ mongosh "mongodb://192.168.1.20:27017"
vasi@vasi-note:~/tools/mongo$ mongosh "mongodb://v:27017"
192.168.1.20 -> v



