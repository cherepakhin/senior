Mono, 16kHz, 32 bit float

$ ps -ax | grep 2700
  58955 ?        Sl     0:00 /usr/bin/docker-proxy -proto tcp -host-ip 0.0.0.0 -host-port 2700 -container-ip 172.17.0.3 -container-port 2700 -use-listen-fd
  58963 ?        Sl     0:00 /usr/bin/docker-proxy -proto tcp -host-ip :: -host-port 2700 -container-ip 172.17.0.3 -container-port 2700 -use-listen-fd
  63808 pts/1    S+     0:00 grep --color=auto 2700

$ docker ps
CONTAINER ID   IMAGE                      COMMAND                  CREATED          STATUS          PORTS                                             NAMES
749c8cddde22   alphacep/kaldi-ru:latest   "python3 ./asr_serve…"   58 minutes ago   Up 58 minutes   0.0.0.0:2700->2700/tcp, [::]:2700->2700/tcp       bold_edison
885d1c329c7e   rhasspy/rhasspy            "bash /usr/lib/rhass…"   46 hours ago     Up 16 hours     0.0.0.0:12101->12101/tcp, [::]:12101->12101/tcp   rhasspy

Без сокращений (внимание на COMMAND):
$ docker ps --no-trunc
CONTAINER ID                                                       IMAGE                      COMMAND                                                                              CREATED             STATUS             PORTS                                             NAMES
749c8cddde2246129be1b8123f8a786f0624e71573e6276838d009ec02e6f027   alphacep/kaldi-ru:latest   "python3 ./asr_server.py /opt/vosk-model-ru/model"                                   About an hour ago   Up About an hour   0.0.0.0:2700->2700/tcp, [::]:2700->2700/tcp       bold_edison
885d1c329c7e8b9c0ec6942bd97385d916048d2b6e4b766a95f8fbd29f13a3ed   rhasspy/rhasspy            "bash /usr/lib/rhasspy/bin/rhasspy-voltron --user-profiles /profiles --profile en"   46 hours ago        Up 16 hours        0.0.0.0:12101->12101/tcp, [::]:12101->12101/tcp   rhasspy

https://hub.docker.com/r/alphacep/kaldi-ru

ГЛАВНОЕ (!!!!!):
=====================================================
docker run -d -p 2700:2700 alphacep/kaldi-ru:latest
=====================================================

2700 - порт alphacep/kaldi-ru:latest (см. выше запуск docker)

docker ps
CONTAINER ID   IMAGE                      COMMAND                  CREATED          STATUS          PORTS                                         NAMES
1a2c7db75a8b   alphacep/kaldi-ru:latest   "python3 ./asr_serve…"   32 seconds ago   Up 31 seconds   0.0.0.0:2700->2700/tcp, [::]:2700->2700/tcp   happy_zhukovsky
vasi@vasi-note:~$ sudo docker run -d -p 12101:12101 --name rhasspy --restart unless-stopped -v "$HOME/.config/rhasspy/profiles:/profiles"       -v "/etc/localtime:/etc/localtime:ro" --device /dev/snd:/dev/snd rhasspy/rhasspy --user-profiles /profiles --profile ru
[sudo] password for vasi:          
docker: Error response from daemon: Conflict. The container name "/rhasspy" is already in use by container "885d1c329c7e8b9c0ec6942bd97385d916048d2b6e4b766a95f8fbd29f13a3ed". You have to remove (or rename) that container to be able to reuse that name.

rhasspy - UI для kaldi (не запустил)

Run 'docker run --help' for more information
vasi@vasi-note:~$ docker ps
CONTAINER ID   IMAGE                      COMMAND                  CREATED              STATUS              PORTS                                         NAMES
1a2c7db75a8b   alphacep/kaldi-ru:latest   "python3 ./asr_serve…"   About a minute ago   Up About a minute   0.0.0.0:2700->2700/tcp, [::]:2700->2700/tcp   happy_zhukovsky
vasi@vasi-note:~$ cd doc/senior/new_site/voice
voice/         voice_to_text/
vasi@vasi-note:~$ cd doc/senior/new_site/voice/
vasi@vasi-note:~/doc/senior/new_site/voice$ cd mishka/
vasi@vasi-note:~/doc/senior/new_site/voice/mishka$ python3 ./test.py mishka.wav > miska_out.txt

-------------------------------------
Программа распознавания test.py.
Использование test.py wav-файл

Используются питоновские библ-ки:

import wave  для чтения wav файлов.
import asyncio
import websockets
import sys



-------------------------------------
Запуск UI rhasspy (какой-то UI, не запустил, нахер не нужен):
docker rm -f rhasspy
vasi@vasi-note:~/doc/senior/new_site/voice/mishka$ sudo docker run -d -p 12101:12101       --name rhasspy       --restart unless-stopped       -v "$HOME/.config/rhasspy/profiles:/profiles"       -v "/etc/localtime:/etc/localtime:ro"       --device /dev/snd:/dev/snd       rhasspy/rhasspy       --user-profiles /profiles       --profile ru
c8e3f8f6596ca85193c5b2fa0b15beb0c37a11183ca73d4112e7eefafd7d245f

Открыть в браузере http://127.0.0.1:12101/

-------------------------------------
docker ps
CONTAINER ID   IMAGE                      COMMAND                  CREATED        STATUS        PORTS                                             NAMES
49c4b08a96a3   alphacep/kaldi-ru:latest   "python3 ./asr_serve…"   25 hours ago   Up 25 hours   0.0.0.0:2700->2700/tcp, [::]:2700->2700/tcp       trusting_einstein
c8e3f8f6596c   rhasspy/rhasspy            "bash /usr/lib/rhass…"   39 hours ago   Up 37 hours   0.0.0.0:12101->12101/tcp, [::]:12101->12101/tcp   rhasspy

Запуск
https://hub.docker.com/r/alphacep/kaldi-ru

````shell
docker run -d -p 2700:2700 alphacep/kaldi-ru:latest
````

Rhasspy — UI (new_site/voice/rhasspi) для kaldi. "Безопасный голосовой помощник, который работает автономно"

Настройки и тесты в voice/mishka

Тесты в ~/prog/java/voice/reclama


------------------------------------
Расшифровка wav файла выдернутая с youtube:
bussiness/
-rw-rw-r-- 1 vasi vasi  2632212 May 26 15:16 bussines_login_on_kotlin.txt
-rw-rw-r-- 1 vasi vasi 28701484 May 26 14:42 bussines_login_on_kotlin.wav
-rwxr-xr-x 1 vasi vasi      221 May 26 14:47 bussines.sh
------------------------------------


