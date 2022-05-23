# Please su into root and run this as ./1.sh and not using bash.
# Run this script on both master and worker nodes.

#!/bin/bash
read -p "Enter your master-node's IP address : " IP1 
export MIP=$IP1
read -p "Enter your worker-node's IP address : " IP2
export WIP=$IP2 
sed -i "1i $MIP kubernetes-master.learnitguide.net kubernetes-master" /etc/hosts11
sed -i "2i $WIP kubernetes-worker1.learnitguide.net kubernetes-worker1" /etc/hosts11
sudo swapoff -a
sudo apt-get update && sudo apt-get install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update && sudo apt-get install -y kubelet=1.20.0-00 kubeadm=1.20.0-00 kubectl=1.20.0-00 docker.io
sudo systemctl start docker && sudo systemctl enable docker
