#!/bin/bash

# Add dockerhost to /etc/hosts
echo "Provisioning virtual machine"

echo "Install Ansible"
echo deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main >> /etc/apt/sources.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
echo "Install MongoDB"
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "Install Elasticsearch"
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
apt-get install apt-transport-https
echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic.list


apt-get update -y
apt-get install ansible -y
apt-get install mongodb-org -y
apt-get update -y
