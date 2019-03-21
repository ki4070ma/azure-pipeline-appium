#!/usr/bin/env bash

$ANDROID_HOME/platform-tools/adb devices
id=`docker ps -a | grep butomo | cut -d ' ' -f 1`
ip=`docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $id`
$ANDROID_HOME/platform-tools/adb connect $ip:5555
$ANDROID_HOME/platform-tools/adb devices
lsof -n -i:4723 | grep LISTEN

sleep 60
$ANDROID_HOME/platform-tools/adb devices
