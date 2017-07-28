# ossimport2
docker - ossimport2

```
git clone https://github.com/kdaye/ossimport2.git
cd ossimport2
```
modify the `conf/local_job.cfg`

modify the `docker-compose.yml`

change the `/date:/data` to `/your_local_file:/data`

Start with Docker-compose  
`docker-compose up -d`

detail  
`docker exec ossimport2 java -jar /root/ms/bin/ossimport2.jar -c /root/ms/conf/sys.properties stat detail`

log
`docker logs ossimport -f`

简介

【ossimport2】同步工具可以将您本地或第三方云存储服务上的文件同步到OSS上。

主要特性：

        支持将本地、OSS、七牛、百度对象存储、金山对象存储、又拍云、亚马逊s3、腾讯云cos、HTTP链接形式的文件同步到指定OSS Bucket上  
        支持存量数据同步(允许指定只同步某个时间点之后的文件)  
        支持增量数据自动同步  
        支持断点续传  
        支持上传/下载流量控制  
        支持并行list和并行数据下载/上传  


Power by
https://help.aliyun.com/document_detail/32201.html
