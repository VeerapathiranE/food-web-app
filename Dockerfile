FROM tomcat:9.0-jdk17-temurin

RUN rm -rf /usr/local/tomcat/webapps/ROOT

COPY FoodOrdering.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
