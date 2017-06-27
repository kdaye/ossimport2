#!/bin/sh
java -jar /root/ms/bin/ossimport2.jar -c /root/ms/conf/sys.properties submit /root/ms/local_job.cfg

java -Dskip_exist_file=true -jar /root/ms/bin/ossimport2.jar -c /root/ms/conf/sys.properties start
