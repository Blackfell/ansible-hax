#!/bin/bash

export ANSIBLE_NOCOWS=1
export REBOOT="--skip-tags reboot"

while getopts dc:r option; do
  case "${option}" in
    d) export ANSIBLE_COW_SELECTION=random && export ANSIBLE_NOCOWS=0;;
    c) export ANSIBLE_COW_SELECTION=${OPTARG} && export ANSIBLE_NOCOWS=0;;
    r) export REBOOT="";;
  esac
done

ansible-playbook -i inventories/my_inventory/inventory bf.yml -K -b $REBOOT | tee playbook.log
