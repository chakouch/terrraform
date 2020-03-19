variable "env" {
    type = "string"
    default = "terraform"
}

provider "aws" {
  region = "eu-west-1"
  access_key = "AKIASV3V36N47Y6RATVY"
  secret_key = "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"
}
resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"
  instance_tenancy     = "default"
  tags = {
    Name = "${var.env}-vpc"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.env}-gateway"
  }
}
#Public-1
resource "aws_subnet" "Public-1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "eu-west-1a"

  tags = {
    Name = "${var.env}-subnet-Public-1"
  }
}
#Public-2
resource "aws_subnet" "Public-2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "eu-west-1b"

  tags = {
    Name = "${var.env}-subnet-Public-2"
  }
}
#Public-3
resource "aws_subnet" "Public-3" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "eu-west-1c"

  tags = {
    Name = "${var.env}-subnet-Public-3"
  }
}
#Private-1
resource "aws_subnet" "Private-1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.4.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "eu-west-1a"

  tags = {
    Name = "${var.env}-subnet-Private-1"
  }
}
#Private-1
resource "aws_subnet" "Private-2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.5.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "eu-west-1b"

  tags = {
    Name = "${var.env}-subnet-Private-2"
  }
}
#Private-1
resource "aws_subnet" "Private-3" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.6.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "eu-west-1c"

  tags = {
    Name = "${var.env}-subnet-Private-3"
  }
}
