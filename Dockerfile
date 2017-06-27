FROM openjdk:jdk-alpine
MAINTAINER k <k@kdaye.com>

RUN export work_dir=/root/ms \
    && wget http://import-service-package.oss.aliyuncs.com/ossimport2/ossimport-v2.1-linux.zip \
    && unzip ./ossimport4linux.zip -d "$work_dir" \
    && rm ossimport-v2.1-linux.zip \
    && cd $work_dir 



CMD java -jar $work_dir/bin/ossimport2.jar -c $work_dir/conf/sys.properties submit $work_dir/local_job.cfg
