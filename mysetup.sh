#! /usr/bin/bash

UIDA="ctoney"
UIDN="Christopher Toney"
HOMENET="192.168.1.0/24"
PUBKEY="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDQQPz8/3pgtVSEajFBlhQxDrfEUnOTqMYmII3Kiyk/KWF5cZ3AUd8sj7jB1Zr1+hysHIviPd869mflwdyymXpXrlyAo1aH35Ph0Y+naIBICzYMdPYdGJf+09eyA15z47Wz9aAYUIYGP7nvRYQS8IE1tj/O9pdC8anEiDkHH5Oo+JEWaoI4dKxlQGlP8y0SWSNC05YRHwi7uuqs1ZGE/FeRk1E791HzoKtvqH7ZDVlFxkDGT0Lue46p3B4doj0MnZn2PT9VLAA2s06wgBlQpMRbw3kqtvd+OWtVgaTSAan/JbNmTLHVSQU7LvxkEMKJBORS/HdzyOoI1Uvr60JL19fwnDJXmdNw99bZPGzl6qEnedCt6IqpiJd/hbq3YfM7A3RzyqdUm318ZptY/1+kzGe9wUTdOXizsKe7blfXDjsZcLJ2qOa32VD6z7RqcFc27qKQ0T2cvYgPWyoKzEbNFrtnDfOKeS23eOWkELQmfFTsjlQ7+VEZs+rrKI8FQ+4KQds="


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

