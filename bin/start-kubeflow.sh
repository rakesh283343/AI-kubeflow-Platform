#!/bin/bash
#kubectl create -f https://raw.githubusercontent.com/NVIDIA/k8s-device-plugin/1.0.0-beta4/nvidia-device-plugin.yml -n kube-system
#rm -rf ${KF_DIR}
#mkdir -p ${KF_DIR}
cd ${KF_DIR}
#../kfctl build -V -f ${CONFIG_URI}
export CONFIG_FILE=${KF_DIR}/kfctl_k8s_istio.v1.0.2.yaml
../kfctl apply -V -f ${CONFIG_FILE}
