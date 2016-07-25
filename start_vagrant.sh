#!/bin/bash

PARTITION=$1
DISK=$(echo $1 | cut -f1 -ds)s$(echo $1 | cut -f2 -ds)
USER=$(echo `who` | cut -f1 "-d ")
COLOR="\033[1;33m"
OFF="\x1b[0m"

unmount_disk()
{
  if mount | grep $PARTITION &>/dev/null; then
    printf "${COLOR}Unmounting ${PARTITION}$OFF\n"
    sudo umount $PARTITION &>/dev/null
    if [ ! $? -eq 0 ]; then 
      sudo umount $PARTITION
    fi
  fi
}

setup_disk()
{
  printf "${COLOR}Changing permisions for $DISK...$OFF\n"
  {
    sudo chown $USER $DISK && sudo chown $USER $PARTITION 
  } &> /dev/null
  if [ ! $? -eq 0 ]; then 
    sudo chown $USER $DISK && sudo chown $USER $PARTITION 
  fi
  printf "${COLOR}Creating rawfile sd.vmdk...$OFF\n"
  {
    VBoxManage internalcommands createrawvmdk -filename sd.vmdk -rawdisk $DISK 
  } &> /dev/null
  if [ ! $? -eq 0 ]; then 
    VBoxManage internalcommands createrawvmdk -filename sd.vmdk -rawdisk $DISK 
  fi
  printf "${COLOR}Waiting for disk to mount"
  until mount | grep $PARTITION &> /dev/null; do
    printf "."
  done
  printf "$OFF\n"
  unmount_disk
}

prepare_sd_for_vagrant()
{
  unmount_disk
  if [ ! $(ls | grep "sd.vmdk") &> /dev/null ]; then 
    setup_disk; 
    until ls | grep "sd.vmdk" &> /dev/null; do
      printf "."   
    done
    printf "\n"
    printf "${COLOR}Rawfile sd.vmdk created please add as storage in VirtualBox Manager$OFF\n"
    virtualBox &> /dev/null
    unmount_disk
  else
    printf "${COLOR}Rawfile sd.vmdk already exists$OFF\n"
    unmount_disk
  fi
}

vagrant up

if [ ! $? -eq 0 ]; then
  rm sd.vmdk
  prepare_sd_for_vagrant;
fi

vagrant up
