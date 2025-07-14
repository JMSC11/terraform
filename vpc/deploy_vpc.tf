resource "aws_vpc" "my_first_terraform_vpc" {
  cidr_block = var.mex_cidr
  tags = {
    Name = "My first tf vpc"
  }
}

resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.my_first_terraform_vpc.id
    cidr_block = var.subnets[0]
    map_public_ip_on_launch = true
    tags = {
        Name = "Public Sunbet"
    }
}

resource "aws_subnet" "private_subnet" {
    vpc_id = aws_vpc.my_first_terraform_vpc.id
    cidr_block = var.subnets[1]  
    tags = {
        Name = "Private Sunbet"
    }
}