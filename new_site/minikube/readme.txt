Minikube это тренировочный kubernetes.
Какой-то настроенный kuber на linux + kubelet с настройками для KVM.
Крутится в Virtual Machine Manager.

v.perm.ru
1) Открыть Virtual Machine Manager
2) Запустить minikube root/NO PASSWORD

или

vasi@v:~/tools$ minikube start
-----------------------
ping 8.8.8.8 - есть
-----------------------
# ifconfig
eth0      Link encap:Ethernet  HWaddr 52:54:00:42:28:33
          inet addr:192.168.39.197  Bcast:192.168.39.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:1075 errors:0 dropped:777 overruns:0 frame:0
          TX packets:11 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:132829 (129.7 KiB)  TX bytes:1144 (1.1 KiB)

eth1      Link encap:Ethernet  HWaddr 52:54:00:77:4D:A5
          inet addr:192.168.122.226  Bcast:192.168.122.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:1093 errors:0 dropped:777 overruns:0 frame:0
          TX packets:28 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:134101 (130.9 KiB)  TX bytes:2324 (2.2 KiB)


# ssh vasi@192.168.1.20

https://kubernetes.io/docs/tasks/administer-cluster/
-----------------------
vasi@v:~/tools$ ./kubectl cluster-info
Kubernetes control plane is running at https://192.168.39.197:8443
CoreDNS is running at https://192.168.39.197:8443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.
-----------------------
vasi@v:~/tools$ minikube status
minikube
type: Control Plane
host: Running
kubelet: Stopped
apiserver: Stopped
kubeconfig: Configured
-----------------------
vasi@v:~/tools$ minikube stop
✋  Stopping node "minikube"  ...
🛑  1 node stopped.
-----------------------

