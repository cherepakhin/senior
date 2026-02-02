Отправка почты из коммандной строки в linux:

````
echo "message" | mail -s "Test title attach" bob1970@yandex.ru
````
-s - subject

Отправка почты с вложением из командной строки в linux:

````
echo "message" | mail -s "Test title attach1" -A /home/vasi/temp/body.txt bob1970@yandex.ru
echo "message" | mail -s "with fu.jpg" -A /home/vasi/temp/fu.jpg bob1970@yandex.ru
````



