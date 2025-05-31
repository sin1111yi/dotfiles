#!/bin/bash

interface="enp42s0"
net_status=$(cat /sys/class/net/$interface/operstate)

if [ "$net_status" = "up" ]; then
  echo " Online"
else
  echo " Offline"
fi