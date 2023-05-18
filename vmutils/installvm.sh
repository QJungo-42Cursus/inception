#!/bin/bash
source ./common.sh

create_vm () {
	VBoxManage createvm --name "${VM_NAME}" --basefolder="${VM_PATH}" --ostype Archlinux_64 --register
	VBoxManage modifyvm "${VM_NAME}" --nic1 bridged --bridgeadapter1 eth0 --memory=1024 --vram=16 --pae=off --rtcuseutc=on
}

create_vdi () {
	# For list hdds: vboxmanage list hdds
	# For delete vdi: vboxmanage closemedium disk eaf35acc-b45b-4b8f-80f0-6877b8621311 --delete
	VBoxManage createhd --format VDI --size 16384 --variant Fixed --filename "${VDI_FILE}"
}

create_vm_sata () {
	VBoxManage storagectl "${VM_NAME}" --name "SATA Controller" --add sata --bootable on
	VBoxManage storageattach "${VM_NAME}" --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium "${VDI_FILE}"
}

download_archlinux_iso () {
	if [ -f "${ARCHISO_FILE}" ]; then
		echo "${ARCHISO_FILE} already exists"
	else
		curl https://theswissbay.ch/archlinux/iso/"${ARCHISO_VERSION}"/archlinux-x86_64.iso --output "${ARCHISO_FILE}"
	fi
}

attach_archlinux_iso () {
	VBoxManage storagectl "${VM_NAME}" --name "IDE Controller" --add ide
	VBoxManage storageattach "${VM_NAME}" --storagectl "IDE Controller" --port 0 --device 0 --type dvddrive --medium "${ARCHISO_FILE}"
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