FROM mdillon/postgis:9.1

RUN apt-get update && apt-get install -y curl unzip
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
ADD init-openmaint-postgres.sh /docker-entrypoint-initdb.d/
# ADD openmaint-demo.sql /docker-entrypoint-initdb.d/

