Пометки:

23.12
запускал vasi@vasi-note:~/prog/yandex-tank/tank-run.sh
----------------------------
vasi@vasi-note:~/prog/yandex-tank$ cat tank-run.sh
docker run --entrypoint yandex-tank \
    -v $(pwd):/var/loadtest \
    -v $SSH_AUTH_SOCK:/ssh-agent -e SSH_AUTH_SOCK=/ssh-agent \
    --net host \
    -it direvius/yandex-tank
----------------------------
-v -v $(pwd):/var/loadtest монтируется текущий каталог (со всем в нем файлами) к docker каталогу как /var/loadtest

----------------------------
Патроны:
vasi@vasi-note:~/prog/yandex-tank$ cat load.yaml
overload:
  enabled: true
  package: yandextank.plugins.DataUploader
  token_file: "token.txt"
phantom:
  address: 192.168.1.57:8980
  load_profile:
    load_type: rps
    schedule: const(1000, 20s)
  ammofile: /var/loadtest/ammo-uri.txt
  ammo_type: uri
console:
  enabled: true
telegraf:
  config: monitoring.xml
  enabled: true
  kill_old: false
  package: yandextank.plugins.Telegraf
  ssh_timeout: 5s

"ammofile: /var/loadtest/ammo-uri.txt"

vasi@vasi-note:~/prog/yandex-tank$ cat ammo-uri.txt
[Connection: close]
[Cookie: None]
/test/echo?name=STATIC tag_static
/test/dynamic?name=DYNAMIC tag_dynamic
/test/spring?name=SPRiNG tag_spring


