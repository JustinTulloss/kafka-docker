FROM java:openjdk-7-jre

MAINTAINER Justin Tulloss

RUN curl http://apache.mirrors.lucidnetworks.net/kafka/0.8.2.0/kafka_2.10-0.8.2.0.tgz | tar xfz - -C /opt

ENV KAFKA_HOME /opt/kafka_2.10-0.8.2.0
ADD start-kafka.sh /usr/bin/start-kafka.sh
CMD start-kafka.sh
