#!/bin/sh
BINDIR=$(dirname "$(readlink -fn "$0")")

cd "$BINDIR"
java -Xmx1024M -jar /jars/craftbukkit.jar -o true
