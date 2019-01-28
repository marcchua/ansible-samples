!/bin/bash

echo '%sudo ALL=(ALL) NOPASSWD: ALL' | sudo EDITOR="tee -a" visudo -f /etc/sudoers.d/ubuntu

sudo apt-get update
sudo apt-get install software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt-get install ansible -y

ansible localhost -m ping



