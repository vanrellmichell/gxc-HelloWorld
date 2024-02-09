FROM alpine:3.18

ENV WAR_PATH $WAR_PATH
ENV WAR_NAME $WAR_NAME

ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
ENV TOMCAT_VERSION 10.1.16
ENV TOMCAT_TAR_URL https://archive.apache.org/dist/tomcat/tomcat-10/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz
# https://downloads.apache.org/tomcat/tomcat-10/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz

# Set TZ
RUN apk add -U tzdata
ENV TZ=America/Montevideo
RUN cp /usr/share/zoneinfo/America/Montevideo /etc/localtime

RUN apk add --no-cache openjdk17-jre curl tar

RUN mkdir -p "$CATALINA_HOME"
WORKDIR $CATALINA_HOME

RUN curl -fSL "$TOMCAT_TAR_URL" -o tomcat.tar.gz \
 && tar -xvf tomcat.tar.gz --strip-components=1 \
 && rm bin/*.bat \
 && rm tomcat.tar.gz*

ADD $WAR_PATH /usr/local/tomcat/webapps/$WAR_NAME

EXPOSE 8080

CMD ["bin/catalina.sh", "run"]