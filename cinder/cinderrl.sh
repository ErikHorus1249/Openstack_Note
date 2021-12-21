#!/bin/bash
service nova-api restart
echo nova-api restarted!
sleep 2
service cinder-scheduler restart
echo [+]cinder-scheduler restarted!
sleep 2
service apache2 restart
echo [+]apache2 restarted!

