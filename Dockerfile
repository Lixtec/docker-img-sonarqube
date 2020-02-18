ARG SONARQUBE_VERSION=6.7.5
FROM sonarqube:${SONARQUBE_VERSION}

MAINTAINER ludovic.terral@lixtec.fr

ENV SONARQUBE_VERSION=${SONARQUBE_VERSION:-6.7.5} 
ENV SONARQUBE_JDBC_URL=jdbc:h2:tcp://localhost:9092/sonar

USER root
COPY add/run.sh /bin/
RUN chmod +x /bin/run.sh

ENTRYPOINT ["/bin/run.sh"]

VOLUME "$SONARQUBE_HOME/conf"
VOLUME "$SONARQUBE_HOME/data"
VOLUME "$SONARQUBE_HOME/logs"
