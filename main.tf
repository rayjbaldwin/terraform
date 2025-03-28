terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "main_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "assignment"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.main_vpc.id
  count             = length(var.public_subnet_cidr_block)
  cidr_block        = element(var.public_subnet_cidr_block, count.index)
  availability_zone = element(var.azs, count.index)
  tags = {
    Name = "Public subnet ${count.index + 1}"
  }

}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.main_vpc.id
  count             = length(var.private_subnet_cidr_block)
  cidr_block        = element(var.private_subnet_cidr_block, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name = "Private subnet ${count.index + 1}"
  }
}

variable "azs" {
  type        = list(string)
  description = "Availability Zones"
  default     = ["us-east-1a", "us-east-1b"]
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "assignment gw"
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "public route table for association"
  }
}

resource "aws_route_table_association" "public_subnet_asso" {
 count = length(var.public_subnet_cidr_block)
 subnet_id      = element(aws_subnet.public_subnet[*].id, count.index)
 route_table_id = aws_route_table.public_route_table.id
}

