sudo docker build .\
    --build-arg PYTHON_BASE_IMAGE="python:3.8-slim-buster"\
    --build-arg AIRFLOW_VERSION="2.1.3" \
    --build-arg ADDITIONAL_AIRFLOW_EXTRAS="\
        slack, async, amazon, celery,dask,elasticsearch,kubernetes,postgres,redis,ssh,statsd, \
        apache.spark, apache.livy, apache.webhdfs, apache.hdfs, ftp, sftp, http, jdbc, \
        mongo, airbyte"\
    --build-arg ADDITIONAL_PYTHON_DEPS=" \
        pyarrow==2\
        awswrangler\
        phonenumbers\
        aiohttp
        Pillow"\
    --build-arg ADDITIONAL_DEV_APT_DEPS="gcc g++" \
    --build-arg ADDITIONAL_RUNTIME_APT_DEPS="default-jre-headless" \
    --build-arg ADDITIONAL_DEV_APT_COMMAND="apt update && apt install nano"\
    --tag "rudy-airflow-version:1.1.1"
