#!/bin/bash
kubectl config set-context $(kubectl config current-context) --namespace=default
#../K8-services-bin/start-glusterfs-services.sh
../K8-services-bin/start_zookeeper_stateful-K8.sh
../K8-services-bin/start-kafka-stateful-K8.sh
../K8-services-bin/Grana_InfluxDB_K8_Deploy.sh
#../K8-services-bin/start-ignite-K8.sh
#../K8-services-bin/start-spark-k8.sh

