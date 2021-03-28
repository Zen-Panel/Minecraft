FROM ubuntu

ENV JVM_VERSION openjdk:8u252-jre
FROM "$JVM_VERSION"

RUN if ["$JVM_VERSION" = "openjdk:7u221-jre"]; then echo "7"; fi
RUN if ["$JVM_VERSION" = "openjdk:8u252-jre"]; then echo "8"; fi
RUN if ["$JVM_VERSION" = "openjdk:9"]; then echo "9"; fi
RUN if ["$JVM_VERSION" = "openjdk:10-ea-jre"]; then echo "10"; fi
RUN if ["$JVM_VERSION" = "openjdk:11-ea-jre"]; then echo "11"; fi

ENV JVM_OPTS -Xmx1024M -Xms1024M

ADD  ./init.sh /init.sh
ADD  ./cmd.sh /cmd.sh
ADD  ./run.sh /run.sh

RUN chmod +x /init.sh
RUN chmod +x /cmd.sh
RUN chmod +x /run.sh

RUN mkdir -p /app
WORKDIR /app
RUN cd /app