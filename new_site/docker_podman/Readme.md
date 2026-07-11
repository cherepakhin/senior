podman - управление docker контейнерами (вместо docker???)
Запуск какого-то контейнера:

````shell
podman run -it --rm registry.astralinux.ru/library/astra/ubi18:1.8.1 /bin/bash
````

Запуск контейнера в фоновом режиме с привязкой портов:

````shell
podman run -d -p 8080:80 my-web-app
````

````shell
podman container ls
````

