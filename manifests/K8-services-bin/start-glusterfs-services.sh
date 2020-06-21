#!/bin/bash

cd ../K8-Deployment/GLUSTER_FS
kubectl delete -f glusterfs-service.json
kubectl delete -f glusterfs-endpoints.json
kubectl create -f glusterfs-endpoints.json
kubectl create -f glusterfs-service.json

