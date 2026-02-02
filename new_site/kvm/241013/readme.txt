Запуск сервиса:

vasi@v:~$ sudo systemctl stop libvirtd.service
vasi@v:~$ sudo libvirtd
2024-10-13 13:06:20.819+0000: 6429: info : libvirt version: 10.0.0, package: 10.0.0-2ubuntu8.4 (Ubuntu)
2024-10-13 13:06:20.819+0000: 6429: info : hostname: v.perm.ru
2024-10-13 13:06:20.819+0000: 6429: warning : virSecurityManagerNew:194 : Configured security driver "none" disables default policy to create confined guests
2024-10-13 13:10:20.635+0000: 7733: info : libvirt version: 10.0.0, package: 10.0.0-2ubuntu8.4 (Ubuntu)
2024-10-13 13:10:20.635+0000: 7733: info : hostname: v.perm.ru
2024-10-13 13:10:20.635+0000: 7733: warning : virSecurityValidateTimestamp:205 : Invalid XATTR timestamp detected on /var/lib/libvirt/images/win10.qcow2 secdriver=dac
2024-10-13 16:44:02.597+0000: 7734: error : qemuMonitorIORead:419 : Unable to read from monitor: Connection reset by peer
2024-10-13 16:44:06.018+0000: 6414: warning : virProcessGetStatInfo:1788 : cannot parse process status data
2024-10-13 16:45:22.764+0000: 13236: info : libvirt version: 10.0.0, package: 10.0.0-2ubuntu8.4 (Ubuntu)
2024-10-13 16:45:22.764+0000: 13236: info : hostname: v.perm.ru
2024-10-13 16:45:22.764+0000: 13236: warning : virSecurityValidateTimestamp:205 : Invalid XATTR timestamp detected on /var/lib/libvirt/qemu/domain-3-win10/master-key.aes secdriver=dac
2024-10-13 16:55:41.305+0000: 13248: error : qemuMonitorIORead:419 : Unable to read from monitor: Connection reset by peer

------------ Способ 1 ------------
В ноуте запустить "Администрирование/Менеджер виртуальных машин"
Будет запрошен пароль для vasi на v.perm.ru (B..67)
Откроется окно kvm_step1.png

Запустить win10
на v.perm.ru (B..67) kvm_step2.png

Поключиться с vasi/b..o

------------ Способ 2 ------------
Или из ком.строки:
vasi@vasi-note:$ virt-manager -c 'qemu+ssh://vasi@192.168.1.20:22/system?keyfile=id_rsa'
После ввода пароля от ssh 192.168.1.20 откроется окно kvm_step2.png
Поключиться с vasi/b..o

Памяти для запуска обеих машин, мягко говоря, маловато:

MiB Mem :  11645,2 total,    318,7 free,   9293,1 used,   2451,8 buff/cache

memory_used.png
