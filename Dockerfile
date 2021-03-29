FROM openjdk:8u282-jre

ADD  ./init.sh /init.sh
ADD  ./cmd.sh /cmd.sh
ADD  ./run.sh /run.sh

RUN chmod +x /init.sh
RUN chmod +x /cmd.sh
RUN chmod +x /run.sh

ENV JVM_OPTS -Xmx1024M -Xms1024M
ENV SERVER_JAR server.jar

RUN mkdir -p /app
WORKDIR /app

RUN cd /app

CMD trap 'exit' INT; /init.sh