# pikluster

A flux managed kubernetes k3s cluster running on raspberry pi 4B. 

## k3s installation

[k3sup](https://github.com/alexellis/k3sup) is used to orchestrate k3s installation / upgrade. See `k3sup_pikluster.sh`.

## Infrastructure

This bare metal cluster provisions its own load balancer, ingress controller, cert-manager, block storage, and rancher. When possible these are installed via helm. To reduce the chance of things breaking, any such critical components have their version numbers pinned. 

When considering an upgrade to the kubernetes version or rancher installation, verify their [compatibility](https://artifacthub.io/packages/helm/rancher-stable/rancher).

## Secrets

TODO