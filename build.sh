#!/bin/bash
# Script to bild new VM using OpenStack CLI tools
# Syntax: build.sh <app> <environment> <num_servers> <server_size>

source ~/Konrad-openrc.sh

FLAVOR="m1.small"
IMAGE="Ubuntu 16.04 LTS"
KEY="konrad"
SECGROUP="default"
NIC="net-id=0a8d12af-e534-421a-8ad4-e326dc14dd9b"
COUNT="1"
