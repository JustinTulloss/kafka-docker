kafka-docker
============

Dockerfile for [Apache Kafka](http://kafka.apache.org/)

Forked from [wurstmeister](https://github.com/wurstmeister/kafka-docker).

The image is available directly from https://index.docker.io

## Configuration Options

There are some special environment variables that you should set in a production cluster, although the defaults are fine for dev.

- `KAFKA_ADVERTISED_HOSTNAME`: This is hostname that other brokers can communicate with this broker on. It gets published to Zookeeper.
- `KAFKA_ADVERTISED_PORT`: This is is the port that other brokers can communicate with this broker on. It gets communicated to Zookeeper. This
  is the port that is exposed on the host side, not inside the container, so you'll want to explicitly assign this port when running the container.
  It defaults to 9092.
- `KAFKA_BROKER_ID`: The identifier for this broker in logs. It defaults to the value of `KAFKA_ADVERTISED_PORT`
- `KAFKA_LOG_DIRS`: The directory where all data is stored. Defaults to `/kafka/kafka-logs-$KAFKA_BROKER_ID`. You should make this directory a volume or within a volume in order to prevent data loss when you stop the container.
- `KAFKA_ZOOKEEPER_CONNECT`: Connection string for connecting to zookeeper. Defaults to looking for a linked zookeeper container called `zk`.

In addition, `KAFKA_HEAP_OPTS` and `KAFKA_LOG4J_OPTS` will be passed to the `kafka-server-start.sh` script. Use these to configure logging and Java.

All environment variables except `KAFKA_HEAP_OPTS` and `KAFKA_LOG4J_OPTS` that start with `KAFKA_` will be converted to the kafka configuration. The `KAFKA_` prefix will be removed, the key will be lower cased, and `_` will be replaced with `.`. So to configure `message.max.bytes` you would set the `KAFKA_MESSAGE_MAX_BYTES` environment variable.
