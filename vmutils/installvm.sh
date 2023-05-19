#!/bin/bash
export VM_PATH="${HOME}/my_vm_created_by_cli";
export VDI_FILE="${VM_PATH}/Archlinux_64.vdi"
export ARCHISO_FILE="${VM_PATH}/archlinux_bootable.iso"
export ARCHISO_VERSION="2023.03.01"

create_vm () {
	VBoxManage createvm --name "archVM" --basefolder="${VM_PATH}" --ostype Archlinux_64 --register
	VBoxManage modifyvm "archVM" --nic1 bridged --bridgeadapter1 eth0 --memory=1024 --vram=16 --pae=off --rtcuseutc=on
}

create_vdi () {
	# For list hdds: vboxmanage list hdds
	# For delete vdi: vboxmanage closemedium disk eaf35acc-b45b-4b8f-80f0-6877b8621311 --delete
	VBoxManage createhd --format VDI --size 16384 --variant Fixed --filename "${VDI_FILE}"
}

create_vm_sata () {
	VBoxManage storagectl "archVM" --name "SATA Controller" --add sata --bootable on
	VBoxManage storageattach "archVM" --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium "${VDI_FILE}"
}

download_archlinux_iso () {
	if [ -f "${ARCHISO_FILE}" ]; then
		echo "${ARCHISO_FILE} already exists"
	else
		curl https://theswissbay.ch/archlinux/iso/"${ARCHISO_VERSION}"/archlinux-x86_64.iso --output "${ARCHISO_FILE}"
	fi
}

attach_archlinux_iso () {
	VBoxManage storagectl "archVM" --name "IDE Controller" --add ide
	VBoxManage storageattach "archVM" --storagectl "IDE Controller" --port 0 --device 0 --type dvddrive --medium "${ARCHISO_FILE}"
}

# generate the folder
mkdir -p "${VM_PATH}"
# create the vm
create_vm
# download GNU/Linux iso
download_archlinux_iso
# set a bootable image
attach_archlinux_iso
create_vdi
# create a sata
create_vm_sata