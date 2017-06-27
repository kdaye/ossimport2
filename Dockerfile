FROM openjdk:jdk-alpine
MAINTAINER k <k@kdaye.com>

RUN export work_dir=/root/ms

RUN set -ex \
    && if [ $(wget -qO- ipinfo.io/country) == CN ]; then echo "http://mirrors.aliyun.com/alpine/latest-stable/main/" > /etc/apk/repositories ;fi \
    && apk --update add --no-cache --virtual .build-deps \
       wget \
       unzip \
    && wget http://import-service-package.oss.aliyuncs.com/ossimport2/ossimport-v2.1-linux.zip \
    && unzip -UU ./ossimport-v2.1-linux.zip -d "$work_dir" \
    && rm ossimport-v2.1-linux.zip \
    && apk del .build-deps \
    && rm -rf /tmp/* \
    && cd $work_dir 



CMD java -jar $work_dir/bin/ossimport2.jar -c $work_dir/conf/sys.properties submit $work_dir/local_job.cfg
