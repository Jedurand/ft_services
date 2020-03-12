from alpine:lastest

RUN mkdir /etc/grafana
RUN mkdir /var/lib/grafana/
RUN mkdir /var/lib/grafana/dashboards
RUN mkdir /etc/grafana/provisioning

COPY /grafana/dashboards/* /var/lib/grafana/dashboards/
COPY /grafana/provisioning/* /etc/grafana/provisioning/
COPY grafana.ini /etc/grafana/
