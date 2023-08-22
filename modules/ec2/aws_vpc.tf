// Create VPC
resource "aws_vpc" "PracticalDevOpsSD4499_vpc" {
  cidr_block       = "10.16.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "PracticalDevOpsSD4499_vpc"
  }
}

// Create Subnets
resource "aws_subnet" "PracticalDevOpsSD4499_public_subnet" {
  vpc_id                  = aws_vpc.PracticalDevOpsSD4499_vpc.id
  cidr_block              = "10.16.0.0/20"
  availability_zone       = "us-east-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Practical DevOps SD4499 Public Subnet"
  }
}

// Create Internet Gateway
resource "aws_internet_gateway" "PracticalDevOpsSD4499_igw" {
  vpc_id = aws_vpc.PracticalDevOpsSD4499_vpc.id

  tags = {
    Name = "Practical DevOps SD4499 Internet Gateway"
  }
}

// Create Route Table
resource "aws_route_table" "PracticalDevOpsSD4499_route_table" {
  vpc_id = aws_vpc.PracticalDevOpsSD4499_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.PracticalDevOpsSD4499_igw.id
  }

  tags = {
    Name = "Practical DevOps SD4499 Route Table"
  }
}

resource "aws_route_table_association" "PracticalDevOpsSD4499_route_association" {
  subnet_id      = aws_subnet.PracticalDevOpsSD4499_public_subnet.id
  route_table_id = aws_route_table.PracticalDevOpsSD4499_route_table.id
}

// Create Security Groups
resource "aws_security_group" "PracticalDevOpsSD4499_security_group" {
  name        = "Practical DevOps SD4499 Security Group"
  description = "This firewall allows SSH, HTTP and MYSQL"
  vpc_id      = aws_vpc.PracticalDevOpsSD4499_vpc.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "TCP"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Practical DevOps SD4499 Security Group"
  }
}