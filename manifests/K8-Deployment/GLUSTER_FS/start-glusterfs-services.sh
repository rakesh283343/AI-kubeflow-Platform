#!/bin/bash

kubectl create -f glusterfs-endpoints.json
kubectl create -f glusterfs-service.json

