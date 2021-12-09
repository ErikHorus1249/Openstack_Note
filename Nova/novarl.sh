#!/bin/sh

service nova-api restart
echo [+]nova-api restarted!
sleep 1
service nova-scheduler restart
echo [+]nova-scheduler restarted!
sleep 1
service nova-conductor restart
echo [+]nova-conductor restarted!
sleep 1
service nova-novncproxy restart
echo [+]nova-novncproxy restarted!
