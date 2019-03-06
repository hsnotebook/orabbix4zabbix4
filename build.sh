#!/bin/bash

echo "clean dist"
rm -rf dist/com dist/orabbix-1.2.3.jar

echo "compile Sender.java"
javac -d dist  -classpath "orabbix/lib/*" -sourcepath src src/com/smartmarmot/orabbix/Sender.java

cd dist

echo "add Sender.class to jar file"
cp orabbix-1.2.3-origin.jar orabbix-1.2.3.jar

jar uvf orabbix-1.2.3.jar com/smartmarmot/orabbix/Sender.class

cp orabbix-1.2.3.jar ../orabbix

cd ..

echo "build image"
docker build . -t zabbix-agent-oracle
