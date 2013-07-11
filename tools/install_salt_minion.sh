#!/bin/bash

function check_root()
{
  if [ $EUID -ne 0 ]; then
    echo "This script must be run as root" 1>&2
    exit 1
  fi
}

function configure_selinux()
{
  setenforce 0
  sed -i s/'SELINUX=enforcing'/'SELINUX=disabled'/g /etc/selinux/config 
}

function stop_iptables()
{
  /etc/init.d/iptables stop
}

function install_salt()
{
  rpm -qa | grep epel-release-6-8
  if [ $? -ne 0 ]; then
    rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
    yum -y install salt-minion
  fi
}

function configure_salt()
{
  master="10.197.31.234"
    
  grep $master /etc/salt/minion 
  if [ $? -ne 0 ]; then
    sed -i s/"#master: salt"/"master: $master"/g /etc/salt/minion
  fi
}

check_root
configure_selinux
stop_iptables
install_salt
configure_salt
