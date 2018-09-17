# SonarQube docker image

## Description

### All in one
SonarQube is an open platform to manage code quality. As such, it covers the 7 axes of code quality:

![all-in-one](http://www.sonarqube.org/wp-content/themes/sonar/images/7axes.png)

### Extend with plugins
Covering new languages, adding rules engines, computing advanced metrics can be done through a powerful extension mechanism. More than 50 plugins are already available.

![extend plugins](http://www.sonarqube.org/wp-content/themes/sonar/images/3clicks.png)

### Languages covered
More than 20 programming languages are covered through plugins including Java, C#, C/C++, PL/SQL, Cobol, ABAP…      

### In 3 clicks
SonarQube has got a very efficient way of navigating, a balance between high-level view, dashboard, TimeMachine and defect hunting tools. This enables to quickly uncover projects and / or components that are in Technical Debt to establish action plans.

### Quality is central
SonarQube is a web-based application. Rules, alerts, thresholds, exclusions, settings… can be configured online. By leveraging its database, SonarQube not only allows to combine metrics altogether but also to mix them with historical measures.


## Technical datas
### Exposed volumes

    VOLUME ["$SONARQUBE_HOME/conf", "$SONARQUBE_HOME/data", "$SONARQUBE_HOME/extensions"] (default sonarqube_home = /opt/sonarqube)
    
### Exposed ports

    :9000

### Environment Variables
The sonarqube image uses several environment variables which are easy to miss. While none of the variables are required, they may significantly aid you in using the image.

#### `HTTP_PROXY_HOST`

Proxy Url for Soanrqube updateCenter

#### `HTTP_PROXY_PORT`

Proxy Port for Sonarqube updateCenter

#### `SONARQUBE_JDBC_URL`

URL to the database (eg : jdbc:mysql://mysqlserver/sonar:3306) - default H2 sembedded database

#### `SONARQUBE_JDBC_USERNAME`

Username For database connection

#### `SONARQUBE_JDBC_PASSWORD`
Password for database connection