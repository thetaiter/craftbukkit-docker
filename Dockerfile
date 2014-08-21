#DOCKER VERSION 1.1.2
FROM phusion/baseimage:0.9.12

ENV HOME /root

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install openjdk-7-jre-headless wget

RUN mkdir -p /root/minecraft
RUN mkdir -p /root/scripts

COPY ./server /root/minecraft
COPY ./scripts /root/scripts

RUN cd /root/scripts && wget http://dl.bukkit.org/latest-beta/craftbukkit.jar

EXPOSE 25565

CMD ["/root/scripts/craftbukkit.sh"]
