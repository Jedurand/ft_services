FROM alpine:latest

RUN apk update && apk add --no-cache --upgrade bash \
&& apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main libc6-compat

RUN wget https://dl.grafana.com/oss/release/grafana-6.6.0.linux-amd64.tar.gz \
&& tar -zxvf grafana-6.6.0.linux-amd64.tar.gz \
&& rm /grafana-6.6.0/conf/defaults.ini \
&& rm -rf /var/cache/apk/*

COPY ./defaults.ini ./grafana-6.6.0/conf/
COPY ./grafana.db ./grafana-6.6.0/data/
COPY ./scripts/start.sh .

#RUN cat ./dashboards_backup/*.json
#COPY ./dashboards_backup/datasources.yml ./grafana-6.6.0/conf/provisioning/datasources/
#COPY ./dashboard.yml ./grafana-6.6.0/conf/provisioning/dashboards/
#COPY ./dashboards_backup/*.json ./grafana-6.6.0/conf/provisioning/dashboards/
#COPY ./dashboards_backup/*.json ./grafana-6.6.0/
#COPY ./dashboards_backup/*.json ./
#RUN ls ./grafana-6.6.0/conf/provisioning/dashboards/


RUN chmod +x start.sh

EXPOSE 3000

CMD ./start.sh
