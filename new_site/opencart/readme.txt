https://habr.com/ru/companies/serverspace/articles/743408/
https://opencart-russia.ru/
https://demo-opencart.ru/index.php
https://v.perm.ru/opencart/

sudo update-alternatives --config php
Выбрал 7.4
php -v

https://opencart-russia.ru/
opencart-3.0.4.1-rs.zip*

/var/www/opencart
B..67
https://docs.vultr.com/install-opencart-on-ubuntu-20-04
sudo mysql -u root -p
B67

CREATE DATABASE opencart;
CREATE USER 'opencart'@'localhost' IDENTIFIED BY 'pass';
GRANT ALL PRIVILEGES ON opencart . * TO 'opencart'@'localhost';
FLUSH PRIVILEGES;

sudo a2ensite opencart.conf
---------------------------
https://127.0.0.1/opencart/install/index.php
/var/www/main/opencart

https://192.168.1.20/opencart/install/index.php - OK
https://v/opencart/install/index.php - OK
https://v.perm.ru/opencart/install/index.php - OK

Проверка OK

НО нет config.php
Переименовал /config.dist.php в config.php
/admin/config.dist.php в /admin/config.php

Проверка OK:
https://v.perm.ru/opencart/install/index.php?route=install/step_2

https://v.perm.ru/opencart/install/index.php?route=install/step_3

Настройка БД
хост: v.perm.ru
имя БД: opencart
user: vasi
pass: pass (!!!OK!!!)

логин и пароль для администратора.
admin
pass
vasi.che@gmail.com
-----------------------------------------------------------
Перешел на:
https://v.perm.ru/opencart/install/index.php?route=install/step_4

"Не забудьте удалить установочную директорию install !" - Удалил

Перейти к витрине магазина https://v.perm.ru/opencart/
Перейти в административную часть https://v.perm.ru/opencart/admin/ (admin/pass)
user admin/pass