#!/bin/bash

# Vim Installation

sudo yum install vim-enhanced -y
# Jenkins Installation

sudo yum install java-1.8.0-openjdk-devel -y

curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo

sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key

sudo yum install jenkins -y

sudo systemctl start jenkins

sudo systemctl enable jenkins

# Docker InstallationW

curl -fsSL https://get.docker.com -o get-docker.sh

sh get-docker.sh

# Ansible Installation

sudo yum install epel-release -y

sudo yum install ansible -y

