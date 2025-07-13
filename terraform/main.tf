provider "aws" {
region = var.region
}

resource "aws_instance" "devops_vm" {
ami = "ami-0f918f7e67a3323f0"
instance_type = "t2.micro"
key_name = var.key_name
vpc_security_group_ids = [aws_security_group.devops_sg.id]

tags = {
Name = "devops-monitoring-vm"
}
}

resource "aws_security_group" "devops_sg" {
name = "devops_sg"
description = "Allow ports for SSH, app, Grafana, Prometheus"
}

# SSH
resource "aws_security_group_rule" "ssh" {
type = "ingress"
from_port = 22
to_port = 22
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
security_group_id = aws_security_group.devops_sg.id
}

# Flask App
resource "aws_security_group_rule" "flask_app" {
type = "ingress"
from_port = 5000
to_port = 5000
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
security_group_id = aws_security_group.devops_sg.id
}

# Grafana
resource "aws_security_group_rule" "grafana" {
type = "ingress"
from_port = 3000
to_port = 3000
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
security_group_id = aws_security_group.devops_sg.id
}

# Prometheus
resource "aws_security_group_rule" "prometheus" {
type = "ingress"
from_port = 9090
to_port = 9090
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
security_group_id = aws_security_group.devops_sg.id
}

# Egress (allow all outbound)
resource "aws_security_group_rule" "egress_all" {
type = "egress"
from_port = 0
to_port = 0
protocol = "-1"
cidr_blocks = ["0.0.0.0/0"]
security_group_id = aws_security_group.devops_sg.id
}

resource "aws_s3_bucket" "monitoring_logs" {
bucket = "devops-monitoring-${random_id.suffix.hex}"
acl = "private"
}

resource "random_id" "suffix" {
byte_length = 4
}
