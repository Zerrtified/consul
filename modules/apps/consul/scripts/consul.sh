#!/bin/bash

# Create directory structure
mkdir -p /etc/consul.d/scripts
mkdir /var/consul

# Download and unzip consul binaries
curl -o /usr/local/bin/consul.zip https://releases.hashicorp.com/consul/1.6.0/consul_1.6.0_linux_amd64.zip
unzip /usr/local/bin/consul.zip
rm -f /usr/local/bin/consul.zip

# Place config.json in /etc/consul.d/

# Place consul.zervice in /etc/systemd/system/ 

# Reload system daemons
systemctl daemon-Reload

# Start the consul service
systemctl start consul
systemctl enable consul