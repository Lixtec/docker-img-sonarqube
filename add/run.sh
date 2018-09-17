#!/bin/bash
set -e

if [ "${1:0:1}" != '-' ]; then
	exec "$@"
fi

# Modification des configurations dans sonar.properties
if [ ! -z "$HTTP_PROXY_HOST" ]; then
	sed -i 's|#http.proxyHost=|http.proxyHost='"$HTTP_PROXY_HOST"'|g' /opt/sonarqube/conf/sonar.properties
fi

if [ ! -z "$HTTP_PROXY_PORT" ]; then
	sed -i 's|#http.proxyPort=|http.proxyPort='"$HTTP_PROXY_PORT"'|g' /opt/sonarqube/conf/sonar.properties
fi

chown -R sonarqube:sonarqube $SONARQUBE_HOME
exec gosu sonarqube \
  java -jar lib/sonar-application-$SONAR_VERSION.jar \
  -Dsonar.log.console=true \
  -Dsonar.jdbc.username="$SONARQUBE_JDBC_USERNAME" \
  -Dsonar.jdbc.password="$SONARQUBE_JDBC_PASSWORD" \
  -Dsonar.jdbc.url="$SONARQUBE_JDBC_URL" \
  -Dsonar.web.javaAdditionalOpts="$SONARQUBE_WEB_JVM_OPTS -Djava.security.egd=file:/dev/./urandom" \
  "$@"