#!/bin/bash
cd ${KF_DIR}
# If you want to delete all the resources, run:
../kfctl delete -f ${CONFIG_FILE}
#kubectl delete ns kubeflow
#kubectl delete ns istio-system
