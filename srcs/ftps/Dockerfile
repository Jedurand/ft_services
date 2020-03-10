FROM alpine:3.7
RUN apk --no-cache add vsftpd
RUN touch /var/log/vsftpd.log

COPY scripts/start-tmp.sh /bin/start_vsftpd.sh
COPY files/vsftpd.conf /etc/vsftpd/vsftpd.conf

#cp srcs/ftps/scripts/start.sh srcs/ftps/scripts/start-tmp.sh
#sed -i '' "s/MINIKUBE_IP/$MINIKUBE_IP/g" srcs/ftps/scripts/start-tmp.sh

EXPOSE 21 21000-21010
VOLUME /ftp/ftp

CMD "/bin/start_vsftpd.sh"
