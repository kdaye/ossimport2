# ossimport2
docker - ossimport2

```
git clone https://github.com/kdaye/ossimport2.git
cd ossimport2
```
modify the `local_job.cfg`

modify the `docker-compose.yml`

change the `/date:/data` to `/your_local_file:/data`

Start with Docker-compose  
`docker-compose up -d`

detail
`docker exec ossimport2 java -jar /root/ms/bin/ossimport2.jar -c /root/ms/conf/sys.properties stat detail`

Power by
https://help.aliyun.com/document_detail/32201.html
