#!/bin/bash

mkdir -p ~/.ssh
chmod 700 ~/.ssh

# Suould generate a pair of keys
# insert public key here, all in one line 
var = "ssh-rsa public key"
echo $var > ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys

# Enable Public key authentication
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bkp
cat /etc/ssh/sshd_config | sed -e 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/g' > /etc/ssh/sshd_config.new
mv /etc/ssh/sshd_config.new /etc/ssh/sshd_config
rm -f /etc/ssh/sshd_config.new

systemctl restart sshd
