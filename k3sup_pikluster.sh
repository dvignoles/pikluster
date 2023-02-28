#! /bin/bash

export SERVER_IP=192.168.50.101
export USER=pi
export AGENT1=192.168.50.103
export AGENT2=192.168.50.105
export AGENT3=192.168.50.107
# bump this version and re-run to perform upgrades
export VERSION=v1.24.10+k3s1


k3sup install \
    --ip $SERVER_IP \
    --user $USER \
    --k3s-version $VERSION \
    --k3s-extra-args '--flannel-iface=eth0 --disable servicelb --disable traefik' \
    --local-path $HOME/.kube/config \
    --context "picluster"

install_agent () {
    k3sup join --ip "$1" --server-ip $SERVER_IP --user $USER \
    --k3s-version $VERSION \
    --k3s-extra-args '--flannel-iface=eth0'
}

install_agent $AGENT1
install_agent $AGENT2
install_agent $AGENT3
