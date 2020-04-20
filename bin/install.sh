#!/bin/bash

function choise {
  while true; do
    echo -n "$1 [Y/n]: "
    read ANS
    case $ANS in
      [Yy]*)
        return 0;;
      [Nn]*)
        return 1;;
      *)
        ;;
    esac
  done
}

function start () {
  if choise "Do you want to start install for $1?"; then
    echo "Start"
  else
    echo "Quit" && exit 0
  fi
}

if [ -f /etc/os-release ]; then
  OS_RELEASE=`cat /etc/os-release`
  case $OS_RELEASE in
    *ubuntu* ) start "Ubuntu";;
    *debian* ) start "Debian";;
    *centos* ) start "CentOS";;
    *fedora* ) start "Fedora";;
    *rhel* ) start "RHEL";;
    *arch* ) start "ArchLinux";;
    *opensuse* ) start "OpenSUSE";;
    * ) echo "Sorry, We don't support this distribution" && exit 1;;
  esac
else
  echo "Sorry, We don't support this distribution" && exit 1
fi
