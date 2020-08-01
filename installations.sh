#!/bin/bash


# Jenkins Installation

sudo yum install java-1.8.0-openjdk-devel

curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo

sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key

sudo yum install jenkins

sudo systemctl start jenkins

sudo systemctl enable jenkins

# Docker Installation

curl -fsSL https://get.docker.com -o get-docker.sh

sh get-docker.sh

# Ansible Installation

sudo yum install ansible -y

