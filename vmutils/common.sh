#!/bin/bash
echo "adding variables";

export VM_PATH="${HOME}/goinfre/my_vm_created_by_cli";
export VM_NAME="vmCreatedByCLI"
export VDI_FILE="${VM_PATH}/Archlinux_64.vdi"
export ARCHISO_FILE="${VM_PATH}/archlinux_bootable.iso"
export ARCHISO_VERSION="2023.03.01"

echo "${VM_PATH}";