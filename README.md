Build with
```
docker buildx build --platform linux/amd64 -t seppelin:latest .
```

Run with
```
docker run -u $(id -u) -p 8080:8080 --rm -v $PWD/logs:/logs -v $PWD/notebook:/notebook \
  -e SPARK_HOME=/opt/spark \
  -e ZEPPELIN_LOG_DIR='/logs' -e ZEPPELIN_NOTEBOOK_DIR='/notebook' --name seppelin seppelin
```