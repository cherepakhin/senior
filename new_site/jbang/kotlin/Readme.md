### Генерация

````shell
jbang init -t hello.kt myhello.kt
````

### Запуск
````shell
jbang myhello.kt
````
Первый раз будет скачан и установлен kotlin:

````text
[jbang] Downloading Kotlin 2.3.10. Be patient, this can take several minutes...
[jbang] Installing Kotlin 2.3.10...
[jbang] Resolving dependencies...
[jbang]    org.jetbrains.kotlin:kotlin-stdlib:2.3.10
[jbang] Dependencies resolved
[jbang] Building jar for myhello.kt...
Hello World
````

Второй запуск:

````text
Hello World
````
