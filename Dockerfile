FROM tomcat:8.5-jre8
RUN rm -fr /usr/local/tomcat/webapps/ROOT
COPY WebByMyself.war /usr/local/tomcat/webapps/ROOT.war
