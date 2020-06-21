#!/bin/bash

cd ../K8-Deployment/spark-on-kubernetes-master-kaustav

kubectl delete serviceaccount spark
kubectl delete -f spark-account-role.yaml
kubectl delete clusterrolebinding spark-role
kubectl create serviceaccount spark
kubectl create -f spark-account-role.yaml
kubectl create clusterrolebinding spark-role --clusterrole=spark --serviceaccount=default:spark --namespace=default

kubectl delete -f spark-master-controller.yaml
kubectl delete -f spark-master-service.yaml
kubectl delete -f spark-worker-controller.yaml
kubectl create -f spark-master-controller.yaml
kubectl create -f spark-master-service.yaml
kubectl create -f spark-worker-controller.yaml

