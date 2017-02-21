FROM ubuntu:latest

MAINTAINER GAULUPEAU Jonathan <jo.gaulupeau@gmail.com>

RUN apt-get update &&\
  apt-get install -y curl


WORKDIR /factorio
RUN curl -L -k https://www.factorio.com/get-download/0.14.22/headless/linux64 | tar --strip-components=1 -xzf -

VOLUME ["/factorio/saves"]
VOLUME ["/factorio/mods"]

EXPOSE 34197/udp

COPY start start
COPY server-settings.json data/server-settings.json
COPY map-gen-settings.json data/map-gen-settings.json

ENTRYPOINT ["./start"]
