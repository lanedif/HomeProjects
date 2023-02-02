#! /usr/bin/bash

## Update OS 
apt update
apt upgrade -y 
apt clean 

## Install Openssh-server
apt install openssh-server -y


## Create user
adduser ctoney --gecos "Christopher A Toney" --disabled-password

## Add user to sudo group
usermod -aG sudo ctoney

## Add public key to authorized users


## open firewall to 192.168.x.x
