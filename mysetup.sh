#! /usr/bin/bash

UIDA="UID"
UIDN="UserName"
HOMENET="192.168.1.0/24"
PUBKEY="PubKey"

## Update OS
apt update
apt upgrade -y
apt clean

## Install Openssh-server
apt install openssh-server -y

## Create user
adduser $UIDA --gecos "$UIDN" --disabled-password

## Add user to sudo group
usermod -aG sudo $UIDA

## Add public key to authorized users
mkdir /home/$UIDA/.ssh/
touch /home/$UIDA/.ssh/authorized_keys
chmod 0644 /home/$UIDA/.ssh/authorized_keys
echo "$PUBKEY" >> /home/$UIDA/.ssh/authorized_keys
chown $UIDA:$UIDA /home/$UIDA/.ssh -R
passwd $UIDA

## open firewall to 192.168.x.x
ufw enable
ufw allow from $HOMENET to any port 22
ufw status

