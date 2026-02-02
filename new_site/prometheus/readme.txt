
21.09.2024
Новая установка
1. Запуск Prometheus

vasi@v:/home$ sudo apt install prometheus

В /etc/prometheus
Настройки в prometheus.yml

Сервис в /etc/systemd/prometheus.service

sudo systemctl enable prometheus.service

Created symlink /etc/systemd/system/multi-user.target.wants/prometheus.service → /etc/systemd/system/prometheus.service.

root@v:/etc/systemd/system# sudo systemctl start prometheus.service

Проверка:

prometheus OK:
http://192.168.1.20:9090/graph?g0.expr=system_cpu_usage&g0.tab=0&g0.stacked=0&g0.show_exemplars=0&g0.range_input=1h

grafana OK:
http://192.168.1.20:3000/explore?panes=%7B%22Gti%22:%7B%22datasource%22:%22f9658b16-7929-4a99-9eea-36356ffa2bed%22,%22queries%22:%5B%7B%22refId%22:%22A%22,%22expr%22:%22system_cpu_usage%7Bapplication%3D%5C%22shop_kotlin%5C%22%7D%22,%22range%22:true,%22instant%22:true,%22datasource%22:%7B%22type%22:%22prometheus%22,%22uid%22:%22f9658b16-7929-4a99-9eea-36356ffa2bed%22%7D,%22editorMode%22:%22builder%22,%22legendFormat%22:%22__auto%22,%22useBackend%22:false,%22disableTextWrap%22:false,%22fullMetaSearch%22:false,%22includeNullMetadata%22:true%7D%5D,%22range%22:%7B%22from%22:%22now-5m%22,%22to%22:%22now%22%7D%7D%7D&schemaVersion=1&orgId=1
