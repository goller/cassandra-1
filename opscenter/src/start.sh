#!/usr/bin/env bash

IP=`hostname --ip-address`

sed -i -e "s/^interface.*/interface = $IP/" /etc/opscenter/opscenterd.conf
echo "[agents]" >> /etc/opscenter/opscenterd.conf
echo "ssh_port = 2222"  >> /etc/opscenter/opscenterd.conf

echo Starting OpsCenter on $IP...
service opscenterd start
tail -f /var/log/opscenter/opscenterd.log
