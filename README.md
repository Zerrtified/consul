# consul
Three-node Consul cluster using Terraform

## Manual Consul Setup

Download and extract the Linux consul binary:
```bash
cd /usr/local/bin
sudo curl -o consul.zip https://releases.hashicorp.com/consul/1.6.0/consul_1.6.0_linux_amd64.zip
sudo unzip consul.zip
sudo rm -f consul.zip
```
Create the following directories

```bash
sudo mkdir -p /etc/consul.d/scripts
sudo mkdir /var/consul
```

On the first node, create a consul secret using the following command. This secret will be used as the encrypt vale in config.json

```bash
consul keygen
```

Update config.json with the generated secret, and also update start_join with the local IP addresses of the nodes.

Place config.json in /etc/consul.d/ on all three nodes.

place consul.service in /etc/systemd/system/ on all three nodes.

Reload the system daemons:
```bash
sudo systemctl daemon-reload
```

Start the consul service:
```bash
sudo systemctl start consul
```

Once started on all three nodes, verify the cluster status:
```bash
/usr/local/bin/consul members
Node              Address             Status  Type    Build  Protocol  DC          Segment
ip-172-31-26-59   172.31.26.59:8301   alive   server  1.6.0  2         us-central  <all>
ip-172-31-26-94   172.31.26.94:8301   alive   server  1.6.0  2         us-central  <all>
ip-172-31-30-135  172.31.30.135:8301  alive   server  1.6.0  2         us-central  <all>
```

The consul UI is acccessible from any of the nodes via :8500/ui
