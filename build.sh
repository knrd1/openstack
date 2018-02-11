#!/bin/bash
# Script to bild new VM using OpenStack CLI tools
# Syntax: build.sh <app> <num_servers> <server_size>

if [ $# -eq 0 -o $# -gt 4 ]; then
   echo "Syntax: ./build.sh <VM name> <number of servers> <server size>" 1>&2
   exit 1
fi

source ~/Konrad-openrc.sh
VM="$1"
COUNT="$2"
FLAVOR="$3"
IMAGE="Ubuntu 16.04 LTS"
KEY="konrad"
GROUP="default"
NIC="net-id=0a8d12af-e534-421a-8ad4-e326dc14dd9b"
COUNT="1"
   echo "Creating Virtual machine"
        openstack server create \
        --flavor "$FLAVOR" \
        --image  "$IMAGE" \
        --key-name "$KEY" \
        --security-group "$GROUP" \
        --nic "$NIC" \
        "$VM"

   echo "Virtual Machine created"
