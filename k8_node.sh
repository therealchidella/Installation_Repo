#!/bin/bash

 install Kubernetes on a CentOS 7 server:

IN ALL NODES: *Note Commands 1-10 need to be run on all nodes.



1.    The first thing that we are going to do is use SSH to log in to all machines. Once we have logged in, we need to elevate privileges using sudo.

    sudo su

2.    Disable SELinux.

    setenforce 0
    sed -i --follow-symlinks 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux

3.    Enable the br_netfilter module for cluster communication.

    modprobe br_netfilter
    echo '1' > /proc/sys/net/bridge/bridge-nf-call-iptables

4.    Disable swap to prevent memory allocation issues.

     swapoff -a
     vim /etc/fstab  ->  Comment out the swap line

5.    Install the Docker prerequisites.

     yum install -y yum-utils device-mapper-persistent-data lvm2

6.    Add the Docker repo and install Docker.

     yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
     yum install -y docker-ce

7.    Configure the Docker Cgroup Driver to systemd, enable and start Docker

     sed -i '/^ExecStart/ s/$/ --exec-opt native.cgroupdriver=systemd/' /usr/lib/systemd/system/docker.service
     systemctl daemon-reload
     systemctl enable docker --now
     systemctl status docker
     docker info | grep -i cgroup

8.    Add the Kubernetes repo.

    cat <<EOF > /etc/yum.repos.d/kubernetes.repo
    [kubernetes]
    name=Kubernetes
    baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
    enabled=1
    gpgcheck=0
    repo_gpgcheck=0
    gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg
          https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
    EOF

9.    Install Kubernetes.

     yum install -y kubelet kubeadm kubectl

10.    Enable Kubernetes. The kubelet service will not start until you run kubeadm init.

    systemctl enable kubelet




### Complete the following steps on the NODES ONLY!

16. Run the join command that you copied earlier (this command needs to be run as sudo), then check your nodes from the master.

kubectl get nodes
