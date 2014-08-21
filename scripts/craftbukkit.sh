#!/bin/sh

mv /root/scripts/craftbukkit.jar /root/minecraft
cd /root/minecraft
java -Xmx1024M -jar /root/minecraft/craftbukkit.jar -o true
