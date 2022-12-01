#!/bin/bash

export ANSIBLE_NOCOWS=1
export REBOOT="--skip-tags reboot"
export LOCAL="--skip-tags local"

while getopts dc:rl option; do
  case "${option}" in
    d) export ANSIBLE_COW_SELECTION=random && export ANSIBLE_NOCOWS=0;;
    c) export ANSIBLE_COW_SELECTION=${OPTARG} && export ANSIBLE_NOCOWS=0;;
    r) export REBOOT="";;
    l) export LOCAL="";;
  esac
done

ansible-playbook -i inventories/my_inventory/inventory provision.yml -K -b $REBOOT $LOCAL | tee playbook.log
