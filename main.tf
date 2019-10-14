terraform {
  required_version = ">= 0.12.9"
  backend "s3" {}
}

provider "aws" {
  region = "${var.region}"
}

resource "aws_security_group" "sg" {
  name        = "${var.sg_name}"
  description = "Allow some inbound traffic"

  ingress {
    from_port   = 111
    to_port     = 111
    protocol    = "tcp"
    cidr_blocks = ["1.1.1.1/32"]
  }

  tags = {
    Name = "${var.tag_name}"
  }
}
