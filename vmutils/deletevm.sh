#!/bin/bash
source ./common.sh

VBoxManage storageattach "${VM_NAME}" --storagectl "IDE Controller" --port 0 --device 0 --type dvddrive --medium none
VBoxManage unregistervm --delete ${VM_NAME}