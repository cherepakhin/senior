Основные команды mongo [https://blog.e-zest.com/basic-commands-for-mongodb](https://blog.e-zest.com/basic-commands-for-mongodb)

Запуск:

````shell
$ mongo
````

Помощь:

````shell
> db.help()

DB methods:
	db.adminCommand(nameOrDocument) - switches to 'admin' db, and runs command [just calls db.runCommand(...)]
	db.aggregate([pipeline], {options}) - performs a collectionless aggregation on this database; returns a cursor
	db.auth(username, password)
	db.cloneDatabase(fromhost)
	db.commandHelp(name) returns the help for the command
	db.copyDatabase(fromdb, todb, fromhost)
	db.createCollection(name, {size: ..., capped: ..., max: ...})
	db.createView(name, viewOn, [{$operator: {...}}, ...], {viewOptions})
	db.createUser(userDocument)
	db.currentOp() displays currently executing operations in the db
	db.dropDatabase()
	db.eval() - deprecated
	db.fsyncLock() flush data to disk and lock server for backups
	db.fsyncUnlock() unlocks server following a db.fsyncLock()
	db.getCollection(cname) same as db['cname'] or db.cname
	db.getCollectionInfos([filter]) - returns a list that contains the names and options of the db's collections
	db.getCollectionNames()
	db.getLastError() - just returns the err msg string
	db.getLastErrorObj() - return full status object
	db.getLogComponents()
	db.getMongo() get the server connection object
	db.getMongo().setSlaveOk() allow queries on a replication slave server
	db.getName()
	db.getPrevError()
	db.getProfilingLevel() - deprecated
	db.getProfilingStatus() - returns if profiling is on and slow threshold
	db.getReplicationInfo()
	db.getSiblingDB(name) get the db at the same server as this one
	db.getWriteConcern() - returns the write concern used for any operations on this db, inherited from server object if set
	db.hostInfo() get details about the server's host
	db.isMaster() check replica primary status
	db.killOp(opid) kills the current operation in the db
	db.listCommands() lists all the db commands
	db.loadServerScripts() loads all the scripts in db.system.js
	db.logout()
	db.printCollectionStats()
	db.printReplicationInfo()
	db.printShardingStatus()
	db.printSlaveReplicationInfo()
	db.dropUser(username)
	db.repairDatabase()
	db.resetError()
	db.runCommand(cmdObj) run a database command.  if cmdObj is a string, turns it into {cmdObj: 1}
	db.serverStatus()
	db.setLogLevel(level,<component>)
	db.setProfilingLevel(level,slowms) 0=off 1=slow 2=all
	db.setWriteConcern(<write concern doc>) - sets the write concern for writes to the db
	db.unsetWriteConcern(<write concern doc>) - unsets the write concern for writes to the db
	db.setVerboseShell(flag) display extra information in shell output
	db.shutdownServer()
	db.stats()
	db.version() current version of the server
````

Получение всех баз данных:

 ````shell
> show dbs

 admin   0.000GB
 config  0.000GB
 db3     0.000GB
 local   0.000GB
 ````

Создание новой базы данных:

````shell
> use DATABASE_NAME

> use db5
switched to db db5
````

Какая текущая база данных:

````shell
> db
db5
````

Удаление базы:

````shell
> use db5
> db.dropDatabase()
````

__Коллекции__

Создание __КОЛЛЕКЦИИ__:

````shell
> use dbTest
> db.createCollection('Empl1')
{ "ok" : 1 }
> show collections
Empl1
````

Удаление __КОЛЛЕКЦИИ__:

````shell
> db.Empl1.drop()
> show collections
````

Вставка __ДОКУМЕНТА__ в __КОЛЛЕКЦИЮ__:

````shell
> db.COLLECTION_NAME.insert(document)
````

````shell
> db.createCollection('EmplList')
{ "ok" : 1 }
> db.EmplList.insert({name: 'NAME1', address: 'ADDR1'})
WriteResult({ "nInserted" : 1 })
> db.EmplList.find()
{ "_id" : ObjectId("6778c9d63e90cb7a981b32a5"), "name" : "NAME1", "address" : "ADDR1" }

````

Обновление __ДОКУМЕНТА__ в __КОЛЛЕКЦИИ__:

````shell
>db.COLLECTION_NAME.update(SELECTION_CRITERIA, UPDATED_DATA)
````

````shell
> db.EmplList.update({name: 'NAME1'},{$set:{'name':'NEW NAME1', 'address': 'NEW ADDR1'}})
> db.EmplList.find()
{ "_id" : ObjectId("6778c9d63e90cb7a981b32a5"), "name" : "NEW NAME1", "address" : "ADDR1" }

> db.EmplList.update({name: 'NEW NAME1'},{$set:{'name':'NEW NAME2', 'address': 'NEW ADDR2'}})
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })
> db.EmplList.find()
{ "_id" : ObjectId("6778c9d63e90cb7a981b32a5"), "name" : "NEW NAME2", "address" : "NEW ADDR2" }

> db.EmplList.update({address: 'NEW ADDR2'},{$set:{'name':'NAME2', 'address': 'ADDR2'}})
````

Сохранение __DOCUMENT__:

Синтаксис:
````shell
> db.COLLECTION_NAME.save({_id:ObjectId(),NEW_DATA})
````

Пример:
```shell
> db.EmplList.save({"_id": new ObjectId("6778c9d63e90cb7a981b32a6"), name: "NAME_SAVED", address: "ADDR_SAVED"});

> db.EmplList.find()
{ "_id" : ObjectId("6778c9d63e90cb7a981b32a5"), "name" : "NAME2", "address" : "ADDR2" }
{ "_id" : ObjectId("6778c9d63e90cb7a981b32a6"), "name" : "NAME_SAVED", "address" : "ADDR_SAVED" }
```

Удаление __DOCUMENT__:

Синтаксис:
````shell
>db.COLLECTION_NAME.remove(DELLETION_CRITTERIA)
````

Пример:
````shell
> db.EmplList.find()
{ "_id" : ObjectId("6778c9d63e90cb7a981b32a5"), "name" : "NAME2", "address" : "ADDR2" }
{ "_id" : ObjectId("6778c9d63e90cb7a981b32a6"), "name" : "NAME_SAVED", "address" : "ADDR_SAVED" }

>db.EmplList.remove({"name" : "NAME_SAVED"})
WriteResult({ "nRemoved" : 1 })

> db.EmplList.find()
{ "_id" : ObjectId("6778c9d63e90cb7a981b32a5"), "name" : "NAME2", "address" : "ADDR2" }
````
