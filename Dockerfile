FROM alpine:latest

MAINTAINER wuqz <wuqinzhong#gmail.com>

ENV SERVER_ADDR 0.0.0.0
ENV SERVER_PORT 8388
ENV PASSWORD    password
ENV METHOD      aes-256-cfb
ENV TIMEOUT     300

RUN apk update && apk add python3 && pip3 install shadowsocks 

#ENTRYPOINT ["/usr/bin/ssserver"]

CMD ssserver -s ${SERVER_ADDR:-0.0.0.0} \
              -p ${SERVER_PORT:-8388} \
              -k ${PASSWORD:-$(hostname)} \
              -m ${METHOD:-aes-256-cfb} \
              -t ${TIMEOUT:-300} 
