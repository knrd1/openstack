#!/bin/bash
# Script to build new VM using OpenStack CLI tools
# Syntax: build.sh <app> <num_servers> <server_size>

if [ $# -eq 0 -o $# -gt 4 ]; then
   echo "Syntax: ./build.sh <VM name> <number of servers> <server size>" 1>&2
   exit 1
fi
PS3="Choose option: "

select menu in create leave

do

if [ "$menu" = "" ] ; then
        echo "Please choose option"
        echo " "
        continue

elif [ "$menu" = leave ] ; then
        echo "Bye"
        echo " "
        break

elif [ "$menu" = create ] ; then
        read -p "Do you want ot create new virtual machine? y/n: " choice
        echo " "

        if [ "$choice" = n ] ; then
                continue
        elif [ "$choice" = y ] ; then

source ~/Konrad-openrc.sh
VM="$1"
COUNT="$2"
FLAVOR="$3"
IMAGE="Ubuntu 16.04 LTS"
KEY="konrad"
GROUP="default"
NIC="net-id=0a8d12af-e534-421a-8ad4-e326dc14dd9b"
USERDATA="userdata.txt"

   echo "Creating Virtual machine"
        openstack server create \
        --flavor "$FLAVOR" \
        --image  "$IMAGE" \
        --key-name "$KEY" \
        --security-group "$GROUP" \
        --nic "$NIC" \
        --user-data "$USERDATA" \
        "$VM"

   echo "Virtual Machine created"
      echo "Virtual Machine created, please associate floating IP "87.254.4.135" in GUI and press enter to continue."
   read
   
        continue
        fi
fi

while true; do
echo "Please wait...";
/usr/bin/wget "http://87.254.4.135" --timeout 6 -O - 2>/dev/null | grep "Hello";
sleep 10;
done
done
