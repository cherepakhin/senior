21.09.2024
Новая установка
1. Запуск Prometheus
В /etc/prometheus
Настройки в prometheus.yml

Сервис в /etc/systemd/prometheus.service

sudo systemctl enable prometheus.service

Created symlink /etc/systemd/system/multi-user.target.wants/prometheus.service → /etc/systemd/system/prometheus.service.

root@v:/etc/systemd/system# sudo systemctl start prometheus.service

Проверка OK:
http://192.168.1.20:9090/graph?g0.expr=system_cpu_usage&g0.tab=0&g0.stacked=0&g0.show_exemplars=0&g0.range_input=1h