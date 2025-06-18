--- Загрузка файла со smotrim.ru, youtube.com

Файл для загрузки видео со stream
@v:/var/lib/minidlna/videos$ cat load.sh

#yt-dlp https://smotrim.ru/video/2938275
#yt-dlp https://smotrim.ru/video/29
# https://smotrim.ru/video/2982990
yt-dlp -o vecher https://smotrim.ru/video/2985941

--- Запуск сервиса minidlna
vasi@v:~/tools/minidlna$ cat minidlna_start.sh
/usr/sbin/minidlnad -f /etc/minidlna.conf -P /run/minidlna/minidlna.pid -S -r -v -R

--- Выбор трансляции
На ТВ в меню Source выбрать Мультимед.v:vasi
Выведено меню:

Все
Фотографии
Видео
Музыка

Выбрать Видео - > Folders -> vecher

Будет воспроизведен vecher.mp4
