# Просмотр деталей сертификата
keytool -list -v -alias mykey -keystore mykeystore.jks
#pass: b..o
#Вывод:
#$ ./view_sert.sh
#Enter keystore password:  
#Alias name: mykey. Это метка для ПАРЫ ключей (открытый/закрытый ключ)
#Creation date: Jul 27, 2025
#Entry type: PrivateKeyEntry
#Certificate chain length: 1
#Certificate[1]:
#Owner: CN=Unknown, OU=Unknown, O=Unknown, L=Unknown, ST=Unknown, C=Unknown
#Issuer: CN=Unknown, OU=Unknown, O=Unknown, L=Unknown, ST=Unknown, C=Unknown
#Serial number: 16a31967e907a4ed
#Valid from: Sun Jul 27 14:06:18 YEKT 2025 until: Sat Oct 25 14:06:18 YEKT 2025
#Certificate fingerprints:
#     SHA1: 8D:9A:C2:AD:40:AA:DF:B8:0F:B0:93:CA:FC:46:7A:F3:41:59:8D:E2
#     SHA256: 07:13:6E:63:E5:29:C9:30:DD:4F:B3:7D:BE:0E:D3:83:E6:31:9F:C2:7E:76:09:84:3E:83:B7:F1:A4:D5:7E:96
#Signature algorithm name: SHA256withRSA
#Subject Public Key Algorithm: 2048-bit RSA key
#Version: 3

#Extensions: 

#1: ObjectId: 2.5.29.14 Criticality=false
#SubjectKeyIdentifier [
#KeyIdentifier [
#0000: C9 2A E9 63 B9 6A 72 CC   D6 CF FE AE 81 27 C2 79  .*.c.jr......'.y
#0010: D7 B2 FB 8A                                        ....
#]
#]

