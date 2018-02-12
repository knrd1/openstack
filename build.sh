#!/bin/bash
# Script to bild new VM using OpenStack CLI tools
# Syntax: build.sh <server name> <number of servers> <server size>

if [ $# -eq 0 -o $# -gt 3 ]; then
  echo " "
  echo "Syntax: ./build.sh <server name> <number of servers> <server size>" 1>&2
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
        source ~/Konrad-openrc.sh
        VM="$1"
        COUNT="$2"
        FLAVOR="$3"
        IMAGE="Ubuntu 16.04 LTS"
        KEY="konrad"
        GROUP="default"
        NIC="net-id=0a8d12af-e534-421a-8ad4-e326dc14dd9b"
        USERDATA="userdata.txt"
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
        echo " "
        read -p "Virtual Machine has been created, please associate floating IP in GUI, paste IP here and press ENTER to continue: " IP
        echo " "
     fi
  fi

  while ! curl -s --head --request GET http://"$IP" | grep "200 OK" > /dev/null; do
    echo "Configuring web applications, please wait..."
    sleep 10;
  done

  echo " "
  echo "Web application is online: http://$IP"
  echo " "

done
