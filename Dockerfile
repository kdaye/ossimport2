FROM openjdk:jdk-alpine
MAINTAINER k <k@kdaye.com>

ENV WORK_DIR /root/ms

RUN set -ex \
    && if [ $(wget -qO- ipinfo.io/country) == CN ]; then echo "http://mirrors.aliyun.com/alpine/latest-stable/main/" > /etc/apk/repositories ;fi \
    && apk --update add --no-cache --virtual .build-deps \
       wget \
       unzip \
    && wget http://import-service-package.oss.aliyuncs.com/ossimport2/ossimport-v2.1-linux.zip \
    && unzip -UU ./ossimport-v2.1-linux.zip -d "$WORK_DIR" \
    && rm ossimport-v2.1-linux.zip \
    && apk del .build-deps \
    && rm -rf /tmp/* \
    && cd $WORK_DIR

ADD start.sh start.sh

RUN chmod +x start.sh

CMD ["/bin/sh", "start.sh"]
