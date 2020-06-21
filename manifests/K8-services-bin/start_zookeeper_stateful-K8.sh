#!/bin/bash

cd ../K8-Deployment/zk
kubectl delete -f zookeeper.yaml
kubectl create -f zookeeper.yaml
