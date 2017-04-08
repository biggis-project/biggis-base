FROM anapsix/alpine-java:8_server-jre

MAINTAINER wipatrick

ARG ORACLEJAVA_=oracle-java8-jre-alpine

ARG BUILD_DATE
ARG VCS_REF

LABEL eu.biggis-project.build-date=$BUILD_DATE \
      eu.biggis-project.license="MIT" \
      eu.biggis-project.name="BigGIS" \
      eu.biggis-project.url="http://biggis-project.eu/" \
      eu.biggis-project.vcs-ref=$VCS_REF \
      eu.biggis-project.vcs-type="Git" \
      eu.biggis-project.vcs-url="https://github.com/biggis-project/biggis-base" \
      eu.biggis-project.environment="dev" \
      eu.biggis-project.version=$ORACLEJAVA

ADD repositories /etc/apk
RUN apk add --no-cache bash gosu@testing tzdata

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

WORKDIR /home

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
