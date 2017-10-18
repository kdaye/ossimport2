FROM openjdk:jdk-alpine
MAINTAINER k <k@kdaye.com>

ENV WORK_DIR /root/ms
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN set -ex \
    && if [ $(wget -qO- ipinfo.io/country) == CN ]; then echo "http://mirrors.aliyun.com/alpine/latest-stable/main/" > /etc/apk/repositories ;fi \
    && apk --update add --no-cache --virtual .build-deps \
       wget \
       unzip \
    && wget http://gosspublic.alicdn.com/ossimport/standalone/ossimport-2.2.3.zip -O ossimport.zip \
    && unzip -UU ./ossimport.zip -d "$WORK_DIR" \
    && rm ossimport.zip \
    && apk del .build-deps \
    && rm -rf /tmp/* 



CMD ["/bin/sh", "/root/ms/import.sh"]
