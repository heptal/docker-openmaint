FROM tomcat:7-jre8

ENV OPENMAINT=openmaint-1.0-2.3.1
ENV OPENMAINTZIP=${OPENMAINT}.zip
ENV HOST='http://198.199.85.11:8000'
# ENV HOST='http://downloads.sourceforge.net/project/openmaint/1.0'
RUN set -x \
  && curl -L ${HOST}/${OPENMAINTZIP} -O \
  && unzip $OPENMAINTZIP
RUN set -x \
  && mv $OPENMAINT openmaint \
  && rm $OPENMAINTZIP
RUN set -x \
  && cd openmaint \
  && cp extras/tomcat-libs/6.0/postgresql-9.1-901.jdbc4.jar $CATALINA_HOME/lib/ \
  && cp scheduler/scheduler-utils-0.1.jar $CATALINA_HOME/lib/ \
  && cp openmaint-*.war $CATALINA_HOME/webapps/openmaint.war

EXPOSE 8080

