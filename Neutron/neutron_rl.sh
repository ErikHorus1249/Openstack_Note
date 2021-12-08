#!/bin/sh

service nova-api restart
sleep 3
echo [+]reloaded nova-api, Done!
service neutron-server restart
echo [+]reloaded neutron-server, Done!
sleep 2
service neutron-linuxbridge-agent restart
echo [+]reloaded linuxbridge-agent, Done!
sleep 2
service neutron-dhcp-agent restart
echo [+]reloaded dhcp-agent, Done!
sleep 2
service neutron-metadata-agent restart
echo [+]reloaded metadata-agent, Done!
service neutron-l3-agent restart
echo [+]reloaded l3-agent, Done!
