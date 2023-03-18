# terraform block 
terraform {
  required_version = "~>1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.60.0"
    }
  }
}
#provider block
provider "aws" {
  region  = "ap-south-1"
  profile = "default"
}
#resource block 
resource "aws_instance" "My-Ec2-Instance" {
  ami           = "ami-0caf778a172362f1c"
  instance_type = "t2.micro"
  key_name   = "terraform"
  vpc_security_group_ids = [
    aws_security_group.allow_ssh.id
  ]
  tags = {
    Name = "My EC2 Instance"
  }
}

resource "aws_security_group" "allow_ssh" {
  name_prefix = "allow_ssh"
  ingress {
    description = "SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

