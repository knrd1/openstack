#!/bin/bash
# Script to build new VM using OpenStack CLI tools
# Syntax: build.sh <server name> <server size>
# Server size options: m1.tiny m1small m1.medium m1.large m1.xlarge
# Version 0.03 BETA

CREDS="Konrad-openrc.sh"
USERDATA="userdata.sh"
VM="$1"
FLAVOR="$2"
IMAGE="Ubuntu 16.04 LTS"
KEY="konrad"
GROUP="default"
NIC="net-id=0a8d12af-e534-421a-8ad4-e326dc14dd9b"
source Konrad-openrc.sh

if [ ! -e "$USERDATA" -a ! -e "CREDS" ] ; then
  echo "Missing files! Make sure that "Konrad-openrc.sh" and "userdata.sh" exist in this directory"
  exit 1
fi

if [ $# -eq 0 -o $# -gt 2 ]; then
  echo " "
  echo "Syntax: ./build.sh <server name> <server size>" 1>&2
  echo " "
  exit 1
fi

PS3="Choose option: "

select menu in create leave; do
  if [ "$menu" = "" ] ; then
    echo "Please choose option"
    echo " "
    continue
  elif [ "$menu" = leave ] ; then
    echo "Bye"
    echo " "
    break
  elif [ "$menu" = create ] ; then
    read -p "Do you want to create new virtual machine? y/n: " choice
    echo " "
      if [ "$choice" = n -o "$choice" = "" ] ; then
         continue
      elif [ "$choice" = y ] ; then
        echo " "
        echo "Creating Virtual machine..."
        echo " "
        openstack server create \
        --flavor "$FLAVOR" \
        --image  "$IMAGE" \
        --key-name "$KEY" \
        --security-group "$GROUP" \
        --nic "$NIC" \
        --user-data "$USERDATA" \
        "$VM"
          if [ ! "$?" = 0 ]; then
            exit 1
          fi
        echo " "
        while ! ping -c1 "$IP" &>/dev/null; do
          read -p "Virtual Machine has been created, please associate floating IP in GUI, paste IP here and press ENTER to continue: " IP
        done
        echo " "
        echo "Floating IP assigned"
        echo " "
     fi
  fi

  while ! curl -m 3 -s --head --request GET http://"$IP" | grep "200 OK" > /dev/null; do
    echo "Configuring web applications, please wait..."
    sleep 10;
  done

  echo " "
  echo "Web application is online: http://$IP"
  echo " "

done
