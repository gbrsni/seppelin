FROM ubuntu:24.04 AS downloader

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y \
	wget

WORKDIR /tmp

RUN wget https://dlcdn.apache.org/spark/spark-3.5.5/spark-3.5.5-bin-hadoop3-scala2.13.tgz -O spark.tgz --progress=bar:force

# USER root

RUN tar xf spark.tgz && \
	rm spark.tgz && \
	mv spark* spark && \
	mv spark /opt/spark && \
	mkdir -p /sample-data

FROM apache/zeppelin:0.12.0

COPY --from=downloader /opt/spark /opt/spark

ENV SPARK_HOME="/opt/spark/"

ENV PYSPARK_PYTHON=python3
ENV PYSPARK_DRIVER_PYTHON=python3