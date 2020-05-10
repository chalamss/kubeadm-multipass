#!/bin/bash
SECONDS=0
./1-deploy-kubeadm-master.sh
masterduration=$SECONDS
echo "############################################################################"
echo "Master node create and configure took $(($masterduration / 60)) minutes and $(($masterduration % 60)) seconds."
echo "############################################################################"
SECONDS=0
./2-deploy-kubeadm-nodes.sh
workerduration=$SECONDS
echo "############################################################################"
echo "Worker node create and configure took$(($workerduration / 60)) minutes and $(($workerduration % 60)) seconds."
echo "############################################################################"
SECONDS=0
./3-kubeadm_join_nodes.sh
joinduration=$SECONDS
echo "############################################################################"
echo "Join nodes took $(($joinduration / 60)) minutes and $(($joinduration % 60)) seconds."
echo "############################################################################"
totalduration=$((masterduration + workerduration + joinduration))
echo "Creating and configuring cluster took $(($totalduration / 60)) minutes and $(($totalduration % 60)) seconds elapsed."
echo "############################################################################"
