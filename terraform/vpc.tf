resource "aws_vpc" "projectvpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_hostnames = "true"
  enable_dns_support   = "true"

  tags = map(
    "Name", "terraform-eks-project-node",
    "kubernetes.io/cluster/${var.cluster-name}", "shared",
    "kubernetes.io/role/elb"     = "1"
  )
}

resource "aws_subnet" "proj-pub-1" {
  vpc_id                  = aws_vpc.projectvpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE1

  tags = map(
   "Name", "terraform-eks-project-node",
   "kubernetes.io/cluster/${var.cluster-name}", "shared",
   "kubernetes.io/role/elb"     = "1"  
  )
}

resource "aws_subnet" "proj-pub-2" {
  vpc_id                  = aws_vpc.projectvpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE2
  tags = {
    Name = "proj-pub-2"
  }
}

resource "aws_subnet" "proj-priv-1" {
  vpc_id                  = aws_vpc.projectvpc.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE1
  tags = {
    Name = "proj-priv-1"
  }
}

resource "aws_subnet" "proj-priv-2" {
  vpc_id                  = aws_vpc.projectvpc.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE2
  tags = {
    Name = "proj-priv-2"
  }
}

resource "aws_route_table" "projectRT" {
  vpc_id = aws_vpc.projectvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.projIGW.id
  }
  }


resource "aws_internet_gateway" "projIGW" {
  vpc_id = aws_vpc.projectvpc.id
  tags = {
    Name = "projIGW"
  }

}

resource "aws_route_table_association" "pub-1-RTA" {
  subnet_id      = aws_subnet.proj-pub-1.id
  route_table_id = aws_route_table.projectRT.id
}


resource "aws_route_table_association" "pub-2-RTA" {
  subnet_id      = aws_subnet.proj-pub-2.id
  route_table_id = aws_route_table.projectRT.id
}

