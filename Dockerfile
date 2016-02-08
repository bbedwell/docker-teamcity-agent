FROM iron/java:1.8

ENV DOCKER_VERSION 1.10.0
ENV TEAMCITY_SERVER http://teamcity:8111

RUN apk add --update wget git bash
RUN wget --progress=bar:force -O /bin/docker https://get.docker.com/builds/Linux/x86_64/docker-$DOCKER_VERSION \
        && chmod +x /bin/docker

RUN apk add --update unzip

ADD install.sh /install.sh
RUN chmod +x /install.sh

EXPOSE 9090
ENTRYPOINT ["/install.sh"]
CMD ["run"]
