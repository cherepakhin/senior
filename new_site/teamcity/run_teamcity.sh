docker run --name teamcity-server-instance  \
-v /home/vasi/po/teamcity/data:/data/teamcity_server/datadir \
-v /home/vasi/po/teamcity/logs:/opt/teamcity/logs  \
-p 8111:8111 \
jetbrains/teamcity-server