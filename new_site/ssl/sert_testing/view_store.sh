# Просмотр хранилища ключей
# pass - b...o

keytool -list -keystore mykeystore.jks

# Вывод:
#Enter keystore password:  
#Keystore type: PKCS12
#Keystore provider: SUN

#Your keystore contains 1 entry

#mykey, Jul 27, 2025, PrivateKeyEntry, 
#Certificate fingerprint (SHA-256): 07:13:6E:63:E5:29:C9:30:DD:4F:B3:7D:BE:0E:D3:83:E6:31:9F:C2:7E:76:09:84:3E:83:B7:F1:A4:D5:7E:96

# mykey из ./create_store.sh
