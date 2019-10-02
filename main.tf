terraform {
  required_version = ">= 0.12.9"
  backend "s3" {
    bucket = "410830981177-vish-tfstate"
    region = "eu-west-1"
    key    = "vish.tfstate"
  }
}

provider "aws" {
  region = "eu-west-1"
}

resource "aws_security_group" "allow_tls" {
  name        = "vish-sg-fail"
  description = "Allow some inbound traffic"

  ingress {
    from_port   = 111
    to_port     = 111
    protocol    = "tcp"
    cidr_blocks = ["1.1.1.1/32"]
  }

  tags = {
    Name = "Vish Testing"
  }
}
