provider "aws" {
  profile = "zerrtified-nonprod"
  region  = "ca-central-1"
  version = "~> 2.57"
}

resource "aws_security_group" "default" {
  name        = "consul_allow"
  description = "Allow Consul related traffic"
  ingress {
    description = "Server RPC"
    from_port   = 8300
    to_port     = 8300
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "LAN Serf"
    from_port   = 8301
    to_port     = 8301
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "LAN Serf"
    from_port   = 8301
    to_port     = 8301
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Wan Serf"
    from_port   = 8302
    to_port     = 8302
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Wan Serf"
    from_port   = 8302
    to_port     = 8302
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = ""
    from_port   = 8400
    to_port     = 8400
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 8500
    to_port     = 8500
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "DNS"
    from_port   = 8600
    to_port     = 8600
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "DNS"
    from_port   = 8600
    to_port     = 8600
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "consul-1" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name = "test-instance-1"
  tags = {
    Project = "consul-cluster"
    Name    = "Consul-1"
  }
}

resource "aws_instance" "consul-2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name = "test-instance-1"
  tags = {
    Project = "consul-cluster"
    Name    = "Consul-2"
  }
}

resource "aws_instance" "consul-3" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name = "test-instance-1"
  tags = {
    Project = "consul-cluster"
    Name    = "Consul-3"
  }
}
