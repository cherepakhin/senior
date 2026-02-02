Скачивание с youtube, smotrim.ru и т.п.

В чем проблема?
Связь, которую предоставляет мой провайдер, очень хреновая. Утром почти никакая - паузы, видео недоступно и прочая шняга. Хочется скачать видео и нормально его просмотреть. Не у меня одного такие проблемы. Нашлась отличная утилита скачивания видео <a style="text-decoration: underline; color: #3366ff;" href="https://github.com/yt-dlp/yt-dlp" target="_blank" rel="noopener noreferrer">https://github.com/yt-dlp/yt-dlp</a>

Установка в linux:

sudo apt install ffmpeg
sudo apt install yt-dlp -y


Использование:

$ yt-dlp https://smotrim.ru/video/2884670

[Smotrim] Extracting URL: https://smotrim.ru/video/2884670
[RUTV] Extracting URL: https://player.vgtrk.com/iframe/video/id/2884670
[RUTV] 2884670: Downloading JSON
[RUTV] 2884670: Downloading m3u8 information
[info] 2884670: Downloading 1 format(s): hls-4050
[hlsnative] Downloading m3u8 manifest
[hlsnative] Total fragments: 882
[download] Destination: Эфир от 25.10.2024 [2884670].mp4
[download]   0.1% of ~   5.42GiB at   13.31KiB/s ETA --:--:-- (frag 1/882)[download] Got error: 150544 bytes read, 6322860 more expected. Retrying (1/10)...
[download] Got error: HTTPSConnectionPool(host='cdn-v.smotrim.ru', port=443): Read timed out.. Retrying (2/10)...
[download]  72.7% of ~   5.28GiB at    5.65MiB/s ETA 04:26 (frag 642/882)[download] Got error: HTTP Error 504: Gateway Time-out. Retrying (1/10)...
[download] Got error: HTTPSConnectionPool(host='cdn-v.smotrim.ru', port=443): Read timed out. (read timeout=20.0). Retrying (2/10)...
[download] 100% of    5.27GiB in 00:12:45 at 7.05MiB/s

Скачанное видео будет в текущей папке с расширением mp4.



