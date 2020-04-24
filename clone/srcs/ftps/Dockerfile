FROM alpine:latest

RUN apk upgrade && \
    printf '%s\n' \
      '@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing' \
      >> /etc/apk/repositories && \
    apk update && \
	apk add openssl && \
    apk add --no-cache pure-ftpd@testing="1.0.49-r1" && \
    rm -rf /var/cache/apk/*

COPY ./scripts/start.sh .

RUN chmod +x start.sh

EXPOSE 21 21000

CMD ./start.sh
