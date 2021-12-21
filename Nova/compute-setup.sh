#!/bin/bash

source admin-openrc

cat << EOF | mysql

CREATE DATABASE nova_api;
CREATE DATABASE nova;
CREATE DATABASE nova_cell0;

GRANT ALL PRIVILEGES ON nova_api.* TO 'nova'@'localhost' IDENTIFIED BY $OS_DB_PASS;
GRANT ALL PRIVILEGES ON nova_api.* TO 'nova'@'%' IDENTIFIED BY $OS_DB_PASS;
GRANT ALL PRIVILEGES ON nova.* TO 'nova'@'localhost' IDENTIFIED BY $OS_DB_PASS;
GRANT ALL PRIVILEGES ON nova.* TO 'nova'@'%' IDENTIFIED BY $OS_DB_PASS;
GRANT ALL PRIVILEGES ON nova_cell0.* TO 'nova'@'localhost' IDENTIFIED BY $OS_DB_PASS;
GRANT ALL PRIVILEGES ON nova_cell0.* TO 'nova'@'%' IDENTIFIED BY $OS_DB_PASS;
EOF

sleep 2

echo #############CREATE USER: NOVA##############
openstack user create --domain default --password $OS_PASSWORD nova

sleep 2
echo #############ADD ADMIN ROLE TO THE NOVA USER##############
openstack role add --project service --user nova admin

sleep 2
echo #############CREATE THE NOVA SERVICE ENTITY###############
openstack service create --name nova \
  --description "OpenStack Compute" compute

sleep 2 
echo ############CREATE ENDPOINTs##################
openstack endpoint create --region RegionOne \
	  compute public http://controller:8774/v2.1
openstack endpoint create --region RegionOne \
	  compute internal http://controller:8774/v2.1
openstack endpoint create --region RegionOne \
	  compute admin http://controller:8774/v2.1

sleep 2                                                        
echo ###########INSTALL NOVA##################
apt install nova-api nova-conductor nova-novncproxy nova-scheduler -y

echo ################CONFIG DI BAN OI#############

exit;
