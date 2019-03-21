#!/usr/bin/env bash

$ANDROID_HOME/platform-tools/adb devices
id=`docker ps -a | grep butomo | cut -d ' ' -f 1`
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $id
