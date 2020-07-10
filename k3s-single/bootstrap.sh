#!/bin/sh

curl -fsSL get.docker.com | sh
usermod -aG docker `whoami`
systemctl enable docker && systemctl start docker

curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--docker --no-flannel" sh -


wget https://github.com/rancher/k3s/releases/download/v1.17.3%2Bk3s1/k3s-airgap-images-amd64.tar
mkdir -p /var/lib/rancher/k3s/agent/images/
cp k3s-airgap-images-amd64.tar /var/lib/rancher/k3s/agent/images/

wget https://github.com/rancher/k3s/releases/download/v1.17.3%2Bk3s1/k3s
mv k3s /usr/local/bin/ 
k3s server --docker

curl https://docs.projectcalico.org/v3.6/getting-started/kubernetes/installation/hosted/kubernetes-datastore/calico-networking/1.7/calico.yaml -O
sed -i -e "s?192.168.1.0/16?10.42.0.0/16?g" calico.yaml
kubectl apply -f calico.yaml

cp /etc/rancher/k3s/k3s.yaml   ~/.kube/config

which kubectl
kubectl version
kubectl get node -o wide
kubectl get ns
k3s --version
systemctl status k3s

cat /var/lib/rancher/k3s/server/node-token


k3s kubectl create -f https://kubernetes.io/docs/user-guide/nginx-deployment.yaml

