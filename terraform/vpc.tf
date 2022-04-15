data "aws_caller_identity" "current" {}

resource "aws_vpc" "vpc_eks_web_app" {
  cidr_block           = "172.31.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  instance_tenancy     = "default"
}

resource "aws_internet_gateway" "eks_web_app_igw" {
  vpc_id = aws_vpc.vpc_eks_web_app.id
}

resource "aws_vpc_dhcp_options" "eks_web_app_dns_resolver" {
  domain_name = "ec2.internal"
  domain_name_servers = [
    "AmazonProvidedDNS",
  ]
  owner_id = data.aws_caller_identity.current.id
}

resource "aws_network_acl" "eks_web_app_nacl" {
  vpc_id = aws_vpc.vpc_eks_web_app.id
  subnet_ids = [
    aws_subnet.eks_web_app_public_subnet_a.id,
    aws_subnet.eks_web_app_public_subnet_b.id,
    aws_subnet.eks_web_app_public_subnet_c.id,
    aws_subnet.eks_web_app_public_subnet_d.id,
    aws_subnet.eks_web_app_public_subnet_e.id,
    aws_subnet.eks_web_app_public_subnet_f.id
  ]

  ingress {
    from_port  = 0
    to_port    = 0
    rule_no    = 100
    action     = "allow"
    protocol   = "-1"
    cidr_block = "0.0.0.0/0"
  }

  egress {
    from_port  = 0
    to_port    = 0
    rule_no    = 100
    action     = "allow"
    protocol   = "-1"
    cidr_block = "0.0.0.0/0"
  }
}

resource "aws_subnet" "eks_web_app_public_subnet_a" {
  vpc_id                  = aws_vpc.vpc_eks_web_app.id
  cidr_block              = "172.31.0.0/20"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "eks_web_app_public_subnet_b" {
  vpc_id                  = aws_vpc.vpc_eks_web_app.id
  cidr_block              = "172.31.80.0/20"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "eks_web_app_public_subnet_c" {
  vpc_id                  = aws_vpc.vpc_eks_web_app.id
  cidr_block              = "172.31.16.0/20"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "eks_web_app_public_subnet_d" {
  vpc_id                  = aws_vpc.vpc_eks_web_app.id
  cidr_block              = "172.31.32.0/20"
  availability_zone       = "us-east-1d"
  map_public_ip_on_launch = true
}


resource "aws_subnet" "eks_web_app_public_subnet_e" {
  vpc_id                  = aws_vpc.vpc_eks_web_app.id
  cidr_block              = "172.31.48.0/20"
  availability_zone       = "us-east-1e"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "eks_web_app_public_subnet_f" {
  vpc_id                  = aws_vpc.vpc_eks_web_app.id
  cidr_block              = "172.31.64.0/20"
  availability_zone       = "us-east-1f"
  map_public_ip_on_launch = true
}

resource "aws_route_table" "rtb-0ff31f37896cda611" {
  vpc_id = aws_vpc.vpc_eks_web_app.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eks_web_app_igw.id
  }
}

resource "aws_security_group" "eks_web_app_vpc_sg" {
  name        = "eks_web_app"
  description = "eks_web_app VPC security group"
  vpc_id      = aws_vpc.vpc_eks_web_app.id

  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    security_groups = []
    self            = true
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}




