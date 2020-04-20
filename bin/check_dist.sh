#!/bin/sh

if [ -f /etc/os-release ]; then
  ID=`cat /etc/os-release`
  case $ID in
    *ubuntu* ) echo "Ubuntu";;
    *debian* ) echo "Debian";;
    *centos* ) echo "CentOS";;
    *fedora* ) echo "Fedora";;
    *rhel* ) echo "RHEL";;
    *arch* ) echo "ArchLinux";;
    *opensuse* ) echo "OpenSUSE";;
    * ) echo "Other";;
  esac
else
  exit 1
fi
