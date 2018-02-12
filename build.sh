#!/bin/bash
# Script to bild new VM using OpenStack CLI tools
# Syntax: build.sh <server name> <number of servers> <server size>

if [ $# -eq 0 -o $# -gt 3 ]; then
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

        echo " "
        echo "Creating Virtual machine..."
        echo " "

        echo " "
        echo "Virtual Machine has been created, please associate floating IP in GUI and press ENTER to continue."
        read
        echo " "

     fi
  fi

  while true; do
  echo "Please wait...";
  /usr/bin/wget "http://87.254.4.135" --timeout 6 -O - 2>/dev/null | grep "Hello";
  sleep 10;
  done

done
