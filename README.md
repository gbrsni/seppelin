# Seppelin
[Spark](https://spark.apache.org/) + [Zeppelin](https://zeppelin.apache.org/) in a Docker image

### Running
Run with
```
docker run -u $(id -u) -p 8080:8080 --rm \
  -v $PWD/logs:/logs -v $PWD/notebook:/notebook \
  -e PYSPARK_PYTHON=python3 -e PYSPARK_DRIVER_PYTHON=python3
  -e SPARK_HOME=/opt/spark \
  -e ZEPPELIN_LOG_DIR='/logs' -e ZEPPELIN_NOTEBOOK_DIR='/notebook' \
  --name seppelin ghcr.io/gbrsni/seppelin:latest
```

### Local build
Alternatively, build locally with
```
docker buildx build --platform linux/amd64 -t seppelin:latest .
```
and run with 
```
docker run -u $(id -u) -p 8080:8080 --rm \
  -v $PWD/logs:/logs -v $PWD/notebook:/notebook \
  -e PYSPARK_PYTHON=python3 -e PYSPARK_DRIVER_PYTHON=python3
  -e SPARK_HOME=/opt/spark \
  -e ZEPPELIN_LOG_DIR='/logs' -e ZEPPELIN_NOTEBOOK_DIR='/notebook' \
  --name seppelin seppelin
```
