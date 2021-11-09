# Basic providers
provider "aws" {
  region  = "eu-west-2"
}
resource "aws_security_group" "pro_allow_all" {
  name        = "allow_all"
  description = "Allow all inbound traffic"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_all"
  }
}

resource "aws_instance" "ec2_terra" {
  ami                       = "ami-0ad8ecac8af5fc52b"
  instance_type             = "t2.micro"
  associate_public_ip_address = true
  tags = {
    Name = "ec2_terra"
  }
}
