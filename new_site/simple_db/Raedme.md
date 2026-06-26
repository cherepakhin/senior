MapDB:
https://www.baeldung.com/mapdb
DB db = DBMaker.fileDB("file.db").make()
https://github.com/jankotek/mapdb/
ШНЯГА!
-----------------------------------------------------------
GSON:
Save JSON to file:
https://www.baeldung.com/gson-save-file
gson.toJson(123.45, new FileWriter(filePath));

User user = new User(1, "Tom Smith", "American");
gson.toJson(user, new FileWriter(filePath));

-----------------------------------------------------------