provider "aws" {
  region = "eu-west-2"
  access_key = "AKIASV3V36N47Y6RATVY"
  secret_key = "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"
}

resource "aws_instance" "web" {
  ami           = "ami-005c0b76f45f35b3e"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_web.id]

  tags = {
    Name = "terraform-WebInstance"
  }
}

resource "aws_security_group" "allow_web" {
  name        = "allow_web"
  description = "Allow inbound traffic"
}

resource "aws_security_group_rule" "web_egress_allow_all" {
  type            = "egress"
  from_port       = 443
  to_port         = 0
  protocol        = "-1"
  # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.allow_web.id
}

resource "aws_security_group_rule" "ingress_allow_web" {
  type            = "ingress"
  from_port       = 443
  to_port         = 443
  protocol        = "tcp"
  # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.allow_web.id
}