vasi@v:~/tools$ ifconfig
docker0: flags=4099<UP,BROADCAST,MULTICAST>  mtu 1500
        inet 172.17.0.1  netmask 255.255.0.0  broadcast 172.17.255.255
        inet6 fe80::42:9eff:fe78:a42b  prefixlen 64  scopeid 0x20<link>
        ether 02:42:9e:78:a4:2b  txqueuelen 0  (Ethernet)
        RX packets 331228  bytes 28645908 (28.6 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 616496  bytes 815065650 (815.0 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

enp3s0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        ether 30:85:a9:96:31:b7  txqueuelen 1000  (Ethernet)
        RX packets 54118828  bytes 61862030181 (61.8 GB)
        RX errors 0  dropped 1451505  overruns 0  frame 0
        TX packets 30117297  bytes 6833508164 (6.8 GB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

enp4s0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.1.20  netmask 255.255.255.0  broadcast 192.168.1.255
        inet6 fe80::1822:e529:8bdd:7ae6  prefixlen 64  scopeid 0x20<link>
        ether 00:11:95:5b:fe:7d  txqueuelen 1000  (Ethernet)
        RX packets 13661165  bytes 5513792129 (5.5 GB)
        RX errors 0  dropped 67  overruns 0  frame 0
        TX packets 31898296  bytes 31341363885 (31.3 GB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 12886790  bytes 17559740938 (17.5 GB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 12886790  bytes 17559740938 (17.5 GB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

ppp0: flags=4305<UP,POINTOPOINT,RUNNING,NOARP,MULTICAST>  mtu 1492
        inet 46.146.232.50  netmask 255.255.255.255  destination 10.95.254.254
        inet6 fe80::f4b6:42c0:88af:b177  prefixlen 64  scopeid 0x20<link>
        inet6 fe80::c04f:24a4:1839:60c4  prefixlen 64  scopeid 0x20<link>
        ppp  txqueuelen 3  (Point-to-Point Protocol)
        RX packets 52618167  bytes 60613426461 (60.6 GB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 30068143  bytes 6169053718 (6.1 GB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

virbr0: flags=4099<UP,BROADCAST,MULTICAST>  mtu 1500
        inet 192.168.122.1  netmask 255.255.255.0  broadcast 192.168.122.255
        ether 52:54:00:75:f9:79  txqueuelen 1000  (Ethernet)
        RX packets 553  bytes 59886 (59.8 KB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 2319  bytes 669531 (669.5 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

virbr1: flags=4099<UP,BROADCAST,MULTICAST>  mtu 1500
        inet 192.168.39.1  netmask 255.255.255.0  broadcast 192.168.39.255
        ether 52:54:00:95:99:0f  txqueuelen 1000  (Ethernet)
        RX packets 23050  bytes 19977931 (19.9 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 35791  bytes 346273373 (346.2 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
-----------------------
vasi@v:~/tools$ minikube start
kubectl not found. If you need it, try: 'minikube kubectl -- get pods -A'
-----------------------
vasi@v:~/tools$ minikube status
minikube
type: Control Plane
host: Running
kubelet: Running
apiserver: Running
kubeconfig: Configured
-------------------------
vasi@v:~/tools$ minikube kubectl -- get pods -A
    > kubectl.sha256:  64 B / 64 B [-------------------------] 100.00% ? p/s 0s
    > kubectl:  53.77 MiB / 53.77 MiB [------------] 100.00% 11.08 MiB p/s 5.1s
NAMESPACE     NAME                               READY   STATUS    RESTARTS        AGE
kube-system   coredns-6f6b679f8f-s88vl           1/1     Running   1               17h
kube-system   etcd-minikube                      1/1     Running   1 (117m ago)    17h
kube-system   kube-apiserver-minikube            1/1     Running   1 (117m ago)    17h
kube-system   kube-controller-manager-minikube   1/1     Running   5 (2m33s ago)   17h
kube-system   kube-proxy-m9qrf                   1/1     Running   1               17h
kube-system   kube-scheduler-minikube            1/1     Running   1 (117m ago)    17h
kube-system   storage-provisioner                1/1     Running   3 (64s ago)     17h

kubectl используется как ПАРАМЕТР программы minikube. В v.perm.ru и в образе linux с minikube команды kubectl НЕТ.
--------------------------
Установка kubectl в v.perm.ru
curl -LO https://dl.k8s.io/release/`curl -LS https://dl.k8s.io/release/stable.txt`/bin/linux/amd64/kubectl
--------------------------
vasi@v:~/tools$ ./kubectl version --client
Client Version: v1.31.2
Kustomize Version: v5.4.2
--------------------------
vasi@v:~/tools$ ./kubectl cluster-info
Kubernetes control plane is running at https://192.168.39.197:8443
CoreDNS is running at https://192.168.39.197:8443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.
--------------------------
vasi@v:~/tools$ ./kubectl cluster-info dump > cluster-info.json
--------------------------
ssh vasi@192.168.39.197
vasi@192.168.39.197's password: pass
                         _             _
            _         _ ( )           ( )
  ___ ___  (_)  ___  (_)| |/')  _   _ | |_      __
/' _ ` _ `\| |/' _ `\| || , <  ( ) ( )| '_`\  /'__`\
| ( ) ( ) || || ( ) || || |\`\ | (_) || |_) )(  ___/
(_) (_) (_)(_)(_) (_)(_)(_) (_)`\___/'(_,__/'`\____)

$
--------------------------
vasi@v:~/tools$ minikube start --vm-driver=kvm2
😄  minikube v1.34.0 on Linuxmint 22
✨  Using the kvm2 driver based on existing profile
👍  Starting "minikube" primary control-plane node in "minikube" cluster
🔄  Restarting existing kvm2 VM for "minikube" ...
🐳  Preparing Kubernetes v1.31.0 on Docker 27.2.0 ...
🔗  Configuring bridge CNI (Container Networking Interface) ...
🔎  Verifying Kubernetes components...
    ▪ Using image gcr.io/k8s-minikube/storage-provisioner:v5
🌟  Enabled addons: default-storageclass, storage-provisioner
💡  kubectl not found. If you need it, try: 'minikube kubectl -- get pods -A'
🏄  Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default
--------------------------
vasi@v:~/tools$ minikube kubectl -- get pods -A
NAMESPACE     NAME                               READY   STATUS    RESTARTS      AGE
kube-system   coredns-6f6b679f8f-s88vl           0/1     Running   2 (55m ago)   19h
kube-system   etcd-minikube                      1/1     Running   2 (55m ago)   19h
kube-system   kube-apiserver-minikube            1/1     Running   2 (55m ago)   19h
kube-system   kube-controller-manager-minikube   1/1     Running   6 (55m ago)   19h
kube-system   kube-proxy-m9qrf                   1/1     Running   2 (55m ago)   19h
kube-system   kube-scheduler-minikube            1/1     Running   2 (55m ago)   19h
kube-system   storage-provisioner                0/1     Error     4 (55m ago)   19h
--------------------------
vasi@v:~/tools$ minikube kubectl -- get pods --namespace kube-system
NAME                               READY   STATUS    RESTARTS       AGE
coredns-6f6b679f8f-s88vl           1/1     Running   3 (147m ago)   21h
etcd-minikube                      1/1     Running   3 (147m ago)   22h
kube-apiserver-minikube            1/1     Running   3 (147m ago)   22h
kube-controller-manager-minikube   1/1     Running   7 (147m ago)   22h
kube-proxy-m9qrf                   1/1     Running   3 (147m ago)   21h
kube-scheduler-minikube            1/1     Running   3 (147m ago)   22h
storage-provisioner                1/1     Running   7 (141m ago)   21h
--------------------------
Перейти в суперпользователя:
# su -
--------------------------
В minikube машине добавить пользователя vasi.
# adduser vasi
echo 'vasi ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
после этого можно использовать sudo

после этого можно коннектится снаружи
--------------------------
vasi@v:~/tools$ ssh 192.168.122.226
vasi@192.168.122.226's password:
                         _             _
            _         _ ( )           ( )
  ___ ___  (_)  ___  (_)| |/')  _   _ | |_      __
/' _ ` _ `\| |/' _ `\| || , <  ( ) ( )| '_`\  /'__`\
| ( ) ( ) || || ( ) || || |\`\ | (_) || |_) )(  ___/
(_) (_) (_)(_)(_) (_)(_)(_) (_)`\___/'(_,__/'`\____)

$
--------------------------
v$ minikube kubectl cluster-info dump