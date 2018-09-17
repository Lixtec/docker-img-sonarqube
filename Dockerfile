FROM sonarqube:6.7

MAINTAINER GPMM

ENV SONARQUBE_JDBC_URL=jdbc:h2:tcp://localhost:9092/sonar

COPY add/run.sh /bin/
RUN chmod +x /bin/*.sh

ENTRYPOINT ["/bin/run.sh"]

VOLUME "$SONARQUBE_HOME/conf"
VOLUME "$SONARQUBE_HOME/data"
VOLUME "$SONARQUBE_HOME/logs"