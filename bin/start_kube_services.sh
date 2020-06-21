#!/bin/sh
kubectl create -f ../manifests/account_roles/default_account_role.yaml -n default
cd ../manifests/persistent_volume_claims
kubectl create -f common-disk-azurefile-pv-claim.yaml -n kubeflow
cd ../K8-Deployment/zk
kubectl delete -f zookeeper.yaml -n kubeflow
kubectl create -f zookeeper.yaml -n kubeflow
cd ../../K8-Deployment/ks
kubectl delete -f kafka.yaml -n kubeflow
kubectl create -f kafka.yaml -n kubeflow

