# Custom-Image-Airflow

download repo like :

wget [https://downloads.apache.org/airflow/2.1.3/](https://downloads.apache.org/airflow/2.1.3/)
or you can change the prefix like 2.1.4 or 1.10.1 or etc

extract using command : tar -xvf apache-airflow-2.1.3-source.tar.gz

cd apache-airflow-2.1.3/

<!-- you can use command docker like -->
sudo docker build . \
    --build-arg PYTHON_BASE_IMAGE="python:3.8-slim-buster" \
    --build-arg AIRFLOW_VERSION="2.1.3" \
    --build-arg ADDITIONAL_AIRFLOW_EXTRAS=" \
        slack, async, amazon, celery,dask,elasticsearch,kubernetes,postgres,redis,ssh,statsd, \
        apache.spark, apache.livy, apache.webhdfs, apache.hdfs, ftp, sftp, http, jdbc, \
        mongo, airbyte"\
    --build-arg ADDITIONAL_PYTHON_DEPS=" \
        pyarrow==2 \
        awswrangler \
        phonenumbers \
        aiohttp \
        Pillow" \
    --build-arg ADDITIONAL_DEV_APT_DEPS="gcc g++" \
    --build-arg ADDITIONAL_RUNTIME_APT_DEPS="default-jre-headless" \
    --build-arg ADDITIONAL_DEV_APT_COMMAND="apt update && apt install nano"\
    --tag "rudy-airflow-version:1.1.1"
    
<!-- or you can setup file.sh  -->
sudo nano imagebuilder.sh and put docker command like above
chmod +x imagebuilder.sh
./imagebuilder.sh

and then check the image with command 

sudo docker images or docker images

when the images airflow is ready, next:
cd 
sudo nano .env and put AIRFLOW_UID =1000 & AIRFLOW_GID=0
save .env

sudo nano docker-compose.yaml

Next, the last step is command running with:

sudo docker-compose up airflow-init
sudo docker-compose up -d

open airflow UI on:
http://IP Extenal VM’s Instance:8080 or http://localhost:8080
