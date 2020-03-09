#!/bin/bash
service apache2 start
/var/ossec/bin/ossec-control start
mkdir /run/sshd
/usr/sbin/sshd -D
