FROM ubuntu:xenial

RUN apt-get update \
 && apt-get -y install \
      build-essential \
      curl \
      libfontconfig-dev \
      libsdl2-dev \
      libsdl2-ttf-dev \
      qt5-default

VOLUME /workspace
WORKDIR /workspace

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["compile"]
