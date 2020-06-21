#!/bin/bash

cd ../K8-Deployment/ks

kubectl delete -f kafka.yaml
kubectl create -f kafka.yaml
