# Создание нового хранилища ключей
# При генерации запрашивается город и пр.инфа. Указал только пароль, т.к. он обязателен
# pass: b..o Остальное пусто
keytool -genkeypair -alias mykey -keyalg RSA -keystore mykeystore.jks -keysize 2048