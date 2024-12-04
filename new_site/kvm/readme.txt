С ноута к win10 подключаться через клиент уд.раб.стола Remmina, соединение v.perm.ru_10_8549 (remmina_v.perm.ru_w10_8549.png).

В w10 используется встроенный сервис w10 удаленных раб столов (win10 на v.perm.ru предварительно запустить).

См. картинки в этом каталоге.

Менеджер виртуальных машин

Запустить с ноута:
$ virt-manager -c 'qemu+ssh://vasi@192.168.1.20:22/system?keyfile=id_rsa'
linux 2CPU/4G pass в kvm B..67, в linux v/b..o
--------------------------------
11.11, 4.12 (открылось)
1)
root@v:/etc/systemd/system/multi-user.target.wants# /usr/sbin/libvirtd
2024-11-10 20:20:34.658+0000: 707293: info : libvirt version: 10.0.0, package: 10.0.0-2ubuntu8.4 (Ubuntu)
2024-11-10 20:20:34.658+0000: 707293: info : hostname: v.perm.ru
2024-11-10 20:20:34.658+0000: 707293: warning : virSecurityManagerNew:194 : Configured security driver "none" disables default policy to create confined guests

2)
На ноуте запустить Менеджер виртуальных машин
Покдключиться к QEMU/KVM 192.168.1.20 открыть win10
----------------------------------------

