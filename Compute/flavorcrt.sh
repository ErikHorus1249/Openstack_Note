
#!/bin/sh

. admin-openrc

openstack flavor create --public m1.small --id auto \
    --ram 2048 --disk 20 --vcpus 1 --rxtx-factor 1
echo [+] m1.small created!
sleep 3

openstack flavor create --public m1.medium --id auto \
    --ram 4096 --disk 40 --vcpus 2 --rxtx-factor 1

echo [+] m1.medium created!
sleep 3

openstack flavor create --public m1.large --id auto \
    --ram 8192 --disk 80 --vcpus 4 --rxtx-factor 1


echo [+] m1.largee created!
