craftbukkit-docker
==================
Dockerized craftbukkit with phusion/baseimage

This repository's purpose is to run a minecraft craftbukkit server within a docker container.

###Installation
In order to install craftbukkit-docker, you must first have docker successfully installed on your machine. You can see how to do this [here](http://docs.docker.com/installation/ubuntulinux/). Once you have docker set up, you can install craftbukkit-docker by following these steps:

* Step 1: Clone this repository locally
```
$ mkdir ~/minecraft <br>
$ cd ~/minecraft
$ git clone https://github.com/thetaiter/craftbukkit-docker.git
$ cd craftbukkit-docker
```
* Step 2: Configure your server<br>
  If you are starting a fresh server without any preconfigured properties, skip to step (3). If you would like to place your own preconfigured server in the container, you must add all of your server files to the 'server' folder in your local copy of this repository. A 'server.properties' file has already been added with some default values. In order for your own custom world to be loaded properly, you will have to either change the names of your world folders, or edit this 'server.properties' file (recommended). You may also provide your own 'server.properties' file, or any other file that craftbukkit creates for a minecraft server.<br>
  * Altering your world folders:
    * If you already have a world you would like to import into craftbukkit-docker, you should have three folders that contain your world's information. They will be named in the following format:
      * yourWorldsName
      * yourWorldsName_nether
      * yourWorldsName_the_end
    * You must rename these to this in order for your world to import properly:
      * world
      * world_nether
      * world_the_end
  * Altering the 'server.properties' file:
    * You will need to change the `level-name=world` property to `level-name=yourWorldName`. This is the recommended option because it allows for custom world names.<br>

* Step 3: Install craftbukkit-docker<br>
Once you have your server configured the way you want, enter this command in the terminal to install craftbukkit-docker:

```
 $ cd ~/minecraft/craftbukkit-docker && sudo docker build -t craftbukkit .
```

At this point, an image will be created called `craftbukkit`. Next we will need to create the craftbukkit container by running the craftbukkit image. This can be done with the following command:
```
 $ sudo docker run -d -i -p 25565:25565 -v [some-path]/craftbukkit-docker/server:/root/minecraft --name craftbukkit craftbukkit
```
Be sure to replace '[some-path]' in that command with the global path to your craftbukkit-docker repository. If you have followed this tutorial to the tee, this path can be found by entering this command:
```
 $ echo ~
```
Give it a few seconds and your craftbukkit server should be up and running! You can check that the container started successfully and didn't die for some reason with the following command:
```
 $ sudo docker ps
```
You can also check the server logs, located in the 'server' folder. This works because the `-v` in docker allows us to mount a local folder into the docker container, so you can actually manipulate your server from outside the container. Pretty cool huh?
