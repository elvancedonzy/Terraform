# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  access_key = ""
  secret_key = ""
}


resource "aws_instance" "ec2" {
  ami           = "ami-0022f774911c1d690"
  instance_type = var.instancetype

}

resource "aws_eip" "lb" {
  vpc = true

}
resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.ec2.id
  allocation_id = aws_eip.lb.id
}

resource "aws_security_group" "allow_tls" {
  name        = "section2-security-group"

# Inbound
  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    # How to refer a variable from variables.tf 
    cidr_blocks      = [var.vpn_ip]

  }

# Inbound
  ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    # How to refer a variable from variables.tf 
    cidr_blocks      = [var.vpn_ip]

  }

  # Inbound
  ingress {
    description      = "TLS from VPC"
    from_port        = 53
    to_port          = 53
    protocol         = "tcp"
    # How to refer a variable from variables.tf 
    cidr_blocks      = [var.vpn_ip]

  }

# Outbound
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}
