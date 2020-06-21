#!/bin/bash

cd ../K8-Deployment/grafana_influxdb_sidecar/Docker

docker build -t kaustav4284/influxdb005:firstbuild .
docker push kaustav4284/influxdb005:firstbuild

cd ..
kubectl delete -f heapster-rbac.yaml
kubectl delete -f influxdb-grafana-controller.yaml
kubectl delete -f grafana-service.yaml
kubectl delete -f influxdb-service.yaml
kubectl create -f grafana-service.yaml
kubectl create -f influxdb-service.yaml
kubectl create -f influxdb-grafana-controller.yaml
sleep 20
POD=$(kubectl get po -n kube-system | grep monitoring | cut -d' ' -f1)
container=influxdb

kubectl exec -n kube-system $POD -c $container -- /bin/bash ./Initialize_influxdb.sh
