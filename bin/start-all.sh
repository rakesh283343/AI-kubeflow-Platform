#!/bin/bash

../bin/start-kubeflow.sh
../bin/start_kube_services.sh
#brew install helm
helm repo add stable https://kubernetes-charts.storage.googleapis.com/
helm install  stable/superset --generate-name -n kubeflow
helm install stable/airflow --version 7.1.5 --generate-name -n kubeflow
