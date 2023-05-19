#!/bin/bash

VBoxManage storageattach "archVM" --storagectl "IDE Controller" --port 0 --device 0 --type dvddrive --medium none
VBoxManage unregistervm --delete archVM