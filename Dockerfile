FROM tomcat:10.1-jdk21-temurin-jammy
#### Good stuff
COPY target/*.war /usr/local/tomcat/webapps/maven-web-app.war
