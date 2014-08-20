#DOCKER VERSION 1.1.2
FROM phusion/baseimage:0.9.12

RUN apt-get update
RUN apt-get -y install openjdk-7-jre-headless wget

RUN mkdir /jars
RUN cd /jars && wget http://dl.bukkit.org/latest-beta/craftbukkit.jar

EXPOSE 25565

CMD ["/minecraft/craftbukkit.sh"]
