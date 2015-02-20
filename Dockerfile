FROM debian:jessie

MAINTAINER Justin Tulloss

RUN apt-get update; apt-get install -y openjdk-7-jre-headless curl

RUN curl http://apache.mirrors.lucidnetworks.net/kafka/0.8.2.0/kafka_2.10-0.8.2.0.tgz | tar xfz - -C /opt

RUN apt-get remove -y curl; apt-get -y autoremove; apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*-jdk

ENV KAFKA_HOME /opt/kafka_2.10-0.8.2.0
ENV KAFKA_HEAP_OPTS -Xmx128M -Xms128M
ADD start-kafka.sh /usr/bin/start-kafka.sh
CMD start-kafka.sh
